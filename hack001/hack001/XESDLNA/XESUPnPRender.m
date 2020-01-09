//
//  XESUPnPRender.m
//  hack001
//
//  Created by dongouc on 2020/1/4.
//  Copyright © 2020 dongouc. All rights reserved.
//

#import "XESUPnPRender.h"
#import "GDataXMLNode.h"
#import "XESUPnPAction.h"
#import "DLNAconst.h"

#define VideoDIDL @"<DIDL-Lite xmlns=\"urn:schemas-upnp-org:metadata-1-0/DIDL-Lite/\" xmlns:dc=\"http://purl.org/dc/elements/1.1/\" xmlns:sec=\"http://www.sec.co.kr/\" xmlns:upnp=\"urn:schemas-upnp-org:metadata-1-0/upnp/\"><item id=\"f-0\" parentID=\"0\" restricted=\"0\"><dc:title>Video</dc:title><dc:creator>Anonymous</dc:creator><upnp:class>object.item.videoItem</upnp:class><res protocolInfo=\"http-get:*:video/*:DLNA.ORG_OP=01;DLNA.ORG_CI=0;DLNA.ORG_FLAGS=01700000000000000000000000000000\" sec:URIType=\"public\">%@</res></item></DIDL-Lite>"

@implementation XESUPnPRender

- (instancetype)initWithModel:(XESUPnPDevice *)model{
    self = [super init];
    if (self) {
        _model = model;
    }
    return self;
}

#pragma mark -
#pragma mark -- AVTransport动作 --
- (void)setAVTransportURL:(NSString *)urlStr{
    XESUPnPAction *action = [[XESUPnPAction alloc] initWithAction:@"SetAVTransportURI"];
    [action setArgumentValue:@"0" forName:@"InstanceID"];
    [action setArgumentValue:urlStr forName:@"CurrentURI"];
    [action setArgumentValue:VideoDIDL forName:@"CurrentURIMetaData"];
    [self postRequestWith:action];
}

- (void)setNextAVTransportURI:(NSString *)urlStr{
    XESUPnPAction *action = [[XESUPnPAction alloc] initWithAction:@"SetNextAVTransportURI"];
    [action setArgumentValue:@"0" forName:@"InstanceID"];
    [action setArgumentValue:urlStr forName:@"NextURI"];
    [action setArgumentValue:@"" forName:@"NextURIMetaData"];
    [self postRequestWith:action];
    
}

- (void)play{
    XESUPnPAction *action = [[XESUPnPAction alloc] initWithAction:@"Play"];
    [action setArgumentValue:@"0" forName:@"InstanceID"];
    [action setArgumentValue:@"1" forName:@"Speed"];
    [self postRequestWith:action];
}

- (void)pause{
    XESUPnPAction *action = [[XESUPnPAction alloc] initWithAction:@"Pause"];
    [action setArgumentValue:@"0" forName:@"InstanceID"];
    [self postRequestWith:action];
}

- (void)stop{
    XESUPnPAction *action = [[XESUPnPAction alloc] initWithAction:@"Stop"];
    [action setArgumentValue:@"0" forName:@"InstanceID"];
    [self postRequestWith:action];
}

- (void)next{
    XESUPnPAction *action = [[XESUPnPAction alloc] initWithAction:@"Next"];
    [action setArgumentValue:@"0" forName:@"InstanceID"];
    [self postRequestWith:action];
}

- (void)previous{
    XESUPnPAction *action = [[XESUPnPAction alloc] initWithAction:@"Previous"];
    [action setArgumentValue:@"0" forName:@"InstanceID"];
    [self postRequestWith:action];
}

- (void)getPositionInfo{
    XESUPnPAction *action = [[XESUPnPAction alloc] initWithAction:@"GetPositionInfo"];
    [action setArgumentValue:@"0" forName:@"InstanceID"];
    [self postRequestWith:action];
}

- (void)getTransportInfo{
    XESUPnPAction *action = [[XESUPnPAction alloc] initWithAction:@"GetTransportInfo"];
    [action setArgumentValue:@"0" forName:@"InstanceID"];
    [self postRequestWith:action];
}

