//
//  UserController.h
//  NgGithub
//
//  Created by 小瓜瓜 on 2021/6/6.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoginController : UIViewController

@property (nonatomic, copy)
void
(^NextViewControllerBlock)(NSString *token);

@end

NS_ASSUME_NONNULL_END
