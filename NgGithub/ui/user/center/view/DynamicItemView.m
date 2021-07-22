//
//  DynamicItemView.m
//  NgGithub
//
//  Created by 小瓜瓜 on 2021/7/18.
//

#import "DynamicItemView.h"
#import "MyUILable.h"
#import "MsgModel.h"
#import "ViewUtils.h"
#import "Masonry.h"
#import "TextUtils.h"
#import <SDWebImage/SDWebImage.h>

@interface DynamicItemView () {
}
//左上角头像icon
@property(nonatomic, strong) UIImageView *userIconIv;
//描述
@property(nonatomic, strong) MyUILable *descLabel;
//时间
@property(nonatomic, strong) MyUILable *timeLabel;

@end

@implementation DynamicItemView
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

//创建view
- (void)createView {
  UIColor *defaultTextColor = [UIColor colorWithRed:88.0 / 255
                                              green:95.0 / 255
                                               blue:103.0 / 255
                                              alpha:1];
  self.userIconIv = [[UIImageView alloc] init];
  self.userIconIv.layer.masksToBounds = YES;
  self.userIconIv.layer.cornerRadius = 15;
  [self.contentView addSubview:self.userIconIv];

  self.descLabel =
      [ViewUtils getUILable:NSTextAlignmentLeft isBold:true size:11];
  self.descLabel.textColor = [UIColor blackColor];
  [self.contentView addSubview:self.descLabel];
  self.timeLabel =
      [ViewUtils getUILable:NSTextAlignmentLeft isBold:true size:9];
  self.timeLabel.textColor = defaultTextColor;
  [self.contentView addSubview:self.timeLabel];
}

//设置布局依赖
- (void)setViewAutoLayout {
  [self.userIconIv mas_makeConstraints:^(MASConstraintMaker *make) {
    make.top.equalTo(@10);
    make.left.equalTo(@10);
    make.size.mas_equalTo(CGSizeMake(30, 30));
  }];
  [self.descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
    make.left.equalTo(self.userIconIv.mas_right).with.offset(10);
    make.right.equalTo(@(-10));
    make.top.equalTo(@(0));
    make.size.mas_equalTo(
        CGSizeMake(self.contentView.bounds.size.width - 40, 30));
  }];
  [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
    make.left.equalTo(self.userIconIv.mas_right).with.offset(10);
    make.top.equalTo(self.userIconIv.mas_bottom).with.offset(1);
    make.size.mas_equalTo(
        CGSizeMake(self.contentView.bounds.size.width - 40, 15));
  }];
}

//填充数据
- (void)layoutTableViewCellWithItem:(NSDictionary *)item {
  NSLog(@"填充  %@,", item.description);
  //头像
  NSString *userIconUrl =
      [[item objectForKey:@"actor"] objectForKey:@"avatar_url"];
  [self.userIconIv
      sd_setImageWithURL:[NSURL URLWithString:userIconUrl]
        placeholderImage:[UIImage
                             imageNamed:@"icon.bundle/ic_head_default.png"]];

  NSString *action = [item objectForKey:@"type"];
  NSString *descStr = @"";
  if ([action isEqualToString:@"WatchEvent"]) {
    descStr = [NSString
        stringWithFormat:@"%@ %@ %@",
                         [[item objectForKey:@"actor"]
                             objectForKey:@"display_login"],
                         [[item objectForKey:@"payload"]
                             objectForKey:@"action"],
                         [[item objectForKey:@"repo"] objectForKey:@"name"]];
  } else if ([action isEqualToString:@"ForkEvent"]) {
    descStr = [NSString
        stringWithFormat:@"%@ forked %@ from %@",
                         [[item objectForKey:@"actor"]
                             objectForKey:@"display_login"],
                         [[[item objectForKey:@"payload"]
                             objectForKey:@"forkee"] objectForKey:@"full_name"],
                         [[item objectForKey:@"repo"] objectForKey:@"name"]];
  } else if ([action isEqualToString:@"ReleaseEvent"]) {
    descStr = [NSString stringWithFormat:@"created releases"];
  } else {
    descStr = [NSString
        stringWithFormat:@"%@ %@", [item objectForKey:@"actor"], action];
  }
  self.descLabel.text = descStr;

  self.timeLabel.text = [item objectForKey:@"created_at"];
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

@end