- (void)seek:(float)relTime{
    [self seekToTarget:[NSString stringWithDurationTime:relTime] Unit:unitREL_TIME];
}

- (void)seekToTarget:(NSString *)target Unit:(NSString *)unit{
    XESUPnPAction *action = [[XESUPnPAction alloc] initWithAction:@"Seek"];
    [action setArgumentValue:@"0" forName:@"InstanceID"];
    [action setArgumentValue:unit forName:@"Unit"];
    [action setArgumentValue:target forName:@"Target"];
    [self postRequestWith:action];
}

#pragma mark -
#pragma mark -- RenderingControl动作 --
- (void)getVolume{
    XESUPnPAction *action = [[XESUPnPAction alloc] initWithAction:@"GetVolume"];
    [action setServiceType: XESUPnPServiceRenderingControl];
    [action setArgumentValue:@"0" forName:@"InstanceID"];
    [action setArgumentValue:@"Master" forName:@"Channel"];
    [self postRequestWith:action];
}

- (void)setVolumeWith:(NSString *)value{
    XESUPnPAction *action = [[XESUPnPAction alloc] initWithAction:@"SetVolume"];
    [action setServiceType: XESUPnPServiceRenderingControl];
    [action setArgumentValue:@"0" forName:@"InstanceID"];
    [action setArgumentValue:@"Master" forName:@"Channel"];
    [action setArgumentValue:value forName:@"DesiredVolume"];
    [self postRequestWith:action];
}

#pragma mark -
#pragma mark -- 发送动作请求 --
- (void)postRequestWith:(XESUPnPAction *)action{
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL       *url = [NSURL URLWithString:[action getPostUrlStrWith:_model]];
    NSString    *postXML = [action getPostXMLFile];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";
    [request addValue:@"text/xml" forHTTPHeaderField:@"Content-Type"];
    [request addValue:[action getSOAPAction] forHTTPHeaderField:@"SOAPAction"];
    request.HTTPBody = [postXML dataUsingEncoding:NSUTF8StringEncoding];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error || data == nil) {
            [self _UndefinedResponse:nil postXML:postXML];
            return;
        }else{
            [self parseRequestResponseData:data postXML:postXML];
        }
    }];
    [dataTask resume];
}

#pragma mark -
#pragma mark -- 动作响应 --
- (void)parseRequestResponseData:(NSData *)data postXML:(NSString *)postXML{
    GDataXMLDocument *xmlDoc = [[GDataXMLDocument alloc] initWithData:data options:0 error:nil];
    GDataXMLElement *xmlEle = [xmlDoc rootElement];
    NSArray *bigArray = [xmlEle children];
    for (int i = 0; i < [bigArray count]; i++) {
        GDataXMLElement *element = [bigArray objectAtIndex:i];
        NSArray *needArr = [element children];
        if ([[element name] hasSuffix:@"Body"]) {
            [self resultsWith:needArr postXML:postXML];
        }else{
            [self _UndefinedResponse:[xmlEle XMLString] postXML:postXML];
        }
    }
}

- (void)resultsWith:(NSArray *)array postXML:(NSString *)postXML{
    for (int i = 0; i < array.count; i++) {
        GDataXMLElement *ele = [array objectAtIndex:i];
        if ([[ele name] hasSuffix:@"SetAVTransportURIResponse"]) {
            [self _SetAVTransportURIResponse];
            [self getTransportInfo];
        }else if ([[ele name] hasSuffix:@"SetNextAVTransportURIResponse"]){
            [self _SetNextAVTransportURIResponse];
        }else if ([[ele name] hasSuffix:@"PauseResponse"]){
            [self _PauseResponse];
        }else if ([[ele name] hasSuffix:@"PlayResponse"]){
            [self _PlayResponse];
        }else if ([[ele name] hasSuffix:@"StopResponse"]){
            [self _StopResponse];
        }else if ([[ele name] hasSuffix:@"SeekResponse"]){
            [self _SeekResponse];
        }else if ([[ele name] hasSuffix:@"NextResponse"]){
            [self _NextResponse];
        }else if ([[ele name] hasSuffix:@"PreviousResponse"]){
            [self _PreviousResponse];
        }else if ([[ele name] hasSuffix:@"SetVolumeResponse"]){
            [self _SetVolumeResponse];
        }else if ([[ele name] hasSuffix:@"GetVolumeResponse"]){
            [self _GetVolumeSuccessWith:[ele children]];
        }else if ([[ele name] hasSuffix:@"GetPositionInfoResponse"]){
            [self _GetPositionInfoResponseWith:[ele children]];
        }else if ([[ele name] hasSuffix:@"GetTransportInfoResponse"]){
            [self _GetTransportInfoResponseWith:[ele children]];
        }else{
            [self _UndefinedResponse:[ele XMLString] postXML:postXML];
        }
    }
}

