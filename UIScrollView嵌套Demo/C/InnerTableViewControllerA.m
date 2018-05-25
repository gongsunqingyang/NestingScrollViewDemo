//
//  InnerViewController.m
//  UIScrollView嵌套Demo
//
//  Created by yanglin on 2018/5/23.
//  Copyright © 2018年 Softisland. All rights reserved.
//

#import "InnerTableViewControllerA.h"
#import "Header.h"
#import "ScrollStateManager.h"

@interface InnerTableViewControllerA () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation InnerTableViewControllerA
#pragma mark - Lazy
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH - 10, SCREEN_HEIGHT - TOPHEIGHT - SEG_HEIGHT)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

#pragma mark - Getter, Setter


#pragma mark - LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
}


#pragma mark - UITableViewDataSource, UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"abc"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"abc"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"AAAAA-%@", @(indexPath.row)];
    return cell;
}


@end
