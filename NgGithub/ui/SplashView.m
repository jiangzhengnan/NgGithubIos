//
//  SplashView.m
//  NgGithub
//
//  Created by 小瓜瓜 on 2021/6/13.
//

#import "SplashView.h"

@interface SplashView () {
}
@property(nonatomic, strong, readwrite) UIImageView *image;

@property(nonatomic, strong, readwrite) UILabel *showTv;

@end

@implementation SplashView

- (instancetype)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    [self setBackgroundColor:[UIColor whiteColor]];
    //显示icon
    UIImage *image = [UIImage imageNamed:@"icon.bundle/icon.jpeg"];
    _image = [[UIImageView alloc] initWithImage:image];

    //文字
    _showTv = [[UILabel alloc] init];
    _showTv.textColor = [UIColor blackColor];
    _showTv.numberOfLines = 0;

    _showTv.text = @"NgGithub\n开发版";
    _showTv.textAlignment = UITextAlignmentCenter;

    [self addSubview:_image];
    [self addSubview:_showTv];

    [self performSelector:@selector(delayMethod)
               withObject:nil
               afterDelay:1.0f];
  }
  return self;
}

- (void)delayMethod {
  [self removeFromSuperview];
}

- (void)layoutSubviews {
  CGFloat mIconWidth = 150;

  _image.frame = CGRectMake(self.frame.size.width / 2 - mIconWidth / 2,
                            self.frame.size.height / 4, mIconWidth, mIconWidth);
  _showTv.frame =
      CGRectMake(0, self.frame.size.height - 200, self.frame.size.width, 100);
}

@end
