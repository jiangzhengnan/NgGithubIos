//
//  ViewUtils.m
//  NgGithub
//
//  Created by 小瓜瓜 on 2021/6/20.
//

#import "ViewUtils.h"
#import "MyUILable.h"

@implementation ViewUtils
+ (MyUILable * _Nonnull)getUILable:(NSTextAlignment * _Nonnull)gravity
                   isBold:(BOOL)isBold
                     size:(NSInteger)size {
  MyUILable *labView = [[MyUILable alloc] init];
  labView.textAlignment = gravity;
  if (isBold) {
    [labView setFont:[UIFont fontWithName:@"Helvetica-Bold" size:size]];
  } else {
    labView.font = [UIFont systemFontOfSize:17];
  }
  return labView;
}

@end
