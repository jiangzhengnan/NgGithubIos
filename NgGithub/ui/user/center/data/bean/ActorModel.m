//
//  ActorModel.m
//  NgGithub
//
//  Created by 小瓜瓜 on 2021/7/18.
//

#import "ActorModel.h"


@implementation ActorModel

@dynamic description;
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
}
+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"Description":@"description"};
}

@end
