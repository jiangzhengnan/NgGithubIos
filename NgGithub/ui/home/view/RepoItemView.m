//
//  RepoItemView.m
//  NgGithub
//
//  Created by 小瓜瓜 on 2021/7/3.
//

#import "RepoItemView.h"
#import "RepoModel.h"
#import "MyUILable.h"
#import "ViewUtils.h"
#import "Masonry.h"
#import "TextUtils.h"
/**
 三行仓库视图
 */
@interface RepoItemView () {
}
//左上角icon
@property(nonatomic, strong) UIImageView *repoIconIv;
//右上角icon
@property(nonatomic, strong) UIImageView *repoLinkIconIv;
// title
@property(nonatomic, strong) MyUILable *titleLabel;

//描述
@property(nonatomic, strong) MyUILable *descLabel;

//语言
@property(nonatomic, strong) MyUILable *languageLabel;
//星星
@property(nonatomic, strong) MyUILable *watchersLabel;
// fork
@property(nonatomic, strong) MyUILable *forkLabel;
@end

@implementation RepoItemView

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
    //      [self.contentView addSubview:({
    //                          self.titleLabel = [[UILabel alloc]
    //                              initWithFrame:CGRectMake(20.0, 15.0,
    //                              270.0, 50.0)];
    //                          self.titleLabel.font = [UIFont
    //                          systemFontOfSize:16]; self.titleLabel.textColor
    //                          = [UIColor blackColor];
    //                          self.titleLabel.numberOfLines = 2;
    //                          self.titleLabel.lineBreakMode =
    //                              NSLineBreakByTruncatingTail;
    //                          self.titleLabel;
    //                        })];
  }
  return self;
}

- (void)setViewAutoLayout {
  [self.repoIconIv mas_makeConstraints:^(MASConstraintMaker *make) {
    make.top.equalTo(@22);
    make.left.equalTo(@10);
    make.size.mas_equalTo(CGSizeMake(16, 16));
  }];
  [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
    make.left.equalTo(self.repoIconIv.mas_right).with.offset(10);
    make.top.equalTo(@10);
    make.right.equalTo(self.repoLinkIconIv.mas_left).with.offset(-10);
    make.size.mas_equalTo(
        CGSizeMake(self.contentView.bounds.size.width - 20 - 36 - 36, 40));
  }];
  [self.repoLinkIconIv mas_makeConstraints:^(MASConstraintMaker *make) {
    make.left.equalTo(self.titleLabel.mas_right).with.offset(10);
    make.right.equalTo(@(-10));
    make.top.equalTo(@22);
    make.size.mas_equalTo(CGSizeMake(16, 16));
  }];

  [self.descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
    make.left.equalTo(@10);
    make.right.equalTo(@(-10));
    make.top.equalTo(self.repoIconIv.mas_bottom).with.offset(5);
    make.size.mas_equalTo(
        CGSizeMake(self.contentView.bounds.size.width - 40, 40));
  }];

  [self.languageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
    make.left.equalTo(@10);
    make.top.equalTo(self.descLabel.mas_bottom).with.offset(1);
    make.size.mas_equalTo(CGSizeMake(80, 30));
  }];
  [self.watchersLabel mas_makeConstraints:^(MASConstraintMaker *make) {
    make.left.equalTo(self.languageLabel.mas_right).with.offset(10);
    make.top.equalTo(self.descLabel.mas_bottom).with.offset(1);
    make.size.mas_equalTo(CGSizeMake(80, 30));
  }];
  [self.forkLabel mas_makeConstraints:^(MASConstraintMaker *make) {
    make.left.equalTo(self.watchersLabel.mas_right).with.offset(10);
    make.top.equalTo(self.descLabel.mas_bottom).with.offset(1);
    make.size.mas_equalTo(CGSizeMake(80, 30));
  }];
}

//填充数据
- (void)layoutTableViewCellWithItem:(RepoModel *)item {
  self.titleLabel.text = item.name;
  self.descLabel.text = item.Description;
  self.languageLabel.attributedText =
      [TextUtils getPicText:item.language
                        pic:@"icon.bundle/ic_repo_language_icon.png"];
  self.watchersLabel.attributedText =
      [TextUtils getPicText:[NSString stringWithFormat:@"%d", item.watchers]
                        pic:@"icon.bundle/ic_repo_start_icon.png"];
  self.forkLabel.attributedText =
      [TextUtils getPicText:[NSString stringWithFormat:@"%d", item.forks]
                        pic:@"icon.bundle/ic_repo_fork_icon.png"];
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
  self.repoIconIv = [[UIImageView alloc] init];
  [self.repoIconIv
      setImage:[UIImage imageNamed:@"icon.bundle/ic_repo_icon.png"]];
  [self.contentView addSubview:self.repoIconIv];
  self.repoLinkIconIv = [[UIImageView alloc] init];
  [self.repoLinkIconIv
      setImage:[UIImage imageNamed:@"icon.bundle/ic_repo_link_icon.png"]];
  [self.contentView addSubview:self.repoLinkIconIv];
  self.titleLabel =
      [ViewUtils getUILable:NSTextAlignmentLeft isBold:true size:16];
  self.titleLabel.textColor = [UIColor colorWithRed:36.0 / 255
                                              green:104.0 / 255
                                               blue:207.0 / 255
                                              alpha:1];
  [self.contentView addSubview:self.titleLabel];
  self.descLabel =
      [ViewUtils getUILable:NSTextAlignmentLeft isBold:true size:14];
  self.descLabel.textColor = defaultTextColor;
  [self.descLabel setVerticalAlignment:VerticalAlignmentTop];
  self.descLabel.lineBreakMode = UILineBreakModeWordWrap;
  self.descLabel.numberOfLines = 0;
  [self.contentView addSubview:self.descLabel];
  self.languageLabel =
      [ViewUtils getUILable:NSTextAlignmentLeft isBold:true size:14];
  self.languageLabel.textColor = defaultTextColor;
  [self.contentView addSubview:self.languageLabel];
  self.watchersLabel =
      [ViewUtils getUILable:NSTextAlignmentLeft isBold:true size:14];
  self.watchersLabel.textColor = defaultTextColor;
  [self.contentView addSubview:self.watchersLabel];
  self.forkLabel =
      [ViewUtils getUILable:NSTextAlignmentLeft isBold:true size:14];
  self.forkLabel.textColor = defaultTextColor;
  [self.contentView addSubview:self.forkLabel];
}

@end
