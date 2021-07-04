//
//  TestControllerViewController.m
//  NgGithub
//
//  Created by 小瓜瓜 on 2021/7/1.
//

#import "TestViewController.h"
#import "MMDrawerController.h"

@interface TestViewController ()

@end

@implementation TestViewController

//https://api.github.com/users/jiangzhengnan/events
- (void)viewDidLoad {
  [super viewDidLoad];

  UIButton *showTv = [[UIButton alloc] init];
  showTv.frame = CGRectMake(100, 100, 100, 100);
  [showTv setTitle:@"test " forState:UIControlStateNormal];
  showTv.backgroundColor = [UIColor blackColor];
    [self.view addSubview:showTv];
  self.view.backgroundColor = [UIColor whiteColor];

    
    UIViewController * leftDrawer = [[UIViewController alloc] init];
    UIViewController * center = [[UIViewController alloc] init];
    UIViewController * rightDrawer = [[UIViewController alloc] init];

    MMDrawerController * drawerController = [[MMDrawerController alloc]
                                             initWithCenterViewController:center
                                               leftDrawerViewController:leftDrawer
                                               rightDrawerViewController:rightDrawer];

}

@end
