//
//  UserController.m
//  NgGithub
//
//  Created by 小瓜瓜 on 2021/6/6.
//

#import "LoginController.h"
#import <WebKit/WebKit.h>
#import "TextUtils.h"
#import <AFNetworking.h>
#import "UserDataManager.h"
#import "MainController.h"
#import "UserCenterLoader.h"
#import "UserModel.h"

@interface LoginController () <WKNavigationDelegate> {
  WKWebView *webView;
}
@property(nonatomic, strong, readwrite) UserCenterLoader *userLoader;
@end

@implementation LoginController

- (void)viewDidLoad {
  [super viewDidLoad];

  [self getLogin];
}

- (void)getLogin {
  NSLog(@"开始登陆");

  NSString *loginUrl =
      @"https://github.com/login/oauth/authorize?client_id"
       "=3ad49d345a0e41bb10c9&state=app&"
       "redirect_uri=NgGithubApp://authed";
  webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
  webView.navigationDelegate = self;
  [webView
      loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:loginUrl]]];
  [self.view addSubview:webView];
}

//蒋征南 url: nggithubapp://authed?code=418d29c1b7c6df5d4fe0&state=app
- (BOOL)getCodeSuccess:(NSString *)url {
  __block NSString *code = nil;
  NSURLComponents *components = [[NSURLComponents alloc] initWithString:url];
  [components.queryItems
      enumerateObjectsUsingBlock:^(NSURLQueryItem *_Nonnull obj, NSUInteger idx,
                                   BOOL *_Nonnull stop) {
        NSURLQueryItem *item = (NSURLQueryItem *)obj;
        NSString *paramsName = item.name;
        NSString *paramsValue = item.value;
        if ([paramsName isEqualToString:@"code"] &&
            ![TextUtils isBlankString:paramsValue]) {
          code = paramsValue;

          if ([TextUtils isBlankString:code]) {
            NSLog(@"getAccessToken 拿到的code为空");
          } else {
            [self getAccessToken:code];
          }
          //[self dismissViewControllerAnimated:YES completion:nil];
          // [self.navigationController popViewControllerAnimated:YES];
        }
      }];

  return true;
}

- (void)getAccessToken:(NSString *)code {
  NSLog(@"getAccessToken 拿到的code: %@", code);
  NSString *urlString = @"https://github.com/login/oauth/access_token";
  // NSURL *url = [NSURL URLWithString:urlString];
  NSString *cliendId = [TextUtils getClientId];
  NSString *cliendSecret = [TextUtils getClientSecret];
  NSLog(@"cliendId : %@", cliendId);
  NSLog(@"cliendSecret : %@", cliendSecret);

  NSDictionary *dict = @{
    @"client_id" : cliendId,
    @"client_secret" : cliendSecret,
    @"code" : code
  };
  NSLog(@"getAccessToken  请求数据: %@", dict.description);
  AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
  manager.requestSerializer = [AFJSONRequestSerializer serializer];
  manager.responseSerializer = [AFJSONResponseSerializer serializer];
  NSDictionary *headers = @{@"Accept" : @"application/json"};

  [manager GET:@"https://github.com/login/oauth/access_token?"
      parameters:dict
      headers:headers
      progress:nil
      success:^(NSURLSessionDataTask *_Nonnull task,
                id _Nullable responseObject) {
        NSLog(@"请求成功---%@", responseObject);
        NSDictionary *result = responseObject;
        NSString *token = [result objectForKey:@"access_token"];

        NSLog(@"token---%@", token);
        if (![TextUtils isBlankString:token]) {
          self.userLoader = [[UserCenterLoader alloc] init];
          __weak typeof(self) wself = self;
          [self.userLoader loadUserInfo:token block:^(BOOL success) {
            __strong typeof(wself) strongSelf = wself;
              
              [UserDataManager setAccessToken:token];

            if (self.NextViewControllerBlock) {
                self.NextViewControllerBlock(token);
                [self dismissViewControllerAnimated:YES completion:nil];
            }
          }];
        }

        /**
         {
             "access_token" = "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";
             scope = "";
             "token_type" = bearer;
         }
         */
      }
      failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        NSLog(@"请求失败,服务器返回的错误信息%@", error);
        [self dismissViewControllerAnimated:YES completion:nil];
      }];
}

