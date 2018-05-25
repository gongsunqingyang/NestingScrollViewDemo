//
//  MYTableView.m
//  UIScrollView嵌套Demo
//
//  Created by yanglin on 2018/5/23.
//  Copyright © 2018年 Softisland. All rights reserved.
//

#import "MYTableView.h"

@implementation MYTableView

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

@end
