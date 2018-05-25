//
//  InnerBaseViewController.m
//  UIScrollView嵌套Demo
//
//  Created by yanglin on 2018/5/25.
//  Copyright © 2018年 Softisland. All rights reserved.
//

#import "InnerBaseViewController.h"
#import "ScrollStateManager.h"

@interface InnerBaseViewController ()<UIScrollViewDelegate>

@end

@implementation InnerBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    if (@available(iOS 11.0, *)) {
        [[UIScrollView appearance] setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
    }else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
}


#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (MAIN_SCROLL_ENABLE == YES) {    // 没有到达悬停处，禁止子TableView滚动
        // 固定子TableView
        NSLog(@"Sub - A");
        scrollView.contentOffset = CGPointZero;
    } else {                            // 到达悬停处，允许子TableView滚动
        NSLog(@"Sub - B");
    }
    
    CGFloat subOffsetY = scrollView.contentOffset.y;
    SUB_SCROLL_ENABLE = subOffsetY > 0;
    NSLog(@"Sub - offsetY = %.1f, SubEnable = %@", subOffsetY, @(SUB_SCROLL_ENABLE));
}


@end
