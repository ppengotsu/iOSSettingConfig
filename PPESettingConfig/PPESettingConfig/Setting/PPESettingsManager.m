//
//  SettingsManager.m
//  PPESettingConfig
//
//  Created by ppengotsu on 2014/10/12.
//  Copyright (c) 2014年 ppengotsu. All rights reserved.
//


//設定アプリのキー定義
#define SETTINGS_KEY_APP_APPVERSION @"settingsconfig_app_appvertion"//アプリバージョン
#define SETTINGS_KEY_USERINFO_USERID @"settingsconfig_userinfo_userid" //ユーザID
#define SETTINGS_KEY_USERINFO_USERNAME @"settingsconfig_userinfo_username" //ユーザ名

#define SETTINGS_KEY_DEBUG_SHOWDEBUGINFO @"settingsconfig_debug_showDebugInfo" //デバッグ情報表示
#define SETTINGS_KEY_DEBUG_SELECTCONNECTADDRESS @"settingsconfig_debug_selectconnect" //選択したデバッグ接続先
#define SETTINGS_KEY_DEBUG_EDITCONNECTADDRESS @"edit" //選択したデバッグ接続先を自分で編集する場合
#define SETTINGS_KEY_DEBUG_SELECTPROTOCOL @"settingsconfig_debug_selectprotocol" //選択したデバッグ接続プロトコル
#define SETTINGS_KEY_DEBUG_EDITURL @"settingsconfig_debug_editurl" //接続先をeditにした場合に、接続するあどれす
#define SETTINGS_KEY_DEBUG_USERID @"settingsconfig_debug_userid" //上書きするユーザID
#define SETTINGS_KEY_DEBUG_WRITEFLAG_USERID @"settingsconfig_debug_overwriteUserid" //ユーザIDを上書きするかどうか
#define SETTINGS_KEY_DEBUG_ALLRESET @"settingsconfig_debug_allreset" //全リセット



#import "PPESettingsManager.h"

@implementation PPESettingsManager{
    NSUserDefaults *userDefaults;//設定読み込み書き込み用
}

#pragma mark - 初期設定系
+ (instancetype)sharedInstance {
    static PPESettingsManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //一度だけ実行される
        sharedInstance = [[PPESettingsManager alloc] init];
    });
    return sharedInstance;
}


- (id)init {
    id __block obj;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
    obj = [super init];
    if (obj) {
            //Initialization
            [obj initSettings];//設定のし直し。
        }
    });
    return obj;
}


/**
 *  設定アプリに、設定し直します。毎回呼んでください
 */
- (void)initSettings{
    userDefaults = [NSUserDefaults standardUserDefaults];
    if ([self checkEqualSaveAppVersion]) {
        //アプリのバージョンに違いがあったら
        
        
        //最後に保存してあるアプリのバージョンを更新
        [self updateSaveAppVersion];
    }
}



#pragma mark - 読み書き換え処理

/**
 *  ユーザIDを保存する
 *
 *  @param userID
 */
- (void)setUserID:(NSString*)userID{
    [userDefaults setObject:userID forKey:SETTINGS_KEY_USERINFO_USERID];
    [userDefaults synchronize];
}

/**
 *  ユーザ名を保存する
 *
 *  @param userName
 */
- (void)setUserName:(NSString*)userName{
    [userDefaults setObject:userName forKey:SETTINGS_KEY_USERINFO_USERNAME];
    [userDefaults synchronize];
}


/**
 *  デバッグ用：デバッグ情報を表示するか
 *
 *  @return
 */
- (BOOL)acceptsShowDebugInfoFlag{
#ifdef DEBUG
    BOOL flag = [userDefaults boolForKey:SETTINGS_KEY_DEBUG_SHOWDEBUGINFO];
    return flag;
#endif
    return NO;
}

/**
 *  デバッグ用：接続に使うプロトコル
 *
 *  @return
 */
- (NSString *)connectProtocol{
#ifdef DEBUG
    NSString *connectProtocol = [userDefaults stringForKey:SETTINGS_KEY_DEBUG_SELECTPROTOCOL];
    return connectProtocol;
#endif
    return @"";
}

/**
 *  デバッグ用：接続したいアドレスを返す
 *
 *  @return
 */
- (NSString *)connectAddress{
#ifdef DEBUG
    NSString *connectAddress = [userDefaults stringForKey:SETTINGS_KEY_DEBUG_SELECTCONNECTADDRESS];
    if ([connectAddress isEqualToString:SETTINGS_KEY_DEBUG_EDITCONNECTADDRESS]) {
        //接続先アドレスを自分で編集したものにする場合
        return [userDefaults stringForKey:SETTINGS_KEY_DEBUG_EDITURL];//上書きするアドレスを返す
    }else{
        //選択したアドレスを返す
        return connectAddress;
    }
#endif
    return @"";
}

/**
 *  ユーザIDを上書きするかどうか
 *
 *  @return
 */
- (BOOL)acceptsOverWriteUserID{
#ifdef DEBUG
    BOOL flag = [userDefaults boolForKey:SETTINGS_KEY_DEBUG_WRITEFLAG_USERID ];
    return flag;
#endif
    return NO;
}

/**
 *  上書きするユーザID取得
 *
 *  @return
 */
- (NSString *)overWriteUserID{
#ifdef DEBUG
    if ([self acceptsOverWriteUserID]) {
        //userID上書き設定だった場合
        NSString *userID = [userDefaults stringForKey:SETTINGS_KEY_DEBUG_USERID];
        return userID;
    }
    return @"";
#endif
    return @"";
    
}

/**
 *  全てリセットフラグを返す
 *
 *  @return
 */
- (BOOL)acceptAllReset{
#ifdef DEBUG
    BOOL flag = [userDefaults boolForKey:SETTINGS_KEY_DEBUG_ALLRESET];
    return flag;
#endif
    return NO;
}




#pragma mark - クラス内共通処理

/**
 *  アプリのバージョンが前回と違うかチェック
 *
 *  @return YES:バージョンが違う場合　NO:バージョンが一緒の場合
 */
- (BOOL)checkEqualSaveAppVersion{
    NSString *nowAppVersion = [self appVersion];//現在のアプリバージョン
    if ([nowAppVersion isEqualToString:[userDefaults objectForKey:SETTINGS_KEY_APP_APPVERSION]]) {
        //アプリのバージョン一緒だった場合
        return NO;
    }
    
    return YES;
}

/**
 *  保存するアプリのバージョン更新
 */
- (void)updateSaveAppVersion{
    NSString *nowAppVersion = [self appVersion];//現在のアプリバージョン
    [userDefaults setObject:nowAppVersion forKey:SETTINGS_KEY_APP_APPVERSION];//アプリのバージョン保存
    [userDefaults synchronize];//すぐに書き込む
}



/**
 *  アプリのバージョン取得
 *
 *  @return
 */
- (NSString *)appVersion{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}




@end