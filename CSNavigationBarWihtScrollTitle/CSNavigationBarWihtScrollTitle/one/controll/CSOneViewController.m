//
//  CSOneViewController.m
//  customTest
//
//  Created by CS on 16/8/20.
//  Copyright © 2016年 Joslyn. All rights reserved.
//

#import "CSOneViewController.h"
#import "CSOneNavBarView.h"
#import "CSContentCell.h"
#import "CSNewsNavTitleModel.h"


#define kScreeSize ([UIScreen mainScreen].bounds.size)

static NSString *reuseCell = @"cell";


@interface CSOneViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) NSArray *dataArray;


@property (nonatomic, weak) UICollectionView *collectionView;


@property (nonatomic, weak) CSOneNavBarView *navBarView;

/**右上角的 切换到下一个的button*/
@property (nonatomic, weak) UIButton *rightButton;

/*当前content页的索引*/
@property (nonatomic, assign) NSInteger pageIndex;


@end

@implementation CSOneViewController

/**
 *  懒加载，加载模型数据
 *
 *  @return 模型数组
 */
-(NSArray *)dataArray{
    
    if (_dataArray == nil) {
        
        _dataArray = [CSNewsNavTitleModel arrayWithPlistFileName:@"newsNavTitle"];
    }
    
    return _dataArray;
}

//资讯页的标题页
-(CSOneNavBarView *)navBarView{
    
    if (nil == _navBarView) {
        
        CSOneNavBarView *navBarView = [[CSOneNavBarView alloc] initWithFrame:CGRectMake(0, 20, kScreeSize.width, 44)];
        
        _navBarView = navBarView;
        
        [self.navigationController.view addSubview:_navBarView];
    }
    return _navBarView;
}

//右侧上层item
-(UIButton *)rightButton{
    if (!_rightButton) {
        
        UIButton *rightButton = [[UIButton alloc] init];
        
        _rightButton = rightButton;
        
        [self.navigationController.view addSubview:_rightButton];
    }
    return _rightButton;
}

-(instancetype)init{
    
    if (self = [super init]) {
        
        self.view.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing = 0;
    
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:flowLayout];
    
    flowLayout.itemSize = CGSizeMake(kScreeSize.width, kScreeSize.height - 49);
    
    
    collectionView.showsHorizontalScrollIndicator = NO;
    collectionView.showsVerticalScrollIndicator = NO;
    
    collectionView.pagingEnabled = YES;
    
    self.collectionView = collectionView;
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:collectionView];
    
    self.collectionView.dataSource = self;
    
    self.collectionView.delegate = self;
    
    [self.collectionView registerClass:[CSContentCell class] forCellWithReuseIdentifier:reuseCell];
    
}



-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.navBarView.backgroundColor = [UIColor clearColor];
    
    self.navBarView.clickTitleToSwitchContentBlock = ^(NSIndexPath *titleIndexPath){
        
        [self.collectionView scrollToItemAtIndexPath:titleIndexPath
                                    atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally
                                            animated:YES];
        
        [self.navBarView changeTitleColorAndScrollWithItem:titleIndexPath.row];
        
        
        if (self.pageIndex > titleIndexPath.row) {
            
            self.rightButton.enabled = YES;

        }else if (titleIndexPath.row == self.dataArray.count - 1){
            
            self.rightButton.enabled = NO;
        }
        
        self.pageIndex = titleIndexPath.row;
        
    };


    //右侧上层item

    self.rightButton.frame = CGRectMake(kScreeSize.width - 40, 20, 40, 44);
    
    [self.rightButton setImage:[UIImage imageNamed:@"news_topic_arrow_view"] forState:UIControlStateNormal];
    
    UIImage *image = [UIImage imageNamed:@"nav_bar_bg_for_seven"];
    
    [self.rightButton setBackgroundImage:image forState:UIControlStateNormal];
    
    [self.rightButton setBackgroundImage:image forState:UIControlStateHighlighted];
    
    [self.rightButton setBackgroundImage:image forState:UIControlStateDisabled];

    [self.rightButton addTarget:self action:@selector(clickToNextPage:) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    [self.navBarView changeTitleColorAndScrollWithItem:self.pageIndex];
    
}

/**
 *  rightButton 的点击事件
 *
 *  @param sender 右上角的按钮
 */
-(void)clickToNextPage:(UIButton *)sender{
    
    self.pageIndex ++;
    
    if (self.pageIndex > self.dataArray.count - 1) {
        
        sender.enabled = NO;
        
        return;
    }
    
    [self.navBarView changeTitleColorAndScrollWithItem:self.pageIndex];
    
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:self.pageIndex inSection:0]
                                atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally
                                        animated:YES];
    
    
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
    
    CSContentCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseCell forIndexPath:indexPath];
    
    cell.item = indexPath.item;
    
    return cell;
    
}

//减速时 调用， 滚动的ontentOffset.x 是整个item 的宽度
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    self.pageIndex = self.collectionView.contentOffset.x / kScreeSize.width;
    
    self.navBarView.contentItem = self.pageIndex;
}



@end
