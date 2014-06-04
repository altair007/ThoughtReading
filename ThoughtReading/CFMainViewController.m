//
//  CFMainViewController.m
//  ThoughtReading
//
//  Created by   颜风 on 14-6-4.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import "CFMainViewController.h"

@interface CFMainViewController ()

@end

@implementation CFMainViewController

-(void)dealloc
{
    self.navBarView = nil;
    self.resultView = nil;
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
    // Do any additional setup after loading the view.
    //???: 如何不显示状态栏 ,最上面那个!
    
#pragma mark - 原始代码
    UIView * superView = self.view; // 视图的父视图
    id targetOfStartButton = self; // "开始"按钮的target
    SEL actionOfStartButton = @selector(didClickStartButtonAction:); // 响应方法
    id targetOfRuleButton = self; // "规则"按钮的target
    SEL actionOfRuleButton = @selector(didClickRuleButtonAction:); // 响应方法
    
#pragma mark - 按钮部分
    UIView * viewOfButtons = [[UIView alloc] initWithFrame:CGRectMake(0, 0, superView.frame.size.width, superView.frame.size.height * 0.1)];
    
    UIButton * startButton = [UIButton buttonWithType:UIButtonTypeSystem];
    startButton.frame = CGRectMake(0, 0, viewOfButtons.frame.size.width/2 - 1, viewOfButtons.frame.size.height);
    [startButton setTitle:@"开始读心术" forState: UIControlStateNormal];
    [startButton addTarget: targetOfStartButton action: actionOfStartButton forControlEvents:UIControlEventTouchUpInside];
    startButton.backgroundColor = [UIColor blueColor];
    [viewOfButtons addSubview: startButton];
    
    UIButton * ruleButton = [UIButton buttonWithType:UIButtonTypeSystem];
    ruleButton.frame = CGRectMake(startButton.frame.size.width + 1, 0, viewOfButtons.frame.size.width/2, viewOfButtons.frame.size.height);
    [ruleButton setTitle:@"规则" forState: UIControlStateNormal];
    ruleButton.backgroundColor = [UIColor blueColor];
    [ruleButton addTarget: targetOfRuleButton action: actionOfRuleButton forControlEvents: UIControlEventTouchUpInside];
    [viewOfButtons addSubview: ruleButton];
    
    [superView addSubview: viewOfButtons];
    [viewOfButtons release];
    
    self.navBarView = viewOfButtons;
    
#pragma mark - 核心视图部分
    [self.view addSubview: self.contentView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 事件响应
- (void) didClickStartButtonAction: (UIButton *) aButton
{
    // 随机产生一个汉字
//    NSInteger i =  arc4random()%(0x9fa5-0x4e00 + 1) + 0x4e00;
//    NSString * unicodeStr = [NSString stringWithFormat:@"\"\\U%lx\"", i];
//    NSData *tempData = [unicodeStr dataUsingEncoding:NSUTF8StringEncoding];
//    NSString* randomStr = [NSPropertyListSerialization propertyListFromData:tempData
//                                                           mutabilityOption:NSPropertyListImmutable
//                                                                     format:NULL
//                                                           errorDescription:NULL];
//    NSLog(@"%@", randomStr);
    
    // 开始读心术
    if ([aButton.currentTitle isEqualToString:@"开始读心术"]) {
        if (nil == self.resultView) {
            self.resultView = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - self.navBarView.frame.size.height)] autorelease];
            UILabel * label = [[UILabel alloc] init];
            [self.resultView addSubview: label];
            // !!!: 逻辑有点错误!
            [self.view addSubview:self.resultView];
            [label release];
        }
        UILabel * label = self.resultView.subviews[0];
        label.text = self.result;
        
        [aButton setTitle:@"再试一次" forState: UIControlStateNormal];
        return;
    }
    
    // 再试一次
    if([aButton.currentTitle isEqualToString: @"再试一次"]){
        [self.contentView removeFromSuperview];
        [self.view addSubview:self.contentView];
        
        [aButton setTitle:@"再试一次" forState: UIControlStateNormal];
        return;
    }
}

- (void) didClickRuleButtonAction: (UIButton *) aButton
{
    NSString * rule = @"  吉普赛人祖传的神奇读心术，它能够测算出人的内心感应！\n  游戏玩法：任意选择一个两位数（具体说，从10~99之间任意选择一个数）。把这个数的十位与个位相加，再用任意选择的数减去这个数。例如，你选择的数是23，然后2 + 3 = 5，然后23 - 5 = 18。在图表中找到与最后得出的数所对应的汉字，并把这个汉字牢记心中，然后点击“开始读心术”。然后你会发现，显示出来的图形就是你刚刚心里记下的那个图形。";
    UIAlertView * ruleView = [[UIAlertView alloc] initWithTitle:@"读心术玩法" message:rule delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [ruleView show];
}

#pragma mark - 实例方法
- (UIView *)contentView
{
#pragma mark - 核心视图部分
    // 打印0~100个图标组:5个一行,共20列
    UIView * contentView = [[[UIView alloc] init] autorelease];
    CGFloat x = 20.0;
    contentView.frame = CGRectMake(0, self.navBarView.frame.size.height, self.view.frame.size.width, self.view.frame.size.height - self.navBarView.frame.size.height);
    
    CGRect rectOfLabel = CGRectMake(x, 0, (contentView.frame.size.width - 2 * x) / 5, contentView.frame.size.height / 20);
    
    for (NSUInteger i = 0; i < 20; i++) {
        for (NSUInteger j = 0; j < 5; j++) {
            UILabel * label = [[UILabel alloc] initWithFrame: rectOfLabel];
            NSString * textOfLabel = [[NSString alloc] initWithFormat:@"%2lu", i * 5 + j ];
            label.text = textOfLabel;
            [contentView addSubview: label];
            
            [textOfLabel release];
            [label release];
            
            rectOfLabel = CGRectMake(rectOfLabel.origin.x + rectOfLabel.size.width, rectOfLabel.origin.y, rectOfLabel.size.width, rectOfLabel.size.height);
        }
        
        rectOfLabel = CGRectMake(x, rectOfLabel.origin.y + rectOfLabel.size.height, rectOfLabel.size.width, rectOfLabel.size.height);
    }
    
    return contentView;
}

@end
