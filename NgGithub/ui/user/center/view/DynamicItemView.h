//
//  DynamicItemView.h
//  NgGithub
//
//  Created by 小瓜瓜 on 2021/7/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class  DynamicModel;
@interface DynamicItemView  : UITableViewCell

- (void)layoutTableViewCellWithItem:(NSDictionary *)item;

@end

NS_ASSUME_NONNULL_END
