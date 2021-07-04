//
//  RepoModel.m
//  NgGithub
//
//  Created by 小瓜瓜 on 2021/6/30.
//

#import "RepoModel.h"

@implementation RepoModel
@dynamic description;


-(void)setValue:(id)value forUndefinedKey:(NSString *)key{

}
+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"Description":@"description"};
}


@end
