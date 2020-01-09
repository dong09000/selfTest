//
//  UIAlertController+xes.m
//  20191227-attAliert
//
//  Created by macserver on 2019/12/30.
//  Copyright © 2019 macserver. All rights reserved.
//

#import "UIAlertController+xes.h"


@implementation UIAlertController (xes)

- (NSArray *)viewArray:(UIView*)root {
    static NSArray *_subviews =nil;
    _subviews = nil;
    for(UIView *v in root.subviews) {
        if(_subviews) { break; }
        if([v isKindOfClass:[UILabel class]]) {
            _subviews = root.subviews;
            return _subviews;
        }
        [self viewArray:v];
    }
    return _subviews;
}

- (void)xes_setAttributedText:(NSAttributedString *)att {
    [self setValue:att forKey:@"attributedMessage"];
}

- (void)xes_setTextAligment:(NSTextAlignment)alignment {
    NSArray *labSuperSubViews = [self viewArray:self.view];
    for (UIView *v in labSuperSubViews) {
        if([v isKindOfClass:[UILabel class]]) {
            [(UILabel *)v setTextAlignment:alignment];
        }
    }
}

@end
