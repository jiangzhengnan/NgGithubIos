//
//  UserDataManager.m
//  NgGithub
//
//  Created by 小瓜瓜 on 2021/6/12.
//

#import "UserDataManager.h"
#import "UserModel.h"
// token
#define APP_ACCESS_TOKEN @"app_access_token"
#define APP_ACCESS_TOKEN_TIME @"app_access_token_time"

// userinfo
#define APP_USER_INFO @"app_user_info"

@implementation UserDataManager

+ (void)setUserInfo:(NSString *)info {
  [[NSUserDefaults standardUserDefaults] setObject:info forKey:APP_USER_INFO];
}
+ (UserModel *)getUserInfo {
  NSString *responseString =
      [[NSUserDefaults standardUserDefaults] objectForKey:APP_USER_INFO];
  NSData *jsonData = [responseString dataUsingEncoding:NSUTF8StringEncoding];
  NSError *err;
  NSDictionary *dic =
      [NSJSONSerialization JSONObjectWithData:jsonData
                                      options:NSJSONReadingMutableContainers
                                        error:&err];
  if (dic) {
    UserModel *resultModel = [[UserModel alloc] init];
    [resultModel setValuesForKeysWithDictionary:dic];
    return resultModel;
  } else {
    return nil;
  }
}
+ (void)setAccessToken:(NSString *)str {
  NSTimeInterval time = [[NSDate date] timeIntervalSince1970];
  [self setAccessTokenTime:time];
  [[NSUserDefaults standardUserDefaults] setObject:str forKey:APP_ACCESS_TOKEN];
}
+ (NSString *)getAccessToken {
  return [[NSUserDefaults standardUserDefaults] objectForKey:APP_ACCESS_TOKEN];
}

+ (void)setAccessTokenTime:(NSInteger)str {
  [[NSUserDefaults standardUserDefaults] setInteger:str
                                             forKey:APP_ACCESS_TOKEN_TIME];
}
+ (NSInteger)getAccessTokenTime {
  return [[NSUserDefaults standardUserDefaults]
      integerForKey:APP_ACCESS_TOKEN_TIME];
}

@end
