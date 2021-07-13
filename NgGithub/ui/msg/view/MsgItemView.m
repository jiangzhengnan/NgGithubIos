//
//  MsgItemView.m
//  NgGithub
//
//  Created by 小瓜瓜 on 2021/7/13.
//

#import "MsgItemView.h"
#import "MyUILable.h"
#import "MsgModel.h"
#import "ViewUtils.h"
#import "Masonry.h"
#import "TextUtils.h"


@interface MsgItemView ()
{
    
}
//描述
@property(nonatomic, strong) MyUILable *descLabel;

@end

@implementation MsgItemView

//绘制item
- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(nullable NSString *)reuseIdentifier {
  if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
    self.contentView.layer.borderColor = [UIColor colorWithRed:226.0 / 255
                                                         green:228.0 / 255
                                                          blue:232.0 / 255
                                                         alpha:1]
                                             .CGColor;
    self.contentView.layer.borderWidth = 1;  //边框宽度
    self.contentView.layer.cornerRadius = 10;
    [self createView];
    [self setViewAutoLayout];
  }
  return self;
}

- (void)setViewAutoLayout {

  [self.descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
    make.left.equalTo(@10);
    make.right.equalTo(@(-10));
      make.top.equalTo(@(-10));
    make.size.mas_equalTo(
        CGSizeMake(self.contentView.bounds.size.width - 40, 40));
  }];

}

//填充数据
- (void)layoutTableViewCellWithItem:(MsgModel *)item {
  self.descLabel.text = @"xiba";
}

- (void)awakeFromNib {
  [super awakeFromNib];
  // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
  [super setSelected:selected animated:animated];
    
  // Configure the view for the selected state
}

- (void)setFrame:(CGRect)frame {
  frame.origin.x += 10;
  frame.size.width -= 20;
  frame.origin.y += 10;
  frame.size.height -= 10;
  [super setFrame:frame];
}

- (void)createView {
  UIColor *defaultTextColor = [UIColor colorWithRed:88.0 / 255
                                              green:95.0 / 255
                                               blue:103.0 / 255
                                              alpha:1];
  self.descLabel =
      [ViewUtils getUILable:NSTextAlignmentLeft isBold:true size:14];
  self.descLabel.textColor = defaultTextColor;
  [self.descLabel setVerticalAlignment:VerticalAlignmentTop];
  self.descLabel.lineBreakMode = UILineBreakModeWordWrap;
  self.descLabel.numberOfLines = 0;
  [self.contentView addSubview:self.descLabel];
}

@end
