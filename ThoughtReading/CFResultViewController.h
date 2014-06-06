//
//  CFResultViewController.h
//  ThoughtReading
//
//  Created by   颜风 on 14-6-5.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CFResultViewController : UIViewController
@property (copy, nonatomic) NSString * result; //!< 结果
/**
 *  响应"再次测试"事件
 *
 *  @param sender 发送消息的对象
 */
- (void) didClickPlayAgainButtonItemAction: (id) sender;
@end
