//
//  AppDelegate.m
//  hack001
//
//  Created by dongouc on 2020/1/3.
//  Copyright © 2020 dongouc. All rights reserved.
//

#import "AppDelegate.h"

/**
step 1: 导入头文件
*/
//#import <LBLelinkKit/LBLelinkKit.h>

/**
step 2: 到乐播官网（http://cloud.hpplay.cn/dev/）注册账号，并添加APP，获取APPid和密钥
*/
NSString * const LBAPPID = @"10104";                                    // APP id
NSString * const LBSECRETKEY = @"8f3d1e8bc4056c50c20761ccf39bec3d";     // 密钥


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    /**
    step 3: 是否打开log，默认是关闭的
    */
   // [LBLelinkKit enableLog:YES];

    /**
    step 4: 使用APP id 和密钥授权授权SDK
    注意：（1）需要在Info.plist中设置ATS；（2）可以异步执行，不影响APP的启动
    */
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        NSError * error = nil;
//        BOOL result = [LBLelinkKit authWithAppid:LBAPPID secretKey:LBSECRETKEY error:&error];
//        if (result) {
//            NSLog(@"授权成功");
//        }else{
//            NSLog(@"授权失败：error = %@",error);
//        }
//    });
    
    
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
