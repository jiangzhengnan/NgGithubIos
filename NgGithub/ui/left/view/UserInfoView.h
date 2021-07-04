//
//  UserInfoView.h
//  NgGithub
//
//  Created by 小瓜瓜 on 2021/6/21.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class UserModel;

@interface UserInfoView : UIView
@property(nonatomic, strong) UserModel *model;

@end

NS_ASSUME_NONNULL_END
