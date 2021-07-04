//
//  UserBean.h
//  NgGithub
//
//  Created by 小瓜瓜 on 2021/6/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

//https://api.github.com/users/jiangzhengnan
@interface UserModel : NSObject
@property(nonatomic, copy) NSString* login;
@property(nonatomic, assign) long id;
@property(nonatomic, copy) NSString* node_id;
@property(nonatomic, copy) NSString* avatar_url;
@property(nonatomic, copy) NSString* name;
@property(nonatomic, copy) NSString* company;
@property(nonatomic, copy) NSString* blog;
@property(nonatomic, copy) NSString* location;
@property(nonatomic, copy) NSString* email;
@property(nonatomic, copy) NSString* hireable;
@property(nonatomic, copy) NSString* bio;
@property(nonatomic, copy) NSString* twitter_username;
@property(nonatomic, assign) int public_repos;
@property(nonatomic, assign) int public_gists;
@property(nonatomic, assign) int followers;
@property(nonatomic, assign) int following;
@property(nonatomic, copy) NSString * created_at;
@property(nonatomic, copy) NSString * updated_at;

 

@property(nonatomic, copy) NSString * html_url;
@property(nonatomic, copy) NSString * followers_url;
@property(nonatomic, copy) NSString * following_url;
@property(nonatomic, copy) NSString * gists_url;
@property(nonatomic, copy) NSString * starred_url;
@property(nonatomic, copy) NSString * subscriptions_url;
@property(nonatomic, copy) NSString * organizations_url;
@property(nonatomic, copy) NSString * repos_url;
@property(nonatomic, copy) NSString * events_url;
@property(nonatomic, copy) NSString * received_events_url;

@end

NS_ASSUME_NONNULL_END
