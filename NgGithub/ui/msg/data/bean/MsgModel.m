//
//  MsgModel.m
//  NgGithub
//
//  Created by 小瓜瓜 on 2021/7/13.
//

#import "MsgModel.h"
@implementation MsgModel
@dynamic description;


-(void)setValue:(id)value forUndefinedKey:(NSString *)key{

}
+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"Description":@"description"};
}


@end
