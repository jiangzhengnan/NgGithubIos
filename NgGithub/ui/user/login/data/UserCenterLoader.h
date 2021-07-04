//
//  UserCenterLoader.h
//  NgGithub
//
//  Created by 小瓜瓜 on 2021/6/30.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class UserModel;
@class RepoModel;

//用户信息回调
typedef void(^UserInfoFinishBlock)(BOOL success);
//仓库信息回调
typedef void(^UserReposFinishBlock)(BOOL success, NSArray<RepoModel *> *dataArray);

@interface UserCenterLoader : UILabel

- (void)loadUserInfo:(NSString *)token block:(UserInfoFinishBlock)finishBlock;


- (void)loadUserRepos:(NSString *)token block:(UserReposFinishBlock)finishBlock;

@end

NS_ASSUME_NONNULL_END
