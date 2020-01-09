//
//  XESUPnPDevice.m
//  hack001
//
//  Created by dongouc on 2020/1/4.
//  Copyright © 2020 dongouc. All rights reserved.
//

#import "XESUPnPDevice.h"
#import "GDataXMLNode.h"
#import "DLNAconst.h"

@implementation XESUPnPDevice
{
    NSString *_urlHeader;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _AVTransport = XESServiceModel.new;
        _RenderingControl = XESServiceModel.new;
    }
    return self;
}

- (void)setLocation:(NSURL *)location
{
    _location = location;
    _urlHeader = [NSString stringWithFormat:@"%@://%@:%@", [location scheme], [location host], [location port]];
}

- (NSString *)urlHeader
{
    return _urlHeader;
}

- (void)setArray:(NSArray *)array {
    @autoreleasepool {
        for (int j = 0; j < [array count]; j++) {
            GDataXMLElement *ele = [array objectAtIndex:j];
            if ([ele.name isEqualToString:@"friendlyName"]) {
                self.friendlyName = [ele stringValue];
            }
            if ([ele.name isEqualToString:@"modelName"]) {
                self.modelName = [ele stringValue];
            }
            if ([ele.name isEqualToString:@"serviceList"]) {
                NSArray *serviceListArray = [ele children];
                for (int k = 0; k < [serviceListArray count]; k++) {
                    GDataXMLElement *listEle = [serviceListArray objectAtIndex:k];
                    if ([listEle.name isEqualToString:@"service"]) {
                        NSString *serviceString = [listEle stringValue];
                        if ([serviceString rangeOfString:serviceType_AVTransport].location != NSNotFound || [serviceString rangeOfString:serviceId_AVTransport].location != NSNotFound) {
                            
                            [self.AVTransport setArray:[listEle children]];
                            
                        }else if ([serviceString rangeOfString:serviceType_RenderingControl].location != NSNotFound || [serviceString rangeOfString:serviceId_RenderingControl].location != NSNotFound){
                            
                            [self.RenderingControl setArray:[listEle children]];
                        }
                    }
                }
                continue;
            }
        }
    }
}

- (NSString *)description {
    NSString * string = [NSString stringWithFormat:@"\nuuid:%@\nlocation:%@\nURLHeader:%@\nfriendlyName:%@\nmodelName:%@\n",self.uuid,self.location,self.urlHeader,self.friendlyName,self.modelName];
    return string;
}

@end

@implementation XESServiceModel

- (void)setArray:(NSArray *)array
{
    @autoreleasepool {
        for (int m = 0; m < array.count; m++) {
            GDataXMLElement *needEle = [array objectAtIndex:m];
            if ([needEle.name isEqualToString:@"serviceType"]) {
                self.serviceType = [needEle stringValue];
            }
            if ([needEle.name isEqualToString:@"serviceId"]) {
                self.serviceId = [needEle stringValue];
            }
            if ([needEle.name isEqualToString:@"controlURL"]) {
                self.controlURL = [needEle stringValue];
            }
            if ([needEle.name isEqualToString:@"eventSubURL"]) {
                self.eventSubURL = [needEle stringValue];
            }
            if ([needEle.name isEqualToString:@"SCPDURL"]) {
                self.SCPDURL = [needEle stringValue];
            }
        }
    }
}

@end