#pragma mark -
#pragma mark -- 回调协议 --
- (void)_SetAVTransportURIResponse{
    if ([self.delegate respondsToSelector:@selector(upnpSetAVTransportURIResponse)]) {
        [self.delegate upnpSetAVTransportURIResponse];
    }
}

- (void)_SetNextAVTransportURIResponse{
    if ([self.delegate respondsToSelector:@selector(upnpSetNextAVTransportURIResponse)]) {
        [self.delegate upnpSetNextAVTransportURIResponse];
    }
}

- (void)_PauseResponse{
    if ([self.delegate respondsToSelector:@selector(upnpPauseResponse)]) {
        [self.delegate upnpPauseResponse];
    }
}

- (void)_PlayResponse{
    if ([self.delegate respondsToSelector:@selector(upnpPlayResponse)]) {
        [self.delegate upnpPlayResponse];
    }
}

- (void)_StopResponse{
    if ([self.delegate respondsToSelector:@selector(upnpStopResponse)]) {
        [self.delegate upnpStopResponse];
    }
}

- (void)_SeekResponse{
    if ([self.delegate respondsToSelector:@selector(upnpSeekResponse)]) {
        [self.delegate upnpSeekResponse];
    }
}

- (void)_NextResponse{
    if ([self.delegate respondsToSelector:@selector(upnpNextResponse)]) {
        [self.delegate upnpNextResponse];
    }
}

- (void)_PreviousResponse{
    if ([self.delegate respondsToSelector:@selector(upnpPreviousResponse)]) {
        [self.delegate upnpPreviousResponse];
    }
}

- (void)_SetVolumeResponse{
    if ([self.delegate respondsToSelector:@selector(upnpSetVolumeResponse)]) {
        [self.delegate upnpSetVolumeResponse];
    }
}

- (void)_GetVolumeSuccessWith:(NSArray *)array{
    for (int j = 0; j < array.count; j++) {
        GDataXMLElement *eleXml = [array objectAtIndex:j];
        if ([[eleXml name] isEqualToString:@"CurrentVolume"]) {
            if ([self.delegate respondsToSelector:@selector(upnpGetVolumeResponse:)]) {
                [self.delegate upnpGetVolumeResponse:[eleXml stringValue]];
            }
        }
    }
}

- (void)_GetPositionInfoResponseWith:(NSArray *)array{
    XESUPnPAVPositionInfo *info = [[XESUPnPAVPositionInfo alloc] init];
    [info setArray:array];
    if ([self.delegate respondsToSelector:@selector(upnpGetPositionInfoResponse:)]) {
        [self.delegate upnpGetPositionInfoResponse:info];
    }
}

- (void)_GetTransportInfoResponseWith:(NSArray *)array{
    XESUPnPTransportInfo *info = [[XESUPnPTransportInfo alloc] init];
    [info setArray:array];
    if ([self.delegate respondsToSelector:@selector(upnpGetTransportInfoResponse:)]) {
        [self.delegate upnpGetTransportInfoResponse:info];
    }
}

- (void)_UndefinedResponse:(NSString *)xmlStr postXML:(NSString *)postXML{
    NSLog(@"===========发送信息:%@ \n",postXML);
    NSLog(@"===========响应信息:%@ \n",xmlStr);
    if ([self.delegate respondsToSelector:@selector(upnpUndefinedResponse:postXML:)]) {
        [self.delegate upnpUndefinedResponse:xmlStr postXML:postXML];
    }
}

@end
