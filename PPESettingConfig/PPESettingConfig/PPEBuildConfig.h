//
//  PPEBuildConfig.h
//  hybridAppTemplateForiOS
//
//  Created by ppengotsu on 2014/04/27.
//  Copyright (c) 2014年 SAKUMA_KATSUYA. All rights reserved.
//
//
//  Ver 1.00


//以下、便利なマクロ群
#ifdef DEBUG
//デバッグ時の設定
//ログ出力
#define DLog(fmt, ...) NSLog((@"%s [Line %d]\n " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);//NSLogの代わりに使うこと
#else
//リリース時の設定群
//リリース時にNSLogを使わないために
#define DLog(...)

#endif



//常にいる定義
