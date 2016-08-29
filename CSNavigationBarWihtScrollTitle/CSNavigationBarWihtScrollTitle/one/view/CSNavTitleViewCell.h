//
//  CSNavTitleViewCell.h
//  customTest
//
//  Created by CS on 16/8/20.
//  Copyright © 2016年 Joslyn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CSNewsNavTitleModel.h"

@interface CSNavTitleViewCell : UICollectionViewCell

@property (nonatomic, weak) CSNewsNavTitleModel *model;

@property (nonatomic, weak) UIButton *titleButton;

@end
