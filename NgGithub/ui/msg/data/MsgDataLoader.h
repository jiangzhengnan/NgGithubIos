//
//  MsgDataLoader.h
//  NgGithub
//
//  Created by 小瓜瓜 on 2021/7/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class MsgModel;

//仓库信息回调
typedef void(^UserMsgFinishBlock)(BOOL success, NSMutableArray *dataArray);

@interface MsgDataLoader : NSObject

- (void)loadMsgData:(NSString *)token block:(UserMsgFinishBlock)finishBlock;

 


@end

NS_ASSUME_NONNULL_END
