//
//  DynamicModel.m
//  NgGithub
//
//  Created by 小瓜瓜 on 2021/7/18.
//

#import "DynamicModel.h"
@implementation DynamicModel
@dynamic description;

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{

}
+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"Description":@"description"};
}


@end
