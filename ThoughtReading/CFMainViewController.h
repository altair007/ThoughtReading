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
@property (assign, nonatomic, readonly) UIView * contentView; //!< 内容视图.
@property (retain, nonatomic) UIView * navBarView; //!< 导航视图.
@property (retain, nonatomic) UIView * resultView; //!< 结果视图
@property (retain, nonatomic) NSString * result; //!< 结果

@end
