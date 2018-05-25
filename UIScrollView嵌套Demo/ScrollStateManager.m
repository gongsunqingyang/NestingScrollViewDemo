//
//  ScrollStateManager.m
//  UIScrollView嵌套Demo
//
//  Created by yanglin on 2018/5/24.
//  Copyright © 2018年 Softisland. All rights reserved.
//

#import "ScrollStateManager.h"

@implementation ScrollStateManager

+ (instancetype)sharedInstance{
    static ScrollStateManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
        instance.mainScrollEnable = YES;
        instance.subScrollEnable = YES;
        instance.subSwiping = NO;
    });
    return instance;
}

#pragma mark - Getter, Setter
- (void)setMainScrollEnable:(BOOL)mainScrollEnable {
    if (_mainScrollEnable != mainScrollEnable) {
        NSLog(@"setMainScrollEnable %@", @(mainScrollEnable));
    }
    _mainScrollEnable = mainScrollEnable;
}

- (void)setSubScrollEnable:(BOOL)subScrollEnable {
    if (_subScrollEnable != subScrollEnable) {
        NSLog(@"setSubScrollEnable %@", @(subScrollEnable));
    }
    _subScrollEnable = subScrollEnable;
}

- (void)setSubSwiping:(BOOL)subSwiping {
    if (_subSwiping != subSwiping) {
        NSLog(@"setSubSwiping %@", @(subSwiping));
        [[NSNotificationCenter defaultCenter] postNotificationName:SUB_SWIPING_NTF object:@(subSwiping)];
    }
    _subSwiping = subSwiping;
}


@end
