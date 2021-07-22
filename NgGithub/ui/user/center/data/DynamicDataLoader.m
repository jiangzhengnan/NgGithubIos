//
//  DynamicDataLoader.m
//  NgGithub
//
//  Created by 小瓜瓜 on 2021/7/18.
//

#import "DynamicDataLoader.h"
#import "UserModel.h"
#import <AFNetworking.h>
#import "UserDataManager.h"
#import "SPRequest.h"
#import "DynamicModel.h"
@implementation DynamicDataLoader

- (void)loadDynamicData:(NSString *)token
                  block:(DynamicFinishBlock)finishBlock {
  NSDictionary *dict = @{@"accept" : @"application/vnd.github.v3+json"};
  NSLog(@"loadDynamicData 开始");
    UserModel *userModel = [UserDataManager getUserInfo];
  NSString *msgUrl = userModel.received_events_url;
  SPRequest *requestUtil = SPRequest.request;
  [requestUtil GET:msgUrl
      parameters:dict
      headers:nil
      success:^(SPRequest *request, NSString *responseString) {
        NSLog(@"loadDynamicData 请求成功---%@", responseString);
        NSData *jsonData =
            [responseString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *err;
        NSDictionary *dic = [NSJSONSerialization
            JSONObjectWithData:jsonData
                       options:NSJSONReadingMutableContainers
                         error:&err];

      NSMutableArray *repoModelList = [[NSMutableArray alloc] init];
      if (dic) {
        for (NSDictionary *tempDic in dic) {
          [repoModelList addObject:tempDic];
        }
        finishBlock(YES, repoModelList);
      }
      }
      failure:^(SPRequest *request, NSError *error) {
        NSLog(@"请求失败,服务器返回的错误信息%@", error);
      }];
}

@end
