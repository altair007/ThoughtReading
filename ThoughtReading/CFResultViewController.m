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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    if ([self isViewLoaded] && nil == self.view.window) {
        self.view = nil;
    }
}

#pragma mark - 事件响应
- (void) didClickPlayAgainButtonItemAction: (id) sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 重写方法
-(void)viewWillAppear:(BOOL)animated
{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"再试一次" style:UIBarButtonItemStylePlain target:self action:@selector(didClickPlayAgainButtonItemAction:)];

}

- (void)viewDidAppear:(BOOL)animated
{
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 50, 50)];
    label.text = self.result;
    label.center = self.view.center;
    [self.view addSubview: label];
    [label release];
}


@end
