//
//  DemoConfigData.h
//  ShuQiHCSDK
//
//  Created by zhongyang on 2021/5/20.
//  Copyright © 2021 ShuQi. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DemoConfigData : NSObject



+(DemoConfigData *)sharedInstance;


//debug开关
- (void)setEnableDebug: (BOOL *) isEnable;
-(BOOL) isEnableDebug;

//保存Adn 屏蔽列表到磁盘
-(void) saveAdnBanListData : (NSMutableArray *) adnBanListDic;
// 读取Adn 屏蔽列表到磁盘
-(NSMutableArray *)getAdnBanListData;

-(NSMutableArray *)getNSMutableArrayFromLocal:(NSString *) fileName;

-(void) setEnableAppKey : (BOOL *) isEnable;
-(BOOL *) isEnableAppKey;
-(NSDictionary *) getChoiceAppKey;
-(void) setChoiceAppKey : (NSDictionary *) str;

-(void) setEnableAppType : (BOOL *) isEnable;
-(BOOL) isEnableAppType;
-(void) setChoiceAppType : (NSDictionary *) str;
-(NSDictionary *) getChoiceAppType;

-(void) setEnableSspMock : (BOOL *) isEnable;
-(BOOL) isEnableSspMock;
-(void) setChoiceSspMock : (NSString *) str;
-(NSString *) getChoiceSspMock;
-(void) setInputSspMock : (NSString *) str;
-(NSString *) getInputSspMock;

-(void) setEnableJuhe : (BOOL *) isEnable;
-(BOOL) isEnableJuhe;
-(void) setInputJuhe : (NSString *) str;
-(NSString *) getInputJuhe;

@end

NS_ASSUME_NONNULL_END
