//
//  ViewController.m
//  20191208test
//
//  Created by dongouc on 2019/12/8.
//  Copyright © 2019 dongouc. All rights reserved.
//

#import "ViewController.h"
#import <StoreKit/StoreKit.h>

@interface ViewController ()

@end

@interface NSArray (test)
- (NSString *)jsonStringEncoded;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSArray *array = @[@"https://xesfile.xesimg.com/XES/OA/D0AFCADEEEEF07C4E7D52CD0692B84BD.png" ];
    NSLog(@"%s， %d, %@", __func__, __LINE__, array);
    NSLog(@"%s， %d, %@", __func__, __LINE__, array.jsonStringEncoded);
}




@end

@implementation NSArray (test)

- (NSString *)jsonStringEncoded {
    if ([NSJSONSerialization isValidJSONObject:self]) {
        NSError *error = nil;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:0 error:&error];
        NSString *json = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        if (!error) return json;
    }
    return nil;
}

@end
