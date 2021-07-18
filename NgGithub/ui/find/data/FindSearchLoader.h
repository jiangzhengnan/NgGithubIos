//
//  FindSearchLoader.h
//  NgGithub
//
//  Created by 小瓜瓜 on 2021/7/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


@class RepoModel;

//仓库信息回调
typedef void(^UserSearchFinishBlock)(BOOL success, NSMutableArray *dataArray);

@interface FindSearchLoader : NSObject

- (void)loadAllResp:(NSString *)token key:(NSString *) key block:(UserSearchFinishBlock)finishBlock;


@end


NS_ASSUME_NONNULL_END