#pragma mark - WKNavigationDelegate
// 页面开始加载时调用 2
- (void)webView:(WKWebView *)webView
    didStartProvisionalNavigation:(WKNavigation *)navigation {
}
// 当内容开始返回时调用 3
- (void)webView:(WKWebView *)webView
    didCommitNavigation:(WKNavigation *)navigation {
}
// 页面加载完成之后调用 4
- (void)webView:(WKWebView *)webView
    didFinishNavigation:(WKNavigation *)navigation {
}
// 页面加载失败时调用
- (void)webView:(WKWebView *)webView
    didFailProvisionalNavigation:(WKNavigation *)navigation {
}
// 接收到服务器跳转请求之后调用
- (void)webView:(WKWebView *)webView
    didReceiveServerRedirectForProvisionalNavigation:
        (WKNavigation *)navigation {
}
// 在收到响应后，决定是否跳转
- (void)webView:(WKWebView *)webView
    decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse
                      decisionHandler:(void (^)(WKNavigationResponsePolicy))
                                          decisionHandler {
  NSLog(@"%@", navigationResponse.response.URL.absoluteString);
  //允许跳转
  decisionHandler(WKNavigationResponsePolicyAllow);
  //不允许跳转
  // decisionHandler(WKNavigationResponsePolicyCancel);
}
// 在发送请求之前，决定是否跳转 1
- (void)webView:(WKWebView *)webView
    decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction
                    decisionHandler:
                        (void (^)(WKNavigationActionPolicy))decisionHandler {
  NSString *url = navigationAction.request.URL.absoluteString;
  NSLog(@"蒋征南 url: %@", url);

  BOOL isContainerCode = [self getCodeSuccess:url];

  if (isContainerCode) {
    [self.view willRemoveSubview:webView];
  }

  //允许跳转
  decisionHandler(WKNavigationActionPolicyAllow);

  //不允许跳转
  // decisionHandler(WKNavigationActionPolicyCancel);
}

#pragma mark - WKUIDelegate
// 创建一个新的WebView
- (WKWebView *)webView:(WKWebView *)webView
    createWebViewWithConfiguration:(WKWebViewConfiguration *)configuration
               forNavigationAction:(WKNavigationAction *)navigationAction
                    windowFeatures:(WKWindowFeatures *)windowFeatures {
  return [[WKWebView alloc] init];
}
// 输入框
- (void)webView:(WKWebView *)webView
    runJavaScriptTextInputPanelWithPrompt:(NSString *)prompt
                              defaultText:(nullable NSString *)defaultText
                         initiatedByFrame:(WKFrameInfo *)frame
                        completionHandler:
                            (void (^)(NSString *__nullable result))
                                completionHandler {
  NSLog(@"prompt = %@", prompt);
  completionHandler(@"http");
}
// 确认框
- (void)webView:(WKWebView *)webView
    runJavaScriptConfirmPanelWithMessage:(NSString *)message
                        initiatedByFrame:(WKFrameInfo *)frame
                       completionHandler:
                           (void (^)(BOOL result))completionHandler {
  NSLog(@"message = %@", message);
  completionHandler(YES);
}
// 警告框
- (void)webView:(WKWebView *)webView
    runJavaScriptAlertPanelWithMessage:(NSString *)message
                      initiatedByFrame:(WKFrameInfo *)frame
                     completionHandler:(void (^)(void))completionHandler {
  NSLog(@"message = %@", message);
  UIAlertController *alertController =
      [UIAlertController alertControllerWithTitle:message
                                          message:nil
                                   preferredStyle:UIAlertControllerStyleAlert];
  [alertController
      addAction:[UIAlertAction actionWithTitle:@"OK"
                                         style:UIAlertActionStyleCancel
                                       handler:^(UIAlertAction *action) {
                                         completionHandler();
                                       }]];
  [self presentViewController:alertController animated:YES completion:nil];
}

@end
