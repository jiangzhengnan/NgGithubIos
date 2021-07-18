//
//  FindSearchLoader.m
//  NgGithub
//
//  Created by 小瓜瓜 on 2021/7/14.
//

#import "FindSearchLoader.h"
#import <AFNetworking.h>
#import "SPRequest.h"
#import "RepoModel.h"
#import "UserModel.h"
#import "UserDataManager.h"

@implementation FindSearchLoader



- (void)loadAllResp:(NSString *)token
                key:(NSString *) key
                block:(UserSearchFinishBlock)finishBlock {
  NSDictionary *dict = @{@"accept" : @"application/vnd.github.v3+json"};
    if (!key || key.length==0) {
        key = @"language:java";
    }
    NSLog(@"搜索key %@", key);
    NSString *searchUrl =[NSString stringWithFormat:@"https://api.github.com/search/repositories?q=%@&sort=stars",key];
    NSLog(@"搜索地址 %@", searchUrl);
  SPRequest *requestUtil = SPRequest.request;
  [requestUtil GET:searchUrl
      parameters:nil
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
      
      NSDictionary *itemsDic = [dic objectForKey:@"items"];
        NSMutableArray *repoModelList = [[NSMutableArray alloc] init];
        if (itemsDic) {
          for (NSDictionary *tempDic in itemsDic) {
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
