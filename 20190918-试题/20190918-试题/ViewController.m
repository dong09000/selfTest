//
//  ViewController.m
//  20190918-试题
//
//  Created by dongouc on 2019/9/18.
//  Copyright © 2019 dongouc. All rights reserved.
//

#import "ViewController.h"

//#import <iosMath/iosMath.h>

#import <WebKit/WebKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

@interface ViewController () <WKUIDelegate, WKNavigationDelegate>
@property (weak, nonatomic) IBOutlet UILabel *lab;
@property (weak, nonatomic) IBOutlet WKWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *str = @"<img src=\"https://hw.xesimg.com/test_library/img/2019/09/11/t_3496017_1568187962_240x177.png?1568191851\"> 听力原文：<br>\nNumber one: Look at the elephant. It's big.<br>\nNumber two: Look at the giraffe. It's tall.<br>\nNumber three: Look at the turtle. It's slow.<br>\nNumber four: Look at the monkey. It's short.<br>";
    NSData *data = [str dataUsingEncoding:NSUnicodeStringEncoding];
    NSDictionary *options = @{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType};
    NSAttributedString *att = [[NSAttributedString alloc] initWithData:data
                                                               options:options
                                                    documentAttributes:nil
                                                                 error:nil];
    UILabel *tLab = UILabel.new;
    [self.view addSubview:tLab];
    tLab.frame = self.view.bounds;
    tLab.attributedText = att;
    //self.lab.attributedText = att;
    
    self.webView.UIDelegate = self;
    self.webView.navigationDelegate = self;
    
//    MTMathUILabel* label = [[MTMathUILabel alloc] init];
//    label.latex = @"巍巍第一次追上昊昊用时：$$100\\div (6-5)=100$$（秒）；此后每一次追及，追及距离都是$$200$$米，每追上一次耗时：$$200\\div (6-5)=200$$（秒）。$$16$$分钟是$$16\\times 60=960$$（秒），$$(960-100)\\div 200=4$$（次）$$\\cdots \\cdots60$$（秒），所以，$$16$$分钟内，巍巍追上昊昊$$1+4=5$$（次）。";
//    label.frame = self.view.bounds;
//
//    [self.view addSubview:label];
}

//-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
//    NSDictionary *j=@{@"answers" :@"$18\\times 901=16218$．",  @"analysis":@"分析加法竖式，可知第一个加数为18，第二个加数为162；<br\/>根据这两个加数的倍数关系：$162=18\\times 9$，可知第二个因数的百位是个位的9倍，那么第二个因数是901；<br\/>所以，乘法算式为$18\\times 901=16218$．",@"subjects":@"请将下面的竖式补充完整．<img src='https:\/\/vsrc.vistateach.com\/hw\/m\/q\/demo3.png'><\/img>",@"question_finish" :@1};
//    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:j options:NSJSONWritingPrettyPrinted error:nil];
//
//    NSString * str = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
//    NSString *js = [NSString stringWithFormat:@"htmlCall(%@)",str];
//    [webView evaluateJavaScript:js completionHandler:nil];
//}

@end
