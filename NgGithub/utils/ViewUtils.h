//
//  ViewUtils.h
//  NgGithub
//
//  Created by 小瓜瓜 on 2021/6/20.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class MyUILable;

NS_ASSUME_NONNULL_BEGIN

@interface ViewUtils : NSObject

+ (MyUILable * _Nonnull)getUILable:(NSTextAlignment * _Nonnull)gravity
                 isBold:(BOOL)isBold
                   size:(NSInteger)size;

@end

NS_ASSUME_NONNULL_END
