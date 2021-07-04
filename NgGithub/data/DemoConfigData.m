//  DemoConfigData.m
//  ShuQiHCSDK
//  Created by zhongyang on 2021/5/20.
//  Copyright © 2021 ShuQi. All rights reserved.
//

#import "DemoConfigData.h"

//debug开关
#define  APP_DEBUG_CONFIG    @"demo_app_debug_config_fileData"

// 本地存储的屏蔽adn列表
#define  ADN_BAN_LIST_CONFIG_FileName    @"demo_adn_ban_list_config_fileData"

// 本地存储的app key 开关
#define  APP_KEY_SWTICH_CONFIG    @"demo_app_key_swtich_config_fileData"
// 本地存储的app key 选中
#define  APP_KEY_CHOICE_CONFIG    @"demo_app_key_choice_config_fileData"

// 本地存储的app Type 开关
#define  APP_AD_TYPE_CONFIG    @"demo_app_ad_type_config_fileData"
// 本地存储的app Type 选中
#define  APP_AD_TYPE_CHOICE_CONFIG    @"demo_app_ad_type_choice_config_fileData"


// ssp mock 开关
#define  APP_SSP_MOCK_CONFIG    @"demo_app_ssp_mock_fileData"
//  ssp mock 选中
#define  APP_SSP_MOCK_CHOICE_CONFIG    @"demo_app_ssp_mock_choice_fileData"
//ssp mock 输入的mock接口
#define  APP_SSP_MOCK_INPUT    @"demo_app_ssp_mock_input_fileData"

//聚合开关
#define  APP_JUHE_CONFIG    @"demo_app_juhe_fileData"
//聚合输入
#define  APP_JUHE_INPUT    @"demo_app_juhe_input_fileData"


@interface DemoConfigData()
@property(nonatomic,assign) BOOL lock;
@end

@implementation DemoConfigData

+(DemoConfigData *)sharedInstance {
    static DemoConfigData *instance=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[DemoConfigData alloc] init];
        instance.lock = NO;
        
    });
    return instance;
}

-(void)getConfigDataArray:(NSArray *)testIdArray {
    if (self.lock) {
        return;
    }
    self.lock = YES;
     
}


//保存debug开关
- (void)setEnableDebug: (BOOL *) isEnable{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setBool:isEnable forKey:APP_DEBUG_CONFIG];
    
    if (!isEnable) {
        //清除所有数据
        [self saveAdnBanListData :nil];
        
        [self setEnableAppKey :NO];
        [self setChoiceAppKey :nil];

        [self setEnableAppType:NO];
        [self setChoiceAppType:nil];
        
        [self setEnableSspMock:NO];
        [self setChoiceSspMock:nil];
        [self setInputSspMock:nil];

        [self setEnableJuhe:NO];
        [self setInputJuhe:nil];
    }
}
//读取debug开关
-(BOOL) isEnableDebug{
    return [[NSUserDefaults standardUserDefaults] boolForKey:APP_DEBUG_CONFIG];
}

//juhe
-(void) setEnableJuhe : (BOOL *) isEnable{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setBool:isEnable forKey:APP_JUHE_CONFIG];
}
-(BOOL) isEnableJuhe{
    return [[NSUserDefaults standardUserDefaults] boolForKey:APP_JUHE_CONFIG];
}

-(void) setInputJuhe : (NSString *) str{
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:APP_JUHE_INPUT];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
-(NSString *) getInputJuhe{
    return [[NSUserDefaults standardUserDefaults] objectForKey:APP_JUHE_INPUT];
}

//mock
-(void) setEnableSspMock : (BOOL *) isEnable{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setBool:isEnable forKey:APP_SSP_MOCK_CONFIG];
}
-(BOOL) isEnableSspMock{
    return [[NSUserDefaults standardUserDefaults] boolForKey:APP_SSP_MOCK_CONFIG];
}
-(void) setChoiceSspMock : (NSString *) str{
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:APP_SSP_MOCK_CHOICE_CONFIG];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
-(NSString *) getChoiceSspMock{
    return [[NSUserDefaults standardUserDefaults] objectForKey:APP_SSP_MOCK_CHOICE_CONFIG];
}
-(void) setInputSspMock : (NSString *) str{
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:APP_SSP_MOCK_INPUT];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
-(NSString *) getInputSspMock{
    return [[NSUserDefaults standardUserDefaults] objectForKey:APP_SSP_MOCK_INPUT];
}


