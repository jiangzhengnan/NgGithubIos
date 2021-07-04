//
//  UserCenterLoader.m
//  NgGithub
//
//  Created by 小瓜瓜 on 2021/6/30.
//

#import "SPRequest.h"
#import "UserCenterLoader.h"
#import "UserModel.h"
#import "UserDataManager.h"

@implementation UserCenterLoader

- (void)loadUserInfo:(NSString *)token block:(UserInfoFinishBlock)finishBlock{
    NSDictionary *dict = @{@"accept" : @"application/vnd.github.v3+json"};
    NSString *tokenFormat = [NSString stringWithFormat:@"token %@", token];
    NSDictionary *headers = @{@"Authorization" : tokenFormat};
    NSString *userUrl = @"https://api.github.com/user";
    SPRequest *requestUtil = SPRequest.request;
    [requestUtil GET:userUrl
        parameters:dict
        headers:headers
        success:^(SPRequest *request, NSString *responseString) {
          NSLog(@"请求成功---%@", responseString);
        [UserDataManager setUserInfo:responseString];
            finishBlock(YES);
        
        }
        failure:^(SPRequest *request, NSError *error) {
          NSLog(@"请求失败,服务器返回的错误信息%@", error);
        }];
}


- (void)loadUserRepos:(NSString *)token block:(UserReposFinishBlock)finishBlock{
    
}
@end
