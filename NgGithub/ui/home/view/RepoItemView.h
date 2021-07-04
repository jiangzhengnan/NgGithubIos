//
//  RepoItemView.h
//  NgGithub
//
//  Created by 小瓜瓜 on 2021/7/3.
//

#import <UIKit/UIKit.h>

@class RepoModel;
NS_ASSUME_NONNULL_BEGIN

/**
 点击item跳转
 */
@protocol RepoItemDelegate <NSObject>
- (void)tableViewCell:(UITableViewCell *)tableViewCell;
@end

@interface RepoItemView : UITableViewCell

@property (nonatomic, weak, readwrite) id<RepoItemDelegate> delegate;

- (void)layoutTableViewCellWithItem:(RepoModel *)item;
@end

NS_ASSUME_NONNULL_END
