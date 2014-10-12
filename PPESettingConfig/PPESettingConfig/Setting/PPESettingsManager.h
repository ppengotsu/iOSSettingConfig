//
//  SettingsManager.h
//  PPESettingConfig
//
//  Created by ppengotsu on 2014/10/12.
//  Copyright (c) 2014年 ppengotsu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PPESettingsManager : NSObject


+ (instancetype)sharedInstance;

- (void)setUserID:(NSString*)userID;
- (void)setUserName:(NSString*)userName;


- (BOOL)acceptsShowDebugInfoFlag;
- (NSString *)connectProtocol;
- (NSString *)connectAddress;
- (BOOL)acceptsOverWriteUserID;
- (NSString *)overWriteUserID;
- (BOOL)acceptAllReset;

@end
