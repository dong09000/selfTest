//
//  XESUPnPAction.h
//  hack001
//
//  Created by dongouc on 2020/1/4.
//  Copyright © 2020 dongouc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, XESUPnPServiceType) {
    XESUPnPServiceAVTransport = 0,       ///<  @"urn:schemas-upnp-org:service:AVTransport:1"
    XESUPnPServiceRenderingControl = 1,  ///<  @"urn:schemas-upnp-org:service:RenderingControl:1"
};

@class XESUPnPDevice;
@interface XESUPnPAction : NSObject

// defalut is XESUPnPServiceAVTransport
@property (nonatomic, assign) XESUPnPServiceType serviceType;

- (instancetype)initWithAction:(NSString *)action;

- (void)setArgumentValue:(NSString *)value forName:(NSString *)name;

- (NSString *)getServiceType;

- (NSString *)getSOAPAction;

- (NSString *)getPostUrlStrWith:(XESUPnPDevice *)model;

- (NSString *)getPostXMLFile;

@end

NS_ASSUME_NONNULL_END
