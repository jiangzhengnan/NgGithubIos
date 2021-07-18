//
//  SearchView.m
//  NgGithub
//
//  Created by 小瓜瓜 on 2021/7/14.
//

#import "SearchView.h"
#import "Masonry.h"

/**
 搜索View
 */
@interface SearchView () {
  CGFloat padding;
  CGFloat nowHeight;
}
// icon
@property(nonatomic, strong) UIImageView* searchIconIv;
//输入框
@property(nonatomic, strong) UITextField* searchTv;
 
//搜索文本
@property(nonatomic, strong) NSString* mSearchStr;


@end

@implementation SearchView

- (instancetype)initWithFrame:(CGRect)frame {
  if (self = [super initWithFrame:frame]) {
    self.backgroundColor = [UIColor colorWithRed:226.0 / 255
                                           green:228.0 / 255
                                            blue:232.0 / 255
                                           alpha:1];
    self.layer.cornerRadius = 10;

    // icon
    self.searchIconIv = [[UIImageView alloc] init];
     
    [self addSubview:self.searchIconIv];
    // tv
    self.searchTv = [[UITextField alloc] init];
    [self addSubview:self.searchTv];
    
    self.mSearchStr = @"";
  }
  return self;
}

- (void)layoutSubviews {
  [super layoutSubviews];
  // icon
  [self.searchIconIv
      setImage:[UIImage imageNamed:@"icon.bundle/ic_search_icon.png"]];
  [self.searchIconIv mas_makeConstraints:^(MASConstraintMaker* make) {
    make.top.equalTo(@12.5);
    make.left.equalTo(@12.5);
    make.size.mas_equalTo(CGSizeMake(25, 25));
  }];
  
  // tv
  [self.searchTv mas_makeConstraints:^(MASConstraintMaker* make) {
    make.top.equalTo(@12.5);
    make.left.equalTo(self.searchIconIv.mas_right).with.offset(12.5);
    make.size.mas_equalTo(CGSizeMake(self.bounds.size.width - 50, 25));
  }];
  self.searchTv.textColor = [UIColor blackColor];
  [self.searchTv addTarget:self
                    action:@selector(textFieldDidChange:)
          forControlEvents:UIControlEventEditingChanged];
  self.searchTv.placeholder = @"Search";
    self.searchTv.returnKeyType =UIReturnKeyYahoo;
    self.searchTv.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.searchTv.delegate = self;



   
}

//文字输入
- (void)textFieldDidChange:(UITextField*)textField {
  // self.smsBtn.enabled = textField.text.length==11;
  int searchTvLength = textField.text.length;
 
  self.mSearchStr = textField.text;
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
NSLog(@"点击了搜索");
    if (self.mSearchStr.length > 0) {
        self.mSearchViewBlock(self.mSearchStr);
    }
return YES;
}

- (void)setFrame:(CGRect)frame {
  frame.origin.x += 10;
  frame.size.width -= 20;
  frame.origin.y += 10;
  frame.size.height -= 10;
  [super setFrame:frame];
}

@end
