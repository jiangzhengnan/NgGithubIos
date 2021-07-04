//
//  MainController.m
//  NgGithub
//
//  Created by 小瓜瓜 on 2021/6/13.
//

#import "MainController.h"
#import "HomeController.h"
#import "UserDynamicController.h"
#import "FindController.h"
#import "MsgController.h"
#import "LoginController.h"
#import "UserDataManager.h"
#import "BaseViewController.h"
#import "TextUtils.h"
#import "UIViewController+MMDrawerController.h"
#import "MMDrawerBarButtonItem.h"

@interface MainController () {
}
@property(nonatomic, strong, readwrite) BaseViewController* homeController;
@property(nonatomic, strong, readwrite) BaseViewController* msgController;
@property(nonatomic, strong, readwrite) BaseViewController* findController;
@property(nonatomic, strong, readwrite) BaseViewController* userController;
@property(nonatomic, strong, readwrite) NSArray* controllers;
@end

@implementation MainController

- (instancetype)init {
  self = [super init];
  if (self) {
  }
  return self;
}
/**
 *  加载控制器的时候设置打开抽屉模式  (因为在后面会关闭)
 */
- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  //设置打开抽屉模式
  [self.mm_drawerController
      setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
}

- (void)viewDidLoad {
  //顶部tab 25292E
  [self.navigationItem setTitle:@"weishabuxianshi"];

  //底部bottom
  UITabBarController* tabbarController = [[UITabBarController alloc] init];
  //仓库
  _homeController = [[HomeController alloc] init];
  _homeController.tabBarItem.title = @"仓库";
  _homeController.tabBarItem.image =
      [UIImage imageNamed:@"icon.bundle/item_home_un_select.png"];
  _homeController.tabBarItem.selectedImage =
      [UIImage imageNamed:@"icon.bundle/item_home_select.png"];
  //发现
  _findController = [[FindController alloc] init];
  _findController.tabBarItem.title = @"发现";
  _findController.tabBarItem.image =
      [UIImage imageNamed:@"icon.bundle/item_find_un_select.png"];
  _findController.tabBarItem.selectedImage =
      [UIImage imageNamed:@"icon.bundle/item_find_select.png"];
  //消息
  _msgController = [[MsgController alloc] init];
  _msgController.tabBarItem.title = @"消息";
  _msgController.tabBarItem.image =
      [UIImage imageNamed:@"icon.bundle/item_msg_un_select.png"];
  _msgController.tabBarItem.selectedImage =
      [UIImage imageNamed:@"icon.bundle/item_msg_select.png"];
  //我的
  _userController = [[UserDynamicController alloc] init];
  _userController.tabBarItem.title = @"动态";
  _userController.tabBarItem.image =
      [UIImage imageNamed:@"icon.bundle/item_user_un_select.png"];
  _userController.tabBarItem.selectedImage =
      [UIImage imageNamed:@"icon.bundle/item_user_select.png"];

  _controllers =
      [NSArray arrayWithObjects:_homeController, _userController,
                                _findController, _msgController, nil];
  // 将四个页面的 UIViewController 加入到 UITabBarController 之中
  [tabbarController setViewControllers:_controllers];

  [self initWithRootViewController:tabbarController];

  //标题
  tabbarController.navigationItem.title = @"NgGithub";
  UIFont* font = [UIFont fontWithName:@"Arial-ItalicMT" size:21];
  NSDictionary* dic = @{
    NSFontAttributeName : font,
    NSForegroundColorAttributeName : [UIColor whiteColor]
  };
  self.navigationBar.titleTextAttributes = dic;
  self.navigationBar.barTintColor = [UIColor colorWithRed:37.0 / 255
                                                    green:41.0 / 255
                                                     blue:46.0 / 255
                                                    alpha:1];
 //左边按钮
  UIImage* leftBtnImage = [UIImage imageNamed:@"icon.bundle/ic_user.png"];
  // 产生一张不会进行自动渲染的图片
  UIImage* selectedLeftImage =
      [leftBtnImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
  tabbarController.navigationItem.leftBarButtonItem =
      [[UIBarButtonItem alloc] initWithImage:selectedLeftImage
                                       style:UIBarButtonItemStylePlain
                                      target:self
                                      action:@selector(leftBtn)];
}


- (void)refreshData {
  NSString* token = [UserDataManager getAccessToken];
  NSLog(@"刷新所有view control");
    for (id controller in _controllers) {
      BaseViewController* temp = controller;
      [temp refreshData:token];
    }
    
 
}
 

- (void)leftBtn {
  //这里的话是通过遍历循环拿到之前在AppDelegate中声明的那个MMDrawerController属性，然后判断是否为打开状态，如果是就关闭，否就是打开(初略解释，里面还有一些条件)
  [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft
                                    animated:YES
                                  completion:nil];
}
 
@end
