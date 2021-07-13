//
//  MsgDataLoader.m
//  NgGithub
//
//  Created by 小瓜瓜 on 2021/7/13.
//

#import "MsgDataLoader.h"
#import "UserModel.h"
#import <AFNetworking.h>
#import "UserDataManager.h"
#import "SPRequest.h"
@interface MsgDataLoader ()

@end

@implementation MsgDataLoader


- (void)loadMsgData:(NSString *)token
                block:(UserMsgFinishBlock)finishBlock {
//  NSDictionary *dict = @{
//      @"Accept" : @"application/vnd.github.v3+json"
//  };
    NSDictionary *dict = @{@"accept" : @"application/vnd.github.v3+json"};

    token = @"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";
    NSString *tokenFormat = [NSString stringWithFormat:@"token %@", token];
    NSDictionary *headers = @{
        @"Authorization" : tokenFormat};
    NSLog(@"loadUserMsg 开始");
  UserModel *userModel = [UserDataManager getUserInfo];
  NSString *msgUrl = @"https://api.github.com/notifications";
  SPRequest *requestUtil = SPRequest.request;
  [requestUtil GET:msgUrl
      parameters:dict
      headers:headers
      success:^(SPRequest *request, NSString *responseString) {
        NSLog(@"msg 请求成功---%@", responseString);
        NSData *jsonData =
            [responseString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *err;
        NSDictionary *dic = [NSJSONSerialization
            JSONObjectWithData:jsonData
                       options:NSJSONReadingMutableContainers
                         error:&err];
      }
      failure:^(SPRequest *request, NSError *error) {
        NSLog(@"请求失败,服务器返回的错误信息%@", error);
      }];
}

@end
