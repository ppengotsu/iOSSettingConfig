#!/bin/sh

#  run_settingsconfig.sh
#  PPESettingConfig
#
#  Created by ppengotsu on 2014/10/11.
#  Copyright (c) 2014年 ppengotsu. All rights reserved.
#
#
#   設定アプリ用の設定をします
#
#
#
#



if [ "${CONFIGURATION}" = "Debug" ]; then
#デバッグ時
rm -r "${SRCROOT}/${PRODUCT_NAME}/Setting/Settings.bundle"
cp -r "${SRCROOT}/${PRODUCT_NAME}/Setting/Debug/SettingsDebug.bundle" "${SRCROOT}/${PRODUCT_NAME}/Setting/Settings.bundle"
fi

if [ "${CONFIGURATION}" = "Release" ]; then
#リリース時
rm -r "${SRCROOT}/${PRODUCT_NAME}/Setting/Settings.bundle"
cp -r "${SRCROOT}/${PRODUCT_NAME}/Setting/Release/SettingsRelease.bundle" "${SRCROOT}/${PRODUCT_NAME}/Setting/Settings.bundle"
fi