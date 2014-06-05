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
@property (retain, nonatomic) NSString * orginal; //!< 要显示的字符串
@property (retain, nonatomic) NSString * result; //!< 当次要显示的字符

#pragma mark - 工具方法
/**
 *  随机产生一个汉字
 *
 *  @return 返回一个随机产生的汉字
 */
- (NSString *) randomChineseCharacte;

/**
 *  随机返回一个目标字符串中的一个字符.
 *
 *  @return 随机汉字
 */
- (NSString *)randomTargetCharacte;

/**
 *  根据一个汉字的utf-8码值,生成一个含有该汉字的string.
 *
 *  @param aUnichar 一个汉字的utf-8码
 *
 *  @return 含有该汉字的字符串.
 */
- (NSString *) chineseCharacteFromUnichar: (unichar) aUnichar;
@end
