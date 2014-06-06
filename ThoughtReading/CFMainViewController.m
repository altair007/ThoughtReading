//
//  CFMainViewController.m
//  ThoughtReading
//
//  Created by   颜风 on 14-6-4.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import "CFMainViewController.h"
#import "CFResultViewController.h"

@interface CFMainViewController ()

@end

@implementation CFMainViewController

-(void)dealloc
{
    self.orginal = nil;
    self.result = nil;
    
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        NSBundle * thisBundle = [NSBundle bundleForClass:[self class]];
        NSString * path = [thisBundle pathForResource:@"heart" ofType:@"txt"];
        if (nil == path) {
            return  nil;
        }
        
        self.orginal = [[[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil] autorelease];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"读心术";

    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"规则" style:UIBarButtonItemStylePlain target:self action:@selector(didClickRuleBarButtonItemAction:)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"开始读心术" style:UIBarButtonItemStylePlain target:self action:@selector(didClickStartBarButtonItemAction:)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    if ([self isViewLoaded] && nil == self.view.window) {
        self.view = nil;
    }
}

#pragma mark - 事件响应
- (void) didClickRuleBarButtonItemAction: (id) sender
{
    NSString * rule = @"  吉普赛人祖传的神奇读心术，它能够测算出人的内心感应！\n  游戏玩法：任意选择一个两位数（具体说，从10~99之间任意选择一个数）。把这个数的十位与个位相加，再用任意选择的数减去这个数。例如，你选择的数是23，然后2 + 3 = 5，然后23 - 5 = 18。在图表中找到与最后得出的数所对应的汉字，并把这个汉字牢记心中，然后点击“开始读心术”。然后你会发现，显示出来的汉字就是你刚刚心里记下的那个汉字。";
    UIAlertView * ruleView = [[UIAlertView alloc] initWithTitle:@"读心术玩法" message:rule delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [ruleView show];
}

- (void) didClickStartBarButtonItemAction: (id) sender
{
    CFResultViewController * resultVC = [[CFResultViewController alloc] init];
    resultVC.result = self.result;
    
    [self.navigationController pushViewController:resultVC animated: YES];
    
    [resultVC release];
}

#pragma mark - 实例方法
- (UIView *)contentView
{
   self.result = self.randomTargetCharacte;
    
    // 打印0~100个图标组:5个一行,共20列
    UIView * contentView = [[[UIView alloc] init] autorelease];
    contentView.backgroundColor = [UIColor whiteColor];
    CGFloat x = 20.0;
    contentView.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64);
    
    CGRect rectOfLabel = CGRectMake(x, 0, (contentView.frame.size.width - 2 * x) / 5, contentView.frame.size.height / 20);
    
    for (NSUInteger i = 0; i < 20; i++) {
        for (NSUInteger j = 0; j < 5; j++) {
            UILabel * label = [[UILabel alloc] initWithFrame: rectOfLabel];
            NSString * textOfLabel = [[NSString alloc] initWithFormat:@"%2lu%@", i * 5 + j, self.randomChineseCharacte];
            
            if (0 == (i * 5 + j) % 9 && 0 != i * 5 + j) {
                textOfLabel = [[NSString alloc] initWithFormat:@"%2lu%@", i * 5 + j, self.result];
            }
            
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

#pragma mark - 工具方法
- (NSString *) chineseCharacteFromUnichar: (unichar) aUnichar
{
    NSString * unicodeStr = [NSString stringWithFormat:@"\"\\U%x\"", aUnichar];
    NSData *tempData = [unicodeStr dataUsingEncoding:NSUTF8StringEncoding];
    NSString* randomStr = [NSPropertyListSerialization propertyListFromData:tempData
                                                           mutabilityOption:NSPropertyListImmutable
                                                                     format:NULL
                                                           errorDescription:NULL];
    return randomStr;
}

-(NSString *)randomChineseCharacte
{
    NSInteger randomNum =  arc4random()%(0x9fa5-0x4e00 + 1) + 0x4e00;
    return  [self chineseCharacteFromUnichar:randomNum];
}

- (NSString *)randomTargetCharacte
{
    NSString * result;
    result = [self.orginal substringWithRange:NSMakeRange(arc4random()%self.orginal.length, 1)];
    return result;

}
#pragma mark - 重写方法
- (void)viewWillAppear:(BOOL)animated
{
    [self.view addSubview: self.contentView];
}

@end
