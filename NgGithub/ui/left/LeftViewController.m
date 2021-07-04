//
//  LeftViewController.m
//  NgGithub
//
//  Created by 小瓜瓜 on 2021/7/3.
//

#import "LeftViewController.h"
#import "LoginController.h"
#import <AFNetworking.h>
#import "UserDataManager.h"
#import "TextUtils.h"
#import "SPRequest.h"
#import <SDWebImage/SDWebImage.h>
#import "UserModel.h"
#import "UserInfoView.h"
#import "UserCenterLoader.h"

@interface LeftViewController () {
}
//用户个人信息
@property(nonatomic, strong) UserInfoView *userInfoView;

//数据类
@property(nonatomic, strong) UserModel *userModel;
@end

@implementation LeftViewController

- (void)viewDidAppear:(BOOL)animated {
}

- (void)viewDidLoad {
  [super viewDidLoad];
  NSLog(@"刷新用户 viewDidLoad");
  self.navigationItem.title = @"个人信息";
  self.view.backgroundColor = [UIColor whiteColor];
}

- (void)refreshData {
  NSLog(@"刷新左侧 用户信息数据");
  self.userModel = [UserDataManager getUserInfo];
  if (self.userModel) {
    [self refreshView];
  }
}

- (void)refreshView {
  NSLog(@"刷新用户布局");
  self.navigationController.navigationBar.translucent = NO;
  self.tabBarController.tabBar.translucent = NO;
  // 创建自定义的View
  _userInfoView = [[UserInfoView alloc] init];
  [_userInfoView setModel:_userModel];
  // 设置frame
  _userInfoView.frame = CGRectMake(0, 0, self.view.bounds.size.width, 300);
  UIScrollViewContentInsetAdjustmentNever;
  // 添加子控件
  [self.view addSubview:_userInfoView];
}

@end
