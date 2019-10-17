//
//  ViewController.m
//  20190918_testLatex
//
//  Created by dongouc on 2019/9/18.
//  Copyright © 2019 dongouc. All rights reserved.
//

#import "ViewController.h"
#import <iosMath/iosMath.h>

#import <WebKit/WebKit.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self test04];
    [self test03:@"巍巍第一次追上昊昊用时：$$100\\div (6-5)=100$$（秒)"];
}

- (void)test01
{
    // Do any additional setup after loading the view.
    MTMathUILabel* label = [[MTMathUILabel alloc] init];
    label.latex = [NSString stringWithFormat:@"%@", @"$$(360-90)\\div (20+{{v}_{\\text{1}}})\\times {{v}_{\\text{1}}}=270{v}_{\\text{1}}\\div (20+{{v}_{\\text{1}}})$$"];
    //label.labelMode = kMTMathUILabelMode;
    label.frame = self.view.bounds;
    
    [self.view addSubview:label];
}

- (void)test02
{
    NSString *str = @"巍巍第一次追上昊昊用时：$$100\\div (6-5)=100$$（秒）；此后每一次追及，追及距离都是$$200$$米，每追上一次耗时：$$200\\div (6-5)=200$$（秒）。$$16$$分钟是$$16\\times 60=960$$（秒），$$(960-100)\\div 200=4$$（次）$$\\cdots \\cdots60$$（秒），所以，$$16$$分钟内，巍巍追上昊昊$$1+4=5$$（次）";
    
    WKWebView *webView = [[WKWebView alloc] init];
    webView.frame = self.view.bounds;
    [self.view addSubview:webView];
    [webView loadHTMLString:str baseURL:nil];
}

- (void)test03:(NSString *)latexStr
{
    NSArray *strArray = [latexStr componentsSeparatedByString:@"$$"];
    if (strArray.count < 3)
    {
        // 无公式
        
        return;
    }
    
    
}

- (void)test04
{
    NSString *str = @"<img src=\"https://hw.xesimg.com/test_library/img/2019/09/11/t_3496017_1568187962_240x177.png?1568191851\"> <br>\n听力原文：<br>\nNumber one: Look at the elephant. It's big.<br>\nNumber two: Look at the giraffe. It's tall.<br>\nNumber three: Look at the turtle. It's slow.<br>\nNumber four: Look at the monkey. It's short.<br>";
    NSData *data = [str dataUsingEncoding:NSUnicodeStringEncoding];
    NSDictionary *options = @{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType};
    NSAttributedString *att = [[NSAttributedString alloc] initWithData:data
                                                               options:options
                                                    documentAttributes:nil
                                                                 error:nil];
    UILabel *tLab = UILabel.new;
    tLab.numberOfLines = 0;
    [self.view addSubview:tLab];
    tLab.frame = self.view.bounds;
    tLab.attributedText = att;
}


@end
