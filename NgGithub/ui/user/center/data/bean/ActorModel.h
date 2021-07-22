//
//  ActorModel.h
//  NgGithub
//
//  Created by 小瓜瓜 on 2021/7/18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ActorModel : NSObject
@property(nonatomic, assign) long id;
@property(nonatomic, copy) NSString* display_login;
@property(nonatomic, copy) NSString* url;
@property(nonatomic, copy) NSString* avatar_url;
@end

NS_ASSUME_NONNULL_END
