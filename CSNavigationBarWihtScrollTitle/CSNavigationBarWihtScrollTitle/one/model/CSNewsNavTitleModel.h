//
//  CSNewsNavTitleModel.h
//  customTest
//
//  Created by CS on 16/8/24.
//  Copyright © 2016年 Joslyn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CSNewsNavTitleModel : NSObject

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) BOOL isSelect;

/**
 *  对象初始化方法，对象方法
 *
 *  @param dict 传入的字典数据
 *
 *  @return 返回当前类的对象
 */
-(instancetype)initWithDict:(NSDictionary *)dict;
/**
 *  对象初始化方法，类方法
 *
 *  @param dict 传入的字典数据
 *
 *  @return 返回当前类的对象
 */
+(instancetype)modelWithDict:(NSDictionary *)dict;
/**
 *  根据当前的plist文件模型数组
 *
 *  @param fileName plist文件名
 *
 *  @return 返回模型数组
 */
+(NSArray *)arrayWithPlistFileName:(NSString *)fileName;

@end
