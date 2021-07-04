//
//  UserDataManager.h
//  NgGithub
//
//  Created by 小瓜瓜 on 2021/6/12.
//

#import <Foundation/Foundation.h>
@class UserModel;

NS_ASSUME_NONNULL_BEGIN

@interface UserDataManager : NSObject
+(void) setAccessToken : (NSString *) str;
+(NSString *) getAccessToken;

+(void) setAccessTokenTime : (NSInteger) str;
+(NSInteger) getAccessTokenTime;

+(void) setUserInfo :(NSString*) info;
+(UserModel *) getUserInfo;

@end

NS_ASSUME_NONNULL_END
