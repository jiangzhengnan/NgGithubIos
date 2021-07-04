//
//  HomeDataLoader.m
//  NgGithub
//
//  Created by 小瓜瓜 on 2021/6/5.
//

#import "HomeDataLoader.h"
#import <AFNetworking.h>
#import "SPRequest.h"
#import "RepoModel.h"
#import "UserModel.h"
#import "UserDataManager.h"

@interface HomeDataLoader ()

@end

/**
 首页请求
 */
@implementation HomeDataLoader

- (void)loadUserRepos:(NSString *)token
                block:(UserReposFinishBlock)finishBlock {
  NSDictionary *dict = @{@"accept" : @"application/vnd.github.v3+json"};
  UserModel *userModel = [UserDataManager getUserInfo];
  NSString *userUrl = userModel.repos_url;
  SPRequest *requestUtil = SPRequest.request;
  [requestUtil GET:userUrl
      parameters:dict
      headers:nil
      success:^(SPRequest *request, NSString *responseString) {
        NSLog(@"请求成功---%@", responseString);
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
            RepoModel *resultModel = [[RepoModel alloc] init];
            [resultModel setValuesForKeysWithDictionary:tempDic];
            [repoModelList addObject:resultModel];
          }

          [repoModelList sortUsingComparator:^NSComparisonResult(
                             id _Nonnull obj1, id _Nonnull obj2) {
            RepoModel *model1 = obj1;
            RepoModel *model2 = obj2;
            return model1.watchers < model2.watchers;
          }];
          finishBlock(YES, repoModelList);
        }
      }
      failure:^(SPRequest *request, NSError *error) {
        NSLog(@"请求失败,服务器返回的错误信息%@", error);
      }];
}

@end
