//
//  FindController.m
//  NgGithub
//
//  Created by 小瓜瓜 on 2021/6/13.
//

#import "FindController.h"

@interface FindController ()

@end

@implementation FindController


- (void)viewDidLoad {
  [super viewDidLoad];

  UILabel *showTv = [[UILabel alloc] init];
  showTv.frame = self.view.bounds;
  showTv.text = @"发现界面";
  self.view.backgroundColor = [UIColor whiteColor];

  [self.view addSubview:showTv];
}

- (void)refreshData:(NSString *)token{
    NSLog(@"刷新发现 数据");

}

@end
