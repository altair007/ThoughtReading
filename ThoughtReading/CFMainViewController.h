//
//  CFMainViewController.h
//  ThoughtReading
//
//  Created by   颜风 on 14-6-4.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  主试图控制器
 */
@interface CFMainViewController : UIViewController
#pragma mark - 属性
@property (retain, nonatomic) NSString * result; //!< 结果

#pragma mark - 工具方法
/**
 *  随机产生一个汉字
 *
 *  @return 返回一个随机产生的汉字
 */
- (NSString *) randomChineseCharacte;

/**
 *  temp
 *
 *  @return 随机汉字
 */
- (NSString *)randomChineseCharacteTemp;
@end
