//
//  TextUtils.m
//  NgGithub
//
//  Created by 小瓜瓜 on 2021/6/12.
//

#import "TextUtils.h"
@implementation TextUtils

+ (NSMutableAttributedString *)getPicText:(NSString *)input
                                      pic:(NSString *)picName {
  NSString *reviewText = [NSString stringWithFormat:@" %@", input];
  NSMutableAttributedString *attri1 =
      [[NSMutableAttributedString alloc] initWithString:reviewText];
  // NSTextAttachment可以将要插入的图片作为特殊字符处理
  NSTextAttachment *attch1 = [[NSTextAttachment alloc] init];
  //定义图片内容及位置和大小
  attch1.image = [UIImage imageNamed:picName];
  attch1.bounds = CGRectMake(0, -3, 16, 16);
  //创建带有图片的富文本
  NSAttributedString *string1 =
      [NSAttributedString attributedStringWithAttachment:attch1];
  //将图片放在第一位
  [attri1 insertAttributedString:string1 atIndex:0];
  return attri1;
}

+ (BOOL)isBlankString:(NSString *)string {
  if (string == nil || string == NULL) {
    return YES;
  }
  if ([string isKindOfClass:[NSNull class]]) {
    return YES;
  }
  if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet
                                                   whitespaceCharacterSet]]
          length] == 0) {
    return YES;
  }
  return NO;
}

+ (NSString *)getClientId {
  NSDictionary *local = [self getLocalDic];
  return [local objectForKey:@"CLIENT_ID"];
}

+ (NSString *)getClientSecret {
  NSDictionary *local = [self getLocalDic];
  return [local objectForKey:@"CLIENT_SECRET"];
}

+ (NSDictionary *)getLocalDic {
  NSString *fileDicPath =
      [[NSBundle mainBundle] pathForResource:@"local_config" ofType:@"txt"];
  if (!fileDicPath.length) {
    return nil;
  }
  NSFileManager *fm = [NSFileManager defaultManager];
  NSData *data = [[NSData alloc] init];
  data = [fm contentsAtPath:fileDicPath];
  if (![data isKindOfClass:[NSData class]] || data.length < 1) {
    return nil;
  }
  id jsonObj =
      [NSJSONSerialization JSONObjectWithData:data
                                      options:NSJSONReadingAllowFragments
                                        error:nil];
  if (![jsonObj isKindOfClass:[NSDictionary class]]) {
    return nil;
  }
  return [NSMutableDictionary dictionaryWithDictionary:(NSDictionary *)jsonObj];
}

@end
