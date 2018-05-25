//
//  MYSwipeView.h
//  UIScrollView嵌套Demo
//
//  Created by yanglin on 2018/5/25.
//  Copyright © 2018年 Softisland. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MYSwipeView : UIView
@property (nonatomic, copy) void (^selectPageBlock)(NSInteger);

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles controllers:(NSArray *)controllers owner:(UIViewController *)owner;

@end
