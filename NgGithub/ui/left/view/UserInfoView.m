//
//  UserInfoView.m
//  NgGithub
//
//  Created by 小瓜瓜 on 2021/6/21.
//

#import "UserInfoView.h"
#import "UserModel.h"
#import <SDWebImage/SDWebImage.h>
#import "ViewUtils.h"
#import "MyUILable.h"
#import "TextUtils.h"
/**
 用户个人信息view
 */
@interface UserInfoView () {
  CGFloat padding;
  CGFloat nowHeight;
}
//头像
@property(nonatomic, strong) UIImageView *headIv;
//名字
@property(nonatomic, strong) MyUILable *nameLb;
//账号
@property(nonatomic, strong) MyUILable *accountLb;
//顺口溜
@property(nonatomic, strong) MyUILable *bioLb;

//位置
@property(nonatomic, strong) MyUILable *locationLb;
//公司
@property(nonatomic, strong) MyUILable *companyLb;
//链接
@property(nonatomic, strong) MyUILable *linkLb;
//邮箱
@property(nonatomic, strong) MyUILable *emailLb;
//关注和粉丝
@property(nonatomic, strong) MyUILable *peopleLb;
@end

@implementation UserInfoView

- (instancetype)initWithFrame:(CGRect)frame {
  if (self = [super initWithFrame:frame]) {
    //头像
    _headIv = [[UIImageView alloc] init];
    [self addSubview:_headIv];
    //昵称
    _nameLb = [ViewUtils getUILable:NSTextAlignmentLeft isBold:true size:25];
    [self addSubview:_nameLb];
    //用户名
    _accountLb =
        [ViewUtils getUILable:NSTextAlignmentLeft isBold:false size:17];
    [self addSubview:_accountLb];

    //个性签名
    _bioLb = [ViewUtils getUILable:NSTextAlignmentLeft isBold:false size:18];
    _bioLb.backgroundColor = [UIColor colorWithRed:246.0f / 255.0f
                                             green:246.0f / 255.0f
                                              blue:246.0f / 255.0f
                                             alpha:1];
    _bioLb.contentInset = UIEdgeInsetsMake(20, 20, 20, 20);
    [self addSubview:_bioLb];
    //详细信息
    _locationLb =
        [ViewUtils getUILable:NSTextAlignmentLeft isBold:false size:13];
    [self addSubview:_locationLb];
    _companyLb =
        [ViewUtils getUILable:NSTextAlignmentLeft isBold:false size:13];
    [self addSubview:_companyLb];

    _linkLb = [ViewUtils getUILable:NSTextAlignmentLeft isBold:false size:13];
    [self addSubview:_linkLb];
    _emailLb = [ViewUtils getUILable:NSTextAlignmentLeft isBold:false size:13];
    [self addSubview:_emailLb];
    _peopleLb = [ViewUtils getUILable:NSTextAlignmentLeft isBold:false size:13];
    [self addSubview:_peopleLb];
  }
  return self;
}

- (void)layoutSubviews {
  [super layoutSubviews];
  padding = 10;
  nowHeight += padding;
  //头像
  _headIv.frame = CGRectMake(padding, nowHeight, 80, 80);
  nowHeight += 100;
  //昵称
  _nameLb.frame = CGRectMake(padding * 2 + 80, padding,
                             self.bounds.size.width - 100 - padding * 2, 40);
  _accountLb.frame = CGRectMake(padding * 2 + 80, padding + 35,
                                self.bounds.size.width - 100 - padding * 2, 40);
  _bioLb.frame =
      CGRectMake(padding, nowHeight, self.bounds.size.width - padding * 2, 45);
  nowHeight += 45;

  nowHeight += 10;
  _locationLb.frame =
      CGRectMake(padding, nowHeight, self.bounds.size.width - padding, 40);
  nowHeight += 40;
  _companyLb.frame =
      CGRectMake(padding, nowHeight, self.bounds.size.width - padding, 40);
  nowHeight += 40;
  _linkLb.frame =
      CGRectMake(padding, nowHeight, self.bounds.size.width - padding, 40);
  nowHeight += 40;
  _emailLb.frame =
      CGRectMake(padding, nowHeight, self.bounds.size.width - padding, 40);
  nowHeight += 40;
  _peopleLb.frame =
      CGRectMake(padding, nowHeight, self.bounds.size.width - padding, 40);
  nowHeight += 40;
}

- (void)setModel:(UserModel *)model {
  _model = model;
  //头像
  [_headIv
      sd_setImageWithURL:[NSURL URLWithString:model.avatar_url]
        placeholderImage:[UIImage
                             imageNamed:@"icon.bundle/home_selected@2x.png"]];
  _headIv.layer.masksToBounds = YES;
  _headIv.layer.cornerRadius = 10;
  _nameLb.text = model.name;
  _accountLb.text = model.login;
  _bioLb.text = model.bio;

  _locationLb.attributedText =
      [TextUtils getPicText:model.location
                        pic:@"icon.bundle/ic_userinfo_location.png"];

  _companyLb.attributedText =
      [TextUtils getPicText:model.company
                        pic:@"icon.bundle/ic_userinfo_company.png"];
  _linkLb.attributedText =
      [TextUtils getPicText:model.blog pic:@"icon.bundle/ic_userinfo_link.png"];
  _emailLb.attributedText =
      [TextUtils getPicText:model.email
                        pic:@"icon.bundle/ic_userinfo_email.png"];
  _peopleLb.attributedText = [TextUtils
      getPicText:[NSString stringWithFormat:@"%d followers · %d following",
                                            model.followers, model.following]
             pic:@"icon.bundle/ic_userinfo_people.png"];
}

@end
