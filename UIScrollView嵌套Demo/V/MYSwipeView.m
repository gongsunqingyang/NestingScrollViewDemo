//
//  MYSwipeView.m
//  UIScrollView嵌套Demo
//
//  Created by yanglin on 2018/5/25.
//  Copyright © 2018年 Softisland. All rights reserved.
//

#import "MYSwipeView.h"
#import "Header.h"
#import "ScrollStateManager.h"

@interface MYSwipeView ()<UIScrollViewDelegate>
@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) NSArray *controllers;
@property (nonatomic, strong) UIViewController *owner;

@property (nonatomic, strong) UISegmentedControl *segControl;
@property (nonatomic, strong) UIScrollView *scrollView;
@end


@implementation MYSwipeView

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles controllers:(NSArray *)controllers owner:(UIViewController *)owner {
    self = [super initWithFrame:frame];
    if (self) {
        self.titles = titles;
        self.controllers = controllers;
        self.owner = owner;
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.segControl = [[UISegmentedControl alloc] initWithItems:self.titles];
    self.segControl.frame = CGRectMake(0, 0, SCREEN_WIDTH, SEG_HEIGHT);
    self.segControl.selectedSegmentIndex = 0;
    [self.segControl addTarget:self action:@selector(selectePage:) forControlEvents:UIControlEventValueChanged];
    [self addSubview:self.segControl];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, SEG_HEIGHT, SCREEN_WIDTH, self.frame.size.height - SEG_HEIGHT)];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.delegate = self;
    self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH * self.controllers.count, 0);
    [self addSubview:self.scrollView];
    
    for (UIViewController *vc in self.controllers) {
        [self.owner addChildViewController:vc];
        [self addSubview:vc.view];
    }
    for (int i = 0; i < self.controllers.count; i++) {
        UIViewController *vc = self.controllers[i];
        vc.view.frame = CGRectMake(SCREEN_WIDTH * i, 0, SCREEN_WIDTH, self.scrollView.frame.size.height);
        [self.owner addChildViewController:vc];
        [self.scrollView addSubview:vc.view];
    }
}

- (void)selectePage:(UISegmentedControl *)segControl {
    if (self.selectPageBlock) {
        self.selectPageBlock(segControl.selectedSegmentIndex);
    }
    
    [self.scrollView setContentOffset:CGPointMake(SCREEN_WIDTH * segControl.selectedSegmentIndex, 0) animated:YES];
}

#pragma mark - UIScrollViewDelegate
// 让左右滑动的手势与主TableView手势互斥
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    SUB_SWIPING = YES;
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    SUB_SWIPING = NO;
}

// 切换segmentControl索引
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger currentIndex = scrollView.contentOffset.x / scrollView.frame.size.width;
    self.segControl.selectedSegmentIndex = currentIndex;
}

@end
