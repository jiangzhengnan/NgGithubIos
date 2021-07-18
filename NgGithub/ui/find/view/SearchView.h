//
//  SearchView.h
//  NgGithub
//
//  Created by 小瓜瓜 on 2021/7/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
//仓库信息回调
typedef void(^SearchViewBlock)(NSString *searchTv);

@interface SearchView : UIView

@property (nonatomic, copy)SearchViewBlock mSearchViewBlock;

- (void)setSearchBlock:(SearchViewBlock)finishBlock;


@end

NS_ASSUME_NONNULL_END
