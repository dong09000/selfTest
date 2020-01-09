//
//  UIAlertController+xes.h
//  20191227-attAliert
//
//  Created by macserver on 2019/12/30.
//  Copyright © 2019 macserver. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIAlertController (xes)

- (void)xes_setAttributedText:(NSAttributedString *)att;
- (void)xes_setTextAligment:(NSTextAlignment)alignment;

@end

NS_ASSUME_NONNULL_END