//appType
-(void) setEnableAppType : (BOOL *) isEnable{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
        [ud setBool:isEnable forKey:APP_AD_TYPE_CONFIG];
    [ud synchronize];
}
-(BOOL) isEnableAppType{
    return [[NSUserDefaults standardUserDefaults] boolForKey:APP_AD_TYPE_CONFIG];
}
-(void) setChoiceAppType : (NSDictionary *) str{
    NSString *fileName = [self getConfigPath:APP_AD_TYPE_CHOICE_CONFIG];
    [NSKeyedArchiver archiveRootObject:str toFile:fileName];
}
-(NSDictionary *) getChoiceAppType{
    NSString *fileName = [self getConfigPath:APP_AD_TYPE_CHOICE_CONFIG];
    return [self getNSDictionaryFromLocal:fileName];
}


//appkey
-(void) setEnableAppKey : (BOOL *) isEnable{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
        [ud setBool:isEnable forKey:APP_KEY_SWTICH_CONFIG];
    [ud synchronize];
}
-(BOOL) isEnableAppKey{
    return [[NSUserDefaults standardUserDefaults] boolForKey:APP_KEY_SWTICH_CONFIG];
}
-(void) setChoiceAppKey : (NSDictionary *) str{
    NSString *fileName = [self getConfigPath:APP_KEY_CHOICE_CONFIG];
    [NSKeyedArchiver archiveRootObject:str toFile:fileName];
    
}
-(NSDictionary *) getChoiceAppKey{
    NSString *fileName = [self getConfigPath:APP_KEY_CHOICE_CONFIG];
    return [self getNSDictionaryFromLocal:fileName];
}

//Adn
-(void) saveAdnBanListData : (NSMutableArray *) adnBanListDic{
    NSString *fileName = [self getConfigPath:ADN_BAN_LIST_CONFIG_FileName];
    [NSKeyedArchiver archiveRootObject:adnBanListDic toFile:fileName];
}
-(NSMutableArray *)getAdnBanListData {
    NSString *fileName = [self getConfigPath:ADN_BAN_LIST_CONFIG_FileName];
    NSMutableArray *dic =[self getNSMutableArrayFromLocal:fileName];
    return dic;
}



#pragma mark - 文件处理

-(NSDictionary *)getNSDictionaryFromLocal:(NSString *) fileName {
    BOOL isExist = [[NSFileManager defaultManager] fileExistsAtPath:fileName];
    NSDictionary *dic;
    if (isExist) {
        dic = [NSKeyedUnarchiver unarchiveObjectWithFile:fileName];
    }
    if (!dic.count) {
        dic = @{};
    }
    //NSLog(@"c--getD--%@",[dic description]);
    return dic;
}



-(NSMutableArray *)getNSMutableArrayFromLocal:(NSString *) fileName {
    BOOL isExist = [[NSFileManager defaultManager] fileExistsAtPath:fileName];
    NSMutableArray *dic;
    if (isExist) {
        dic = [NSKeyedUnarchiver unarchiveObjectWithFile:fileName];
    }
    if (!dic.count) {
        dic = @{};
    }
    //NSLog(@"c--getD--%@",[dic description]);
    return dic;
}
-(NSString *)getConfigPath:(NSString *)fileName {
    NSString *path = [self profilePath:[NSString stringWithFormat:@"FlashConfig/%@",fileName] mkDir:YES];
    return path;
    return @"";
}

-(NSString *)profilePath:(NSString *)pathName mkDir:(BOOL)mkDir {
    NSString *path = [[self profileDirectory] stringByAppendingPathComponent:pathName];
    if(mkDir) [self createDirectoryAtPath:path];
    return path;
}

-(void)createDirectoryAtPath:(NSString *)pathName {
    NSString *dir = [pathName stringByDeletingLastPathComponent];
    [self createDirectoryIfNeeded:dir];
}

-(NSString *)profileDirectory {
    __strong static NSString *profilePath = nil;
    if(!profilePath)
    {
        profilePath = [[[self libraryDirectory] stringByAppendingPathComponent:@"Profile"] copy];
        [self createDirectoryIfNeeded:profilePath];
    }
    return profilePath;
}

-(NSString *)libraryDirectory {
    static NSString *libPath = nil;
    if (!libPath) {
        libPath = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES).firstObject;
    }
    return libPath;
}

-(void)createDirectoryIfNeeded:(NSString *)dir {
    if (![[NSFileManager defaultManager] fileExistsAtPath:dir]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:dir withIntermediateDirectories:YES attributes:nil error:nil];
    }
}


@end
