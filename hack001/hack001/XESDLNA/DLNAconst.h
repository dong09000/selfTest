//
//  DLNAconst.h
//  hack001
//
//  Created by dongouc on 2020/1/4.
//  Copyright © 2020 dongouc. All rights reserved.
//

#ifndef DLNAconst_h
#define DLNAconst_h

//IPv4下的多播地址
static NSString *ssdpAddres = @"239.255.255.250";
//IPv4下的SSDP端口
static UInt16   ssdpPort = 1900;

static NSString *serviceType_AVTransport        = @"urn:schemas-upnp-org:service:AVTransport:1";
static NSString *serviceType_RenderingControl   = @"urn:schemas-upnp-org:service:RenderingControl:1";

static NSString *serviceId_AVTransport          = @"urn:upnp-org:serviceId:AVTransport";
static NSString *serviceId_RenderingControl     = @"urn:upnp-org:serviceId:RenderingControl";


static NSString *unitREL_TIME = @"REL_TIME";
static NSString *unitTRACK_NR = @"TRACK_NR";

#ifdef DEBUG
#define XESLog(s, ... ) NSLog( @"[%@ in line %d] => %@", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__] )
#else
#define XESLog(s, ... )
#endif

#endif /* DLNAconst_h */
