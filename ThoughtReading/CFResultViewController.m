//
//  CFResultViewController.m
//  ThoughtReading
//
//  Created by   颜风 on 14-6-5.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import "CFResultViewController.h"

@interface CFResultViewController ()

@end

@implementation CFResultViewController
-(void)dealloc
{
    self.result = nil;
    
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"结果";
    
    // ???: 必须重设左侧按钮?不可以借助默认的,单单更改一个label的text值?
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"再试一次" style:UIBarButtonItemStylePlain target:self action:@selector(didClickPlayAgainButtonItemAction:)];
    
    // FIXME: 应该变大点!
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 50, 50)];
    label.text = self.result;
    label.center = self.view.center;
    [self.view addSubview: label];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 事件响应
// ???:事件响应函数,不在头文件中声明真的好吗?如果考虑到继承的吗?子类无意中覆盖了父类的某个方法??
- (void) didClickPlayAgainButtonItemAction: (id) sender
{
    [self.navigationController popViewControllerAnimated:YES];
}


@end
