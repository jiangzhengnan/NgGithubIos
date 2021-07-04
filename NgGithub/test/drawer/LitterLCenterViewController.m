

#import "LitterLCenterViewController.h"
#import "UIViewController+MMDrawerController.h"
#import "MMDrawerBarButtonItem.h"
#import "LitterLLeftViewController.h"
#import "LitterLRightViewController.h"
@interface LitterLCenterViewController ()

@end

@implementation LitterLCenterViewController

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
  [super viewDidLoad];
    
    
  self.view.backgroundColor = [UIColor whiteColor];
  self.title = @"Demo";
  // 1、设置导航栏的按钮
  self.navigationItem.leftBarButtonItem =
      [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu"]
                                       style:UIBarButtonItemStylePlain
                                      target:self
                                      action:@selector(leftBtn)];

  self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]
      initWithImage:[UIImage imageNamed:@"navigationbar_friendattention"]
              style:UIBarButtonItemStylePlain
             target:self
             action:@selector(rightBtn)];

  //框架作者提供了创建UIBarButtonItem的方法
  //    self.navigationItem.leftBarButtonItem = [[MMDrawerBarButtonItem
  //    alloc]initWithTarget:self action:@selector(leftBtn)];
  //    self.navigationItem.rightBarButtonItem = [[MMDrawerBarButtonItem
  //    alloc]initWithTarget:self action:@selector(rightBtn)];

  // 2、添加双击手势
  UITapGestureRecognizer *doubleTap =
      [[UITapGestureRecognizer alloc] initWithTarget:self
                                              action:@selector(doubleTap:)];
  // 2.1、双击
  [doubleTap setNumberOfTapsRequired:2];
  [self.view addGestureRecognizer:doubleTap];

  // 3、添加两个手指双击手势
  UITapGestureRecognizer *twoFingerDoubleTap = [[UITapGestureRecognizer alloc]
      initWithTarget:self
              action:@selector(twoFingerDoubleTap:)];
  // 3.1、双击
  [twoFingerDoubleTap setNumberOfTapsRequired:2];
  // 3.2、两个手指  默认为一个
  [twoFingerDoubleTap setNumberOfTouchesRequired:2];
  [self.view addGestureRecognizer:twoFingerDoubleTap];
}

- (void)leftBtn {
  //这里的话是通过遍历循环拿到之前在AppDelegate中声明的那个MMDrawerController属性，然后判断是否为打开状态，如果是就关闭，否就是打开(初略解释，里面还有一些条件)
  [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft
                                    animated:YES
                                  completion:nil];
}
- (void)rightBtn {
  [self.mm_drawerController toggleDrawerSide:MMDrawerSideRight
                                    animated:YES
                                  completion:nil];
}

/**
 *  添加点击手势  一个手指双击
 */
- (void)doubleTap:(UITapGestureRecognizer *)gesture {
  [self.mm_drawerController bouncePreviewForDrawerSide:MMDrawerSideLeft
                                            completion:nil];
}

/**
 *  添加点击手势  两个个手指双击
 */
- (void)twoFingerDoubleTap:(UITapGestureRecognizer *)gesture {
  [self.mm_drawerController bouncePreviewForDrawerSide:MMDrawerSideRight
                                            completion:nil];
}

@end
