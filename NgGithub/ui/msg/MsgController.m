//
//  MsgController.m
//  NgGithub
//
//  Created by 小瓜瓜 on 2021/6/13.
//

#import "MsgController.h"

@interface MsgController ()

@end

@implementation MsgController


- (void)viewDidLoad {
  [super viewDidLoad];

  UILabel *showTv = [[UILabel alloc] init];
  showTv.frame = self.view.bounds;
  showTv.text = @"消息界面";
  self.view.backgroundColor = [UIColor whiteColor];

  [self.view addSubview:showTv];

}

- (void)refreshData:(NSString *)token{
    NSLog(@"刷新消息数据");

}

@end
