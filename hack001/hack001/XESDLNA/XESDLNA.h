//
//  XESDLNA.h
//  hack001
//
//  Created by dongouc on 2020/1/4.
//  Copyright © 2020 dongouc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XESUPnPDevice.h"

NS_ASSUME_NONNULL_BEGIN
@protocol XESDLNADelegate <NSObject>

@optional
/**
 DLNA局域网搜索设备结果
 @param devicesArray <XESUPnPDevice *> 搜索到的设备
 */
- (void)searchDLNAResult:(NSArray<XESUPnPDevice *> *)devicesArray;


/**
 投屏成功开始播放
 */
- (void)dlnaStartPlay;

@end
@interface XESDLNA : NSObject

@property(nonatomic,weak)id<XESDLNADelegate> delegate;

@property(nonatomic, strong) XESUPnPDevice *device;

@property(nonatomic,copy) NSString *playUrl;

@property(nonatomic,assign) NSInteger searchTime;

/**
 单例
 */
+(instancetype)sharedManager;

/**
 搜设备
 */
- (void)startSearch;

/**
 DLNA投屏
 */
- (void)startDLNA;
/**
 DLNA投屏(首先停止)---投屏不了可以使用这个方法
 ** 【流程: 停止 ->设置代理 ->设置Url -> 播放】
 */
- (void)startDLNAAfterStop;

/**
 退出DLNA
 */
- (void)endDLNA;

/**
 播放
 */
- (void)dlnaPlay;

/**
 暂停
 */
- (void)dlnaPause;

/**
 设置音量 volume建议传0-100之间字符串
 */
- (void)volumeChanged:(NSString *)volume;

/**
 设置播放进度 seek单位是秒
 */
- (void)seekChanged:(NSInteger)seek;

/**
 播放切集
 */
- (void)playTheURL:(NSString *)url;
@end

NS_ASSUME_NONNULL_END
