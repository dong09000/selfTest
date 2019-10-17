//
//  ViewController.m
//  20190828-test
//
//  Created by dongouc on 2019/8/28.
//  Copyright © 2019 dongouc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"%s， %d", __func__, __LINE__);
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"%s， %d", __func__, __LINE__);
        });
        NSLog(@"%s， %d", __func__, __LINE__);
    });
    NSLog(@"%s， %d", __func__, __LINE__);
}


@end
