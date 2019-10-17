//
//  ViewController.m
//  20190903-ModelTest
//
//  Created by dongouc on 2019/9/3.
//  Copyright © 2019 dongouc. All rights reserved.
//

#import "ViewController.h"

//#import <dyfOAtestSDK/testForVc.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    testForVc *testVc = testForVc.new;
//    [testVc test001];
    Class targetClass = NSClassFromString(@"testForVc");
    SEL sel = NSSelectorFromString(@"test001");
    [targetClass.new performSelector:sel];
}


@end
