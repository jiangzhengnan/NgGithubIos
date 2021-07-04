//
//  MyUILable.h
//  NgGithub
//
//  Created by 小瓜瓜 on 2021/6/28.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSInteger,VerticalAlignment){
    VerticalAlignmentTop,
    VerticalAlignmentMiddle,
    VerticalAlignmentBottom
};

@interface MyUILable : UILabel
// label文字显示的内边距
@property (nonatomic) UIEdgeInsets contentInset;

//垂直 向量
@property (nonatomic,assign) VerticalAlignment verticalAlignment;

@end

NS_ASSUME_NONNULL_END
