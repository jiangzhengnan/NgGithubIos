//
//  RepoModel.h
//  NgGithub
//
//  Created by 小瓜瓜 on 2021/6/30.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

//https://api.github.com/users/jiangzhengnan/repos

@interface RepoModel : NSObject
@property(nonatomic, assign) long id;

@property(nonatomic, copy) NSString* name;
@property(nonatomic, copy) NSString* url;
@property(nonatomic, copy) NSString* html_url;
@property(nonatomic, copy) NSString* full_name;
@property(nonatomic, copy) NSString* Description;
@property(nonatomic, copy) NSString* created_at;
@property(nonatomic, copy) NSString* updated_at;
@property(nonatomic, copy) NSString* pushed_at;  
@property(nonatomic, copy) NSString* language;

@property(nonatomic, assign) int stargazers_count;
@property(nonatomic, assign) int watchers_count;
@property(nonatomic, assign) int forks_count;
@property(nonatomic, assign) int forks;
@property(nonatomic, assign) int watchers;


@end

NS_ASSUME_NONNULL_END
