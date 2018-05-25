//
//  ScrollStateManager.h
//  UIScrollView嵌套Demo
//
//  Created by yanglin on 2018/5/24.
//  Copyright © 2018年 Softisland. All rights reserved.
//

#import <Foundation/Foundation.h>

#define MAIN_SCROLL_ENABLE  [ScrollStateManager sharedInstance].mainScrollEnable
#define SUB_SCROLL_ENABLE   [ScrollStateManager sharedInstance].subScrollEnable
#define SUB_SWIPING         [ScrollStateManager sharedInstance].subSwiping

#define SUB_SWIPING_NTF     @"SUB_SWIPING_NTF"

@interface ScrollStateManager : NSObject
+ (instancetype)sharedInstance;
@property (nonatomic, assign) BOOL mainScrollEnable;    // 主tableView能否滚动
@property (nonatomic, assign) BOOL subScrollEnable;     // 子tableView能否滚动
@property (nonatomic, assign) BOOL subSwiping;          // 自控制器正在左右滑动

@end
