//
//  HomeDataLoader.h
//  NgGithub
//
//  Created by 小瓜瓜 on 2021/6/5.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class RepoModel;

//仓库信息回调
typedef void(^UserReposFinishBlock)(BOOL success, NSMutableArray *dataArray);

@interface HomeDataLoader : NSObject

- (void)loadUserRepos:(NSString *)token block:(UserReposFinishBlock)finishBlock;


@end

NS_ASSUME_NONNULL_END
