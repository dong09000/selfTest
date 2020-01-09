//
//  XESUPnPDevice.h
//  hack001
//
//  Created by dongouc on 2020/1/4.
//  Copyright © 2020 dongouc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class XESServiceModel;
@interface XESUPnPDevice : NSObject

/** uuid */
@property (nonatomic, copy) NSString *uuid;
/** location */
@property (nonatomic, strong) NSURL *location;
/** urlHeader form location */
@property (nonatomic, copy, readonly) NSString *urlHeader;
/** friendlyName */
@property (nonatomic, copy) NSString *friendlyName;
/** modelName */
@property (nonatomic, copy) NSString *modelName;
/** avtransport */
@property (nonatomic, strong) XESServiceModel *AVTransport;
/** RenderingControl */
@property (nonatomic, strong) XESServiceModel *RenderingControl;

- (void)setArray:(NSArray *)array;

@end

@interface XESServiceModel : NSObject

@property (nonatomic, copy) NSString *serviceType;
@property (nonatomic, copy) NSString *serviceId;
@property (nonatomic, copy) NSString *controlURL;
@property (nonatomic, copy) NSString *eventSubURL;
@property (nonatomic, copy) NSString *SCPDURL;

- (void)setArray:(NSArray *)array;

@end

NS_ASSUME_NONNULL_END
