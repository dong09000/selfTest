//
//  ShakeCell.m
//  20190905-testLongPressChangeIndexPath
//
//  Created by dongouc on 2019/9/5.
//  Copyright © 2019 dongouc. All rights reserved.
//

#import "ShakeCell.h"

@interface ShakeCell ()

/** img */
@property (nonatomic, strong) UIImageView *imaView;

@end

@implementation ShakeCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.imaView];
    }
    return self;
}

- (void)beginShake
{
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    anim.keyPath = @"transform.rotation";
    anim.duration = 0.2;
    anim.repeatCount = MAXFLOAT;
    anim.values = @[@(-0.03),@(0.03),@(-0.03)];
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    [self.layer addAnimation:anim forKey:@"shake"];
}

- (void)stopShake
{
    [self.layer removeAllAnimations];
}

- (UIImageView *)imaView {
    if (!_imaView) {
        _imaView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 167, 167)];
        _imaView.contentMode = UIViewContentModeScaleAspectFill;
        _imaView.layer.masksToBounds = YES;
        [_imaView.layer setCornerRadius:5];
    }
    return _imaView;
}

@end
