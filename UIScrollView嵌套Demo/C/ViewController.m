//
//  ViewController.m
//  UIScrollView嵌套Demo
//
//  Created by yanglin on 2018/5/23.
//  Copyright © 2018年 Softisland. All rights reserved.
//

#import "ViewController.h"
#import "MYTableView.h"
#import "MYSwipeView.h"
#import "InnerTableViewControllerA.h"
#import "InnerTableViewControllerB.h"
#import "Header.h"
#import "ScrollStateManager.h"


@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) MYTableView *tableView;
@property (nonatomic, strong) MYSwipeView *swipeView;

@end

@implementation ViewController

#pragma mark - Lazy
- (MYTableView *)tableView {
    if (!_tableView) {
        _tableView = [[MYTableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.contentInset = UIEdgeInsetsMake(TOPHEIGHT, 0, 0, 0);
        
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, TABLE_HEADER_HEIGHT)];
        headerView.backgroundColor = [UIColor blueColor];
        _tableView.tableHeaderView = headerView;
        
        if (@available(iOS 11.0, *)) {
            [[UIScrollView appearance] setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
        }else {
            self.automaticallyAdjustsScrollViewInsets = NO;
        }

    }
    return _tableView;
}

- (MYSwipeView *)swipeView {
    if (!_swipeView) {
        InnerTableViewControllerA *a = [InnerTableViewControllerA new];
        InnerTableViewControllerB *b = [InnerTableViewControllerB new];
        InnerTableViewControllerB *c = [InnerTableViewControllerB new];
        InnerTableViewControllerB *d = [InnerTableViewControllerB new];
        NSArray *controllers = @[a, b, c, d];
        NSArray *titles = @[@"ControllerA", @"ControllerB", @"ControllerC", @"ControllerD"];
        CGRect rect = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - TOPHEIGHT);
        _swipeView = [[MYSwipeView alloc] initWithFrame:rect titles:titles controllers:controllers owner:self];
    }
    return _swipeView;
}

#pragma mark - Getter, Setter


#pragma mark - LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupUI];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(acceptNtf:) name:SUB_SWIPING_NTF object:nil];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


#pragma mark - Private
- (void)setupUI {
    [self.view addSubview:self.tableView];
}

- (void)acceptNtf:(NSNotification *)ntf {
    self.tableView.scrollEnabled = ![ntf.object boolValue];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    // 计算悬停处的偏移量（固定值）
    CGFloat delta = TABLE_HEADER_HEIGHT - TOPHEIGHT;
    
    if (MAIN_SCROLL_ENABLE == YES) {    // 没有达悬停处，允许主TableView滚动
        NSLog(@"Main - A");
    } else {                            // 到达悬停处，主TableView悬停
        if (SUB_SCROLL_ENABLE == YES) {
            NSLog(@"Main - B");
            scrollView.contentOffset = CGPointMake(0, delta);
        } else {
            NSLog(@"Main - C");
        }
    }
        
    // 主TableView偏移量
    CGFloat mainOffsetY = scrollView.contentOffset.y;
    MAIN_SCROLL_ENABLE = mainOffsetY < delta;
    NSLog(@"Main - offsetY = %.1f, delta = %.1f, MainEnable = %@", mainOffsetY, delta, @(MAIN_SCROLL_ENABLE));
}


#pragma mark - UITableViewDataSource, UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"identifier"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"identifier"];
        cell.backgroundColor = [UIColor lightGrayColor];
        [cell.contentView addSubview:self.swipeView];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.swipeView.bounds.size.height;
}


@end
