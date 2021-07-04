//
//  HomeDrawerViewController.m
//  NgGithub
//
//  Created by 小瓜瓜 on 2021/7/3.
//

#import "HomeDrawerViewController.h"
#import "LeftViewController.h"
#import "MainController.h"
#import "UserDataManager.h"
#import "LoginController.h"

@interface HomeDrawerViewController ()
@property(nonatomic, strong, readwrite) MainController* centerVC;
@property(nonatomic, strong, readwrite) LeftViewController* leftVC;

@end

@implementation HomeDrawerViewController

- (instancetype)init {
  self = [super init];
  if (self) {
    self.centerVC = [[MainController alloc] init];
    self.leftVC = [[LeftViewController alloc] init];
    // 2、初始化导航控制器
    UINavigationController* leftNvaVC =
        [[UINavigationController alloc] initWithRootViewController:self.leftVC];

    [self setCenterViewController:self.centerVC];
    [self setLeftDrawerViewController:leftNvaVC];
    NSParameterAssert(self.centerVC);
    // 4、设置打开/关闭抽屉的手势
    self.openDrawerGestureModeMask = MMOpenDrawerGestureModeAll;
    self.closeDrawerGestureModeMask = MMCloseDrawerGestureModeAll;
    // 5、设置左右两边抽屉显示的多少
    self.maximumLeftDrawerWidth = 300.0;
    //self.maximumRightDrawerWidth = 200.0;
  }
  return self;
}

- (void)viewDidAppear:(BOOL)animated {
  NSInteger nowTime = [[NSDate date] timeIntervalSince1970];
  NSInteger lastGetTokenTime = [UserDataManager getAccessTokenTime];
  NSInteger interval = 8 * 60 * 3600;
  BOOL needNet = (nowTime - lastGetTokenTime > interval);
  NSLog(@"当前时间 :%ld", (long)nowTime);
  NSLog(@"上次时间 :%ld", lastGetTokenTime);
  NSLog(@"是否需要请求%@", needNet ? @"YES" : @"NO");
  if (needNet) {
    [self getData];
  } else {
    [self refreshData];
  }
}

- (void)getData {
  NSLog(@"getData");
  LoginController* loginController = [[LoginController alloc] init];
  loginController.NextViewControllerBlock = ^ (NSString * token) {
    [self refreshData];
  };
  [self presentViewController:loginController animated:YES completion:nil];
}

- (void)refreshData {
  NSString* token = [UserDataManager getAccessToken];
  NSLog(@"拿到的token :%@", token);
  [self.centerVC refreshData];
    [self.leftVC refreshData];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
}
@end
