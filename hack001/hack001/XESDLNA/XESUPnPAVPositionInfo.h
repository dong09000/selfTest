//
//  XESUPnPAVPositionInfo.h
//  hack001
//
//  Created by dongouc on 2020/1/4.
//  Copyright © 2020 dongouc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XESUPnPAVPositionInfo : NSObject

@property (nonatomic, assign) float trackDuration;
@property (nonatomic, assign) float absTime;
@property (nonatomic, assign) float relTime;

- (void)setArray:(NSArray *)array;

@end

@interface XESUPnPTransportInfo : NSObject

@property (nonatomic, copy) NSString *currentTransportState;
@property (nonatomic, copy) NSString *currentTransportStatus;
@property (nonatomic, copy) NSString *currentSpeed;

- (void)setArray:(NSArray *)array;

@end


@interface NSString (UPnP)

+ (NSString *)stringWithDurationTime:(float)timeValue;
- (float)durationTime;

@end

NS_ASSUME_NONNULL_END
