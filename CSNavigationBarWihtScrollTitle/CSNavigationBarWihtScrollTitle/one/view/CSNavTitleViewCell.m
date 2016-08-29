//
//  CSNavTitleViewCell.m
//  customTest
//
//  Created by CS on 16/8/20.
//  Copyright © 2016年 Joslyn. All rights reserved.
//

#import "CSNavTitleViewCell.h"

@interface CSNavTitleViewCell ()



@end

@implementation CSNavTitleViewCell



-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        UIButton *button = [[UIButton alloc] init];
        
        self.titleButton = button;
        
        button.userInteractionEnabled = NO;             //关闭button的交互，使点击事件可以传递给item
        
        [self.contentView addSubview:button];
    }
    return self;
}


-(void)layoutSubviews{
    
    self.titleButton.frame = self.contentView.bounds;
    
}

-(void)setModel:(CSNewsNavTitleModel *)model{
    
    _model = model;
    
    [self.titleButton setTitle:model.title forState:UIControlStateNormal];
    
    if (model.isSelect) {
        
        [self.titleButton setTitleColor:[UIColor colorWithRed:0.96 green:0.79 blue:0.55 alpha:1]
                               forState:UIControlStateNormal];
        
    }else{
        
        [self.titleButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
    }
    
}



@end
