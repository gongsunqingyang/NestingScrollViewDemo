//
//  InnerCollectionViewController.m
//  UIScrollView嵌套Demo
//
//  Created by yanglin on 2018/5/25.
//  Copyright © 2018年 Softisland. All rights reserved.
//

#import "InnerCollectionViewControllerB.h"
#import "Header.h"
#import "ScrollStateManager.h"

@interface InnerCollectionViewControllerB ()<UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic, strong) UICollectionView *collectionView;
@end

@implementation InnerCollectionViewControllerB

#pragma mark - Lazy
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        CGFloat margin = 15;
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        layout.itemSize = CGSizeMake(80, 80);
        layout.minimumLineSpacing = margin;
        layout.minimumInteritemSpacing = margin;
        layout.sectionInset = UIEdgeInsetsMake(margin, margin, margin, margin);
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH - 10, SCREEN_HEIGHT - TOPHEIGHT - SEG_HEIGHT) collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
    
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    }
    return _collectionView;
}


#pragma mark - LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.collectionView];
}


#pragma mark - UICollectionViewDataSource, UICollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return arc4random()%70 + 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
    if (!cell) {
        cell = [UICollectionViewCell new];
    }
    cell.backgroundColor = [UIColor orangeColor];
    return cell;
}

@end
