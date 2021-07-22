//
//  DynamicModel.h
//  NgGithub
//
//  Created by 小瓜瓜 on 2021/7/18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class ActorModel;
@interface DynamicModel : NSObject
@property(nonatomic, assign) long id;
@property(nonatomic, copy) NSString* type;

@property(nonatomic, retain) ActorModel* actor;


@end

NS_ASSUME_NONNULL_END

