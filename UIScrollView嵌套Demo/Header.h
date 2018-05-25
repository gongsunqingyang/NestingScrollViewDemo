//
//  Header.h
//  UIScrollView嵌套Demo
//
//  Created by yanglin on 2018/5/24.
//  Copyright © 2018年 Softisland. All rights reserved.
//

#ifndef Header_h
#define Header_h

#define STATUS_BAR_HEIGHT   [[UIApplication sharedApplication] statusBarFrame].size.height
#define NAV_BAR_HEIGHT      44.0
#define TAB_BAR_HEIGHT      ([[UIApplication sharedApplication] statusBarFrame].size.height > 20.0 ? 83.0 : 49.0)
#define TOPHEIGHT           (STATUS_BAR_HEIGHT + NAV_BAR_HEIGHT)
#define SCREEN_WIDTH        [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT       [UIScreen mainScreen].bounds.size.height

#define TABLE_HEADER_HEIGHT 200
#define SEG_HEIGHT 40

#endif /* Header_h */
