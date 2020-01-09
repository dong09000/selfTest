//
//  XESUPnPServer.h
//  hack001
//
//  Created by dongouc on 2020/1/4.
//  Copyright © 2020 dongouc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class XESUPnPDevice;
@protocol XESUPnPServerDelegate <NSObject>
@required
/**
 搜索结果

 @param devices 设备数组
 */
- (void)upnpSearchChangeWithResults:(NSArray <XESUPnPDevice *>*)devices;

@optional
/**
 搜索失败

 @param error error
 */
- (void)upnpSearchErrorWithError:(NSError *)error;

@end

@interface XESUPnPServer : NSObject

@property (nonatomic, weak) id<XESUPnPServerDelegate>delegate;

@property (nonatomic,assign) NSInteger searchTime;

+ (instancetype)shareServer;

/**
 启动Server并搜索
 */
- (void)start;

/**
 停止
 */
- (void)stop;

/**
 搜索
 */
- (void)search;

/**
 获取已经发现的设备
 
 @return Device Array
 */
- (NSArray<XESUPnPDevice *> *)getDeviceList;

@end

NS_ASSUME_NONNULL_END
