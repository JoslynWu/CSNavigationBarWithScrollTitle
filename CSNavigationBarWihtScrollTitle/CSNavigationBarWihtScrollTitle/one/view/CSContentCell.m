//
//  CSContentCell.m
//  customTest
//
//  Created by CS on 16/8/20.
//  Copyright © 2016年 Joslyn. All rights reserved.
//

#import "CSContentCell.h"


static NSString *reuseIdCell = @"cell";



@interface CSContentCell () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) UITableView *tableView;

@end

@implementation CSContentCell

-(void)setItem:(NSInteger)item{
    
    _item = item;
    
    [self.tableView reloadData];
}

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        UITableView *tableView = [[UITableView alloc] init];
        
        self.tableView = tableView;
        
        [self.contentView addSubview:tableView];
    }
    return self;
}

-(void)layoutSubviews{
    
    self.tableView.frame = self.contentView.bounds;
    
    self.tableView.dataSource = self;
    
    self.tableView.delegate = self;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:reuseIdCell];
    
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdCell];
    
    cell.textLabel.text = [NSString stringWithFormat:@"item-->%zd,cell-->%ld",self.item, indexPath.row];
        
    return cell;
}



@end