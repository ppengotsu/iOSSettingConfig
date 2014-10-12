//
//  ViewController.h
//  PPESettingConfig
//
//  Created by ppengotsu on 2014/10/11.
//  Copyright (c) 2014年 ppengotsu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    IBOutlet UISwitch *showDebugInfoSw;//デバッグ情報表示するかスイッチ
    IBOutlet UILabel *connectProtocolLb;//接続するプロトコル
    IBOutlet UILabel *connectAddressLb;//接続するアドレス
    IBOutlet UISwitch *overWriteUserIDSw;//ユーザIDを上書きするかどうか
    IBOutlet UILabel *overWriteUserIDLb;//上書きするユーザID
    IBOutlet UISwitch *allResetSw;//全てリセットスイッチ
    
}


@end

