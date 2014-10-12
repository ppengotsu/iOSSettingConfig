//
//  ViewController.m
//  PPESettingConfig
//
//  Created by ppengotsu on 2014/10/11.
//  Copyright (c) 2014年 ppengotsu. All rights reserved.
//

#import "ViewController.h"
#import "PPESettingsManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //PPESettingManagerの初期設定
    PPESettingsManager *setting = [PPESettingsManager sharedInstance];//シングルトンパターンで、インスタンス生成
    
    [setting setUserID:@"0000111"];//ユーザID
    [setting setUserName:@"hoge"];//ユーザ名
    
    BOOL showDebugInfoFlag = [setting acceptsShowDebugInfoFlag];//デバッグ情報を表示するかのフラグ
    NSString *connectProtocol = [setting connectProtocol];//接続するプロトコル
    NSString *connectAddress = [setting connectAddress];//接続するアドレス
    BOOL overwriteUserIDFlag = [setting acceptsOverWriteUserID];//ユーザIDを上書きするかどうか
    NSString *overwriteUserID = [setting overWriteUserID];//上書きするユーザID
    BOOL allResetFlag = [setting acceptAllReset];//全てリセットするかのフラグ
    
    
    //ここから下は、画面に表示してわかりやすくしているだけ
    showDebugInfoSw.on = showDebugInfoFlag;//デバッグ情報表示
    
    connectProtocolLb.text = connectProtocol;//接続プロトコル
    
    connectAddressLb.text = connectAddress;//接続アドレス
    
    overWriteUserIDSw.on = overwriteUserIDFlag;//ユーザID上書きするかどうか
    
    overWriteUserIDLb.text = overwriteUserID;//上書きするユーザID
    
    allResetSw.on = allResetFlag;//全てリセットするかどうか
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
