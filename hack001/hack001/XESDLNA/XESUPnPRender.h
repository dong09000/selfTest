//
//  XESUPnPRender.h
//  hack001
//
//  Created by dongouc on 2020/1/4.
//  Copyright © 2020 dongouc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XESUPnPAVPositionInfo.h"

NS_ASSUME_NONNULL_BEGIN

@protocol XESUPnPResponseDelegate;
@class XESUPnPDevice;
@interface XESUPnPRender : NSObject

@property (nonatomic, strong) XESUPnPDevice *model;

@property (nonatomic, strong) id<XESUPnPResponseDelegate>delegate;

/**
 初始化
 @param model 搜索得到的UPnPModel
 @return self
 */
- (instancetype)initWithModel:(XESUPnPDevice *)model;

/**
 设置投屏地址
 @param urlStr 视频url
 */
- (void)setAVTransportURL:(NSString *)urlStr;

/**
 设置下一个播放地址
 @param urlStr 下一个视频url
 */
- (void)setNextAVTransportURI:(NSString *)urlStr;

/**
 播放
 */
- (void)play;

/**
 暂停
 */
- (void)pause;

/**
 结束
 */
- (void)stop;

/**
 下一个
 */
- (void)next;

/**
 前一个
 */
- (void)previous;

/**
 跳转进度
 @param relTime 进度时间(单位秒)
 */
- (void)seek:(float)relTime;

/**
 跳转至特定进度或视频
 @param target 目标值，可以是 00:02:21 格式的进度或者整数的 TRACK_NR。
 @param unit   REL_TIME（跳转到某个进度）或 TRACK_NR（跳转到某个视频）。
 */
- (void)seekToTarget:(NSString *)target Unit:(NSString *)unit;

/**
 获取播放进度,可通过协议回调使用
 */
- (void)getPositionInfo;

/**
 获取播放状态,可通过协议回调使用
 */
- (void)getTransportInfo;

/**
 获取音频,可通过协议回调使用
 */
- (void)getVolume;

/**
 设置音频值
 @param value 值—>整数
 */
- (void)setVolumeWith:(NSString *)value;

@end



// 响应解析回调协议
@protocol XESUPnPResponseDelegate <NSObject>

@required

- (void)upnpSetAVTransportURIResponse;  // 设置url响应
- (void)upnpGetTransportInfoResponse:(XESUPnPTransportInfo *)info;   // 获取播放状态

@optional

/**
 未定义的响应/错误
 
 @param resXML  响应XML
 @param postXML 请求的动作
 */
- (void)upnpUndefinedResponse:(NSString *)resXML postXML:(NSString *)postXML;

- (void)upnpPlayResponse;                   // 播放响应
- (void)upnpPauseResponse;                  // 暂停响应
- (void)upnpStopResponse;                   // 停止投屏
- (void)upnpSeekResponse;                   // 跳转响应
- (void)upnpPreviousResponse;               // 以前的响应
- (void)upnpNextResponse;                   // 下一个响应
- (void)upnpSetVolumeResponse;              // 设置音量响应
- (void)upnpSetNextAVTransportURIResponse;  // 设置下一个url响应
- (void)upnpGetVolumeResponse:(NSString *)volume;                   // 获取音频信息
- (void)upnpGetPositionInfoResponse:(XESUPnPAVPositionInfo *)info;   // 获取播放进度


@end

NS_ASSUME_NONNULL_END
