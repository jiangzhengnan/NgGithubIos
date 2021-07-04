//
//  TextUtils.h
//  NgGithub
//
//  Created by 小瓜瓜 on 2021/6/12.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TextUtils : NSObject
+(BOOL) isBlankString:(NSString *)string;

+ (NSString *)getClientId;
+ (NSString *)getClientSecret;

+(NSMutableAttributedString *) getPicText:(NSString *)input pic:(NSString *)picName;
@end
