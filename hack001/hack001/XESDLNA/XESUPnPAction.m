//
//  XESUPnPAction.m
//  hack001
//
//  Created by dongouc on 2020/1/4.
//  Copyright © 2020 dongouc. All rights reserved.
//

#import "XESUPnPAction.h"
#import "GDataXMLNode.h"
#import "DLNAconst.h"

#import "XESUPnPDevice.h"

@interface XESUPnPAction ()

/** xml */
@property (nonatomic, strong) GDataXMLElement *xmlEle;

@end

@implementation XESUPnPAction
{
    NSString *_action;
}

- (instancetype)initWithAction:(NSString *)action{
    self = [super init];
    if (self) {
        _action = action;
        NSString *name = [NSString stringWithFormat:@"u:%@", _action];
        _xmlEle = [GDataXMLElement elementWithName:name];
    }
    return self;
}


- (void)setArgumentValue:(NSString *)value forName:(NSString *)name{
    [self.xmlEle addChild:[GDataXMLElement elementWithName:name stringValue:value]];
}

- (NSString *)getServiceType{
    if (XESUPnPServiceAVTransport == _serviceType) {
        return serviceType_AVTransport;
    }else{
        return serviceType_RenderingControl;
    }
}

- (NSString *)getSOAPAction{
    if (XESUPnPServiceAVTransport == _serviceType) {
        return [NSString stringWithFormat:@"\"%@#%@\"", serviceType_AVTransport, _action];
    }else{
        return [NSString stringWithFormat:@"\"%@#%@\"", serviceType_RenderingControl, _action];
    }
}

- (NSString *)getPostUrlStrWith:(XESUPnPDevice *)model{
    if (XESUPnPServiceAVTransport == _serviceType) {
        return [self getUPnPURLWithUrlModel:model.AVTransport urlHeader:model.urlHeader];
    }else{
        return [self getUPnPURLWithUrlModel:model.RenderingControl urlHeader:model.urlHeader];;
    }
}

- (NSString *)getUPnPURLWithUrlModel:(XESServiceModel *)model urlHeader:(NSString *)urlHeader{
    if ([[model.controlURL substringToIndex:1] isEqualToString:@"/"]) {
        return [NSString stringWithFormat:@"%@%@", urlHeader, model.controlURL];
    }else{
        return [NSString stringWithFormat:@"%@/%@", urlHeader, model.controlURL];
    }
}

/*
 <DIDL-Lite xmlns=\"urn:schemas-upnp-org:metadata-1-0/DIDL-Lite/\" xmlns:dc=\"http://purl.org/dc/elements/1.1/\" xmlns:upnp=\"urn:schemas-upnp-org:metadata-1-0/upnp/\" xmlns:dlna=\"urn:schemas-dlna-org:metadata-1-0/\"><item id=\"0$1$1$17956\" parentID=\"parent\" restricted=\"1\"><dc:title>%s</dc:title><upnp:class>object.item.videoItem</upnp:class><res  protocolInfo=\"http-get:*:application/vnd.apple.mpegurl:*\">%s</res></item></DIDL-Lite>
 */

- (NSString *)getPostXMLFile{
    GDataXMLElement *xmlEle = [GDataXMLElement elementWithName:@"s:Envelope"];
    [xmlEle addChild:[GDataXMLElement attributeWithName:@"s:encodingStyle" stringValue:@"http://schemas.xmlsoap.org/soap/encoding/"]];
    [xmlEle addChild:[GDataXMLElement attributeWithName:@"xmlns:s" stringValue:@"http://schemas.xmlsoap.org/soap/envelope/"]];
    [xmlEle addChild:[GDataXMLElement attributeWithName:@"xmlns:u" stringValue:[self getServiceType]]];
    GDataXMLElement *command = [GDataXMLElement elementWithName:@"s:Body"];
    
//    GDataXMLElement *CurrentURIMetaDataEle = [self.XMLElement elementsForName:@"CurrentURIMetaData"][0];
    
    [command addChild:self.xmlEle];
    [xmlEle addChild:command];
    
    return xmlEle.XMLString;
}

@end
