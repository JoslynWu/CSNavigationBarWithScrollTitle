//
//  CSOneNavBarView.m
//  customTest
//
//  Created by CS on 16/8/20.
//  Copyright © 2016年 Joslyn. All rights reserved.
//

#import "CSOneNavBarView.h"
#import "CSNavTitleViewCell.h"
#import "CSNewsNavTitleModel.h"

#define kScreeSize ([UIScreen mainScreen].bounds.size)
#define kMargin 30

static NSString *reuseCell = @"titleCell";

@interface CSOneNavBarView () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) UICollectionView *collectionView;

@property (weak, nonatomic) UICollectionViewFlowLayout *flowLayout;

@property (nonatomic, strong) NSArray *dataArray;

@property (nonatomic, weak) CSNavTitleViewCell *currentTitleViewCell;

@property (nonatomic, weak) CSNewsNavTitleModel *currentModel;


@end

@implementation CSOneNavBarView



-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        
        self.flowLayout = flowLayout;
        
        UICollectionView *collectionView = [[UICollectionView alloc]
                                            initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)
                                            collectionViewLayout:flowLayout];
        
        self.collectionView = collectionView;
        
        [self addSubview:collectionView];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.flowLayout.itemSize = CGSizeMake(50, self.bounds.size.height);
    
    self.collectionView.backgroundColor = [UIColor clearColor];
    
    self.collectionView.showsHorizontalScrollIndicator = NO;
    
    self.collectionView.contentInset = UIEdgeInsetsMake(0, 20, 0, 40);
    
    self.flowLayout.minimumLineSpacing = kMargin;
    
    
    self.collectionView.dataSource = self;
    
    self.collectionView.delegate = self;
    
    [self.collectionView registerClass:[CSNavTitleViewCell class] forCellWithReuseIdentifier:reuseCell];
}


-(NSArray *)dataArray{
    if (nil == _dataArray) {
        _dataArray = [CSNewsNavTitleModel arrayWithPlistFileName:@"newsNavTitle"];
    }
    return _dataArray;
}



//setter方法
-(void)setContentItem:(NSInteger)contentItem{
    
    _contentItem = contentItem;
    
    [self changeTitleColorAndScrollWithItem:contentItem];
  
}


/**
 *  根据传入的下标，滚动item，设置title的文字颜色
 *
 *  @param item 中间内容的下标
 */
-(void)changeTitleColorAndScrollWithItem:(NSInteger)item{
    
    //恢复normal状态
    [self.currentTitleViewCell.titleButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:item inSection:0];
    
    [self.collectionView scrollToItemAtIndexPath:indexPath
                                atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally
                                        animated:YES];
    
    UICollectionViewCell *cell = [self.collectionView cellForItemAtIndexPath:indexPath];

    CSNavTitleViewCell *titleViewCell = (CSNavTitleViewCell *)cell;

    [titleViewCell.titleButton setTitleColor:[UIColor colorWithRed:0.96 green:0.79 blue:0.55 alpha:1]
                                    forState:UIControlStateNormal];
    
    self.currentTitleViewCell = titleViewCell;              //记录当前的cell
    
    
    // 规避cell重用时的颜色串行问题
    
    self.currentModel.isSelect = NO;
    
    CSNewsNavTitleModel *model = self.dataArray[item];
    
    model.isSelect = YES;
    
    self.currentModel = model;
    
}


#pragma mark    ==
#pragma mark    UICollectionView的代理方法
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.dataArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CSNavTitleViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseCell forIndexPath:indexPath];
    
    CSNewsNavTitleModel *model = self.dataArray[indexPath.row];
    
    cell.model = model;
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (self.clickTitleToSwitchContentBlock) {
        
        self.clickTitleToSwitchContentBlock(indexPath);
    }
    
}



@end
