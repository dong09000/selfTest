//
//  XESStopAction.h
//  hack001
//
//  Created by dongouc on 2020/1/4.
//  Copyright © 2020 dongouc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XESUPnPServer.h"

NS_ASSUME_NONNULL_BEGIN

@interface XESStopAction : NSObject

@property(nonatomic, strong) XESUPnPServer *device;

- (instancetype)initWithDevice:(XESUPnPDevice *) device Success:(void(^)(void))successBlock failure:(void(^)(void))failureBlock;
-(void)executeAction;

@end

NS_ASSUME_NONNULL_END
