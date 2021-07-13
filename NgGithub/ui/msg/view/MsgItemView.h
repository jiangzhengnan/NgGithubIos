//
//  MsgItemView.h
//  NgGithub
//
//  Created by 小瓜瓜 on 2021/7/13.
//

#import <UIKit/UIKit.h>

@class MsgModel;
NS_ASSUME_NONNULL_BEGIN


@interface MsgItemView : UITableViewCell

- (void)layoutTableViewCellWithItem:(MsgModel *)item;

@end

NS_ASSUME_NONNULL_END
