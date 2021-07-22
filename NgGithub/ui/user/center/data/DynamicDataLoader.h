//
//  DynamicDataLoader.h
//  NgGithub
//
//  Created by 小瓜瓜 on 2021/7/18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class MsgModel;

//动态信息回调
typedef void(^ DynamicFinishBlock)(BOOL success,  NSMutableArray *dataArray);

@interface DynamicDataLoader : NSObject

- (void)loadDynamicData:(NSString *)token block:(DynamicFinishBlock)finishBlock;

 


@end

NS_ASSUME_NONNULL_END
