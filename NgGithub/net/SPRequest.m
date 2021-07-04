//
//  SPRequest.m
//  NgGithub
//
//  Created by 小瓜瓜 on 2021/6/14.
//

#import "SPRequest.h"

@implementation SPRequest

+ (instancetype)request {
  return [[self alloc] init];
}

- (instancetype)init {
  self = [super init];
  if (self) {
    self.operationManager = [AFHTTPSessionManager manager];
    self.startRequestDate = [NSDate date];
  }
  return self;
}

- (void)GET:(NSString *)URLString
    parameters:(NSDictionary *)parameters
       headers:(NSDictionary *)headers
       success:(void (^)(SPRequest *request, NSString *responseString))success
       failure:(void (^)(SPRequest *request, NSError *error))failure {
  self.operationQueue = self.operationManager.operationQueue;
  self.operationManager.responseSerializer =
      [AFHTTPResponseSerializer serializer];

  [self.operationManager GET:URLString
      parameters:parameters
      headers:headers
      progress:^(NSProgress *_Nonnull downloadProgress) {
        NSLog(@"%@", downloadProgress);
      }
      success:^(NSURLSessionDataTask *_Nonnull task,
                id _Nullable responseObject) {
        // 请求结果
        NSString *responseJson =
            [[NSString alloc] initWithData:responseObject
                                  encoding:NSUTF8StringEncoding];
        success(self, responseJson);

        // 打印相关Log
        [self printRequestMessage:task];
        NSLog(@"success:✅✅✅\n%@", responseJson);
      }
      failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        failure(self, error);

        // 打印相关Log
        [self printRequestMessage:task];
        NSLog(@"failure:❌❌❌\n%@", error.localizedDescription);
      }];
}

- (void)POST:(NSString *)URLString
    parameters:(NSDictionary *)parameters
       headers:(NSDictionary *)headers
       success:(void (^)(SPRequest *request, NSString *responseString))success
       failure:(void (^)(SPRequest *request, NSError *error))failure {
  self.operationQueue = self.operationManager.operationQueue;
  self.operationManager.responseSerializer =
      [AFJSONResponseSerializer serializer];

  [self.operationManager POST:URLString
      parameters:parameters
      headers:headers
      progress:^(NSProgress *_Nonnull uploadProgress) {
        NSLog(@"%@", uploadProgress);
      }
      success:^(NSURLSessionDataTask *_Nonnull task,
                id _Nullable responseObject) {
        // 请求结果
        NSString *responseJson =
            [[NSString alloc] initWithData:responseObject
                                  encoding:NSUTF8StringEncoding];
        success(self, responseJson);

        // 打印相关Log
        [self printRequestMessage:task];
        NSLog(@"success:✅✅✅\n%@", responseJson);
      }
      failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        failure(self, error);

        // 打印相关Log
        [self printRequestMessage:task];
        NSLog(@"failure:❌❌❌\n%@", error.localizedDescription);
      }];
}

- (void)postWithURL:(NSString *)URLString
         parameters:(NSDictionary *)parameters {
  [self POST:URLString
      parameters:parameters
     headers:nil
      success:^(SPRequest *request, NSString *responseString) {
        if ([self.delegate respondsToSelector:@selector(SPRequest:finished:)]) {
          [self.delegate SPRequest:request finished:responseString];
        }
      }
      failure:^(SPRequest *request, NSError *error) {
        if ([self.delegate respondsToSelector:@selector(SPRequest:Error:)]) {
          [self.delegate SPRequest:request Error:error.description];
        }
      }];
}

- (void)getWithURL:(NSString *)URLString {
  [self GET:URLString
      parameters:nil
    headers:nil
      success:^(SPRequest *request, NSString *responseString) {
        if ([self.delegate respondsToSelector:@selector(SPRequest:finished:)]) {
          [self.delegate SPRequest:request finished:responseString];
        }
      }
      failure:^(SPRequest *request, NSError *error) {
        if ([self.delegate respondsToSelector:@selector(SPRequest:Error:)]) {
          [self.delegate SPRequest:request Error:error.description];
        }
      }];
}

- (void)cancelAllOperations {
  [self.operationQueue cancelAllOperations];
}

- (void)printRequestMessage:(NSURLSessionDataTask *)task {
  /*
  // 请求URL
  NSLog(@"请求URL:%@\n",task.originalRequest.URL);

  // 请求方式
  NSLog(@"请求方式:%@\n",task.originalRequest.HTTPMethod);

  // 请求头信息
  NSLog(@"请求头信息:%@\n",task.originalRequest.allHTTPHeaderFields);

  // 请求正文信息
  NSLog(@"请求正文信息:%@\n",[[NSString alloc]
  initWithData:task.originalRequest.HTTPBody encoding:NSUTF8StringEncoding]);
  */

  // 请求响应时间
  NSTimeInterval time =
      [[NSDate date] timeIntervalSinceDate:self.startRequestDate];
  NSLog(@"请求响应时间:%@\n", @(time));
  NSLog(
      @"\n请求URL:%@\n请求方式:%@\n请求头信息:%@\n请求正文信息:%@"
      @"\n请求响应时间:%@\n",
      task.originalRequest.URL, task.originalRequest.HTTPMethod,
      task.originalRequest.allHTTPHeaderFields,
      [[NSString alloc] initWithData:task.originalRequest.HTTPBody
                            encoding:NSUTF8StringEncoding],
      @(time));
}

@end
