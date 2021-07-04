//
//  BaseViewController.h
//  NgGithub
//
//  Created by 小瓜瓜 on 2021/6/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController

- (void)refreshData:(NSString *)token;

- (void)refreshView;

@end

NS_ASSUME_NONNULL_END
