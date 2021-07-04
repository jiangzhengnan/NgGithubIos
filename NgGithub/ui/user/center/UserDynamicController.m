//
//  UserController.m
//  NgGithub
//
//  Created by 小瓜瓜 on 2021/6/12.
//

#import "UserDynamicController.h"

#import "LoginController.h"
#import <AFNetworking.h>
#import "UserDataManager.h"
#import "TextUtils.h"
#import "SPRequest.h"
#import <SDWebImage/SDWebImage.h>
#import "UserModel.h"
#import "UserInfoView.h"
#import "UserCenterLoader.h"
#import "UIViewController+MMDrawerController.h"
#import "MMDrawerBarButtonItem.h"
#import "LeftViewController.h"
@interface UserDynamicController () {
}

@end

@implementation UserDynamicController

- (void)viewDidLoad {
  [super viewDidLoad];
  // self.tabBarController.navigationItem.title = @"用户";

  self.view.backgroundColor = [UIColor whiteColor];
}


- (void)refreshData:(NSString *)token {
  NSLog(@"刷新用户动态数据");
}

- (void)refreshView {
  NSLog(@"刷新用户动态布局");
}

@end
