//
//  XESStopAction.m
//  hack001
//
//  Created by dongouc on 2020/1/4.
//  Copyright © 2020 dongouc. All rights reserved.
//

#import "XESStopAction.h"
#import "XESUPnPRender.h"

@interface XESStopAction ()<XESUPnPResponseDelegate>
@property (nonatomic, copy) void(^successCallback)(void);
@property (nonatomic, copy) void(^failureCallback)(void);

@property(nonatomic,strong) XESUPnPRender *render;         //MDR渲染器

@end

@implementation XESStopAction

@synthesize successCallback = _successCallback;
@synthesize failureCallback = _failureCallback;

- (instancetype)initWithDevice:(XESUPnPDevice *) device Success:(void (^)(void))successBlock failure:(void (^)(void))failureBlock
{
    self = [self init];
    
    self.successCallback = successBlock;
    self.failureCallback = failureBlock;
    
    self.render = [[XESUPnPRender alloc] initWithModel:device];
    self.render.delegate = self;

    return self;
}
-(void)executeAction{
    [self.render stop];
}

#pragma mark CLUPnPResponseDelegate
- (void)upnpPlayResponse{
    if (self.failureCallback) {
        self.failureCallback();
    }
}
- (void)upnpStopResponse{
    if (self.successCallback) {
        self.successCallback();
    }
}

- (void)upnpGetTransportInfoResponse:(XESUPnPTransportInfo *)info {
    //
}


- (void)upnpSetAVTransportURIResponse {
    //
}

@end
