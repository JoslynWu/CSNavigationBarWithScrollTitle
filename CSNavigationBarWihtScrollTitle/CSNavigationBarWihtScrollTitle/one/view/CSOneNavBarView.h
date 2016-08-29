//
//  CSOneNavBarView.h
//  customTest
//
//  Created by CS on 16/8/20.
//  Copyright © 2016年 Joslyn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CSOneNavBarView : UIView

@property (nonatomic, assign) NSInteger contentItem;

/**点击导航栏切换内容页*/
@property (nonatomic, copy) void(^clickTitleToSwitchContentBlock)(NSIndexPath *);

/**
 *  根据传入的下标，滚动item，设置title的文字颜色
 *
 *  @param item 中间内容的下标
 */
-(void)changeTitleColorAndScrollWithItem:(NSInteger)item;




@end
