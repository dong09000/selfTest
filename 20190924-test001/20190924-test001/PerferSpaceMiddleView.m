//
//  PerferSpaceMiddleView.m
//  20190924-test001
//
//  Created by dongouc on 2019/9/24.
//  Copyright © 2019 dongouc. All rights reserved.
//

#import "PerferSpaceMiddleView.h"


FOUNDATION_STATIC_INLINE NSAttributedString *_PSMV_Price(int32_t price){
    NSDictionary *dollarDict = @{NSForegroundColorAttributeName: UIColor.whiteColor,
                                 NSFontAttributeName: [UIFont systemFontOfSize:14.0]
    };
    NSDictionary *priceDict = @{NSForegroundColorAttributeName: UIColor.whiteColor,
                                 NSFontAttributeName: [UIFont boldSystemFontOfSize:19.0]
    };
    NSMutableAttributedString *att = [[NSMutableAttributedString alloc] initWithString:@"$" attributes:dollarDict];
    NSAttributedString *priceAtt = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%d", price] attributes:priceDict];
    [att appendAttributedString:priceAtt];
    
    return att.copy;
}


@interface _PSMV_TopBlueView : UIView

/** 价格们 */
@property (nonatomic, strong) NSMutableArray *attMoneyLabs;
/** 价格描述们 */
@property (nonatomic, strong) NSMutableArray *descLabs;

@end


@interface PerferSpaceMiddleView ()

/** 顶部蓝底 */
@property (nonatomic, strong) _PSMV_TopBlueView *topBlueView;

@end

@implementation PerferSpaceMiddleView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 高290
        self.layer.backgroundColor = UIColor.whiteColor.CGColor;
        self.layer.cornerRadius = 4;
        self.layer.masksToBounds = YES;
        
        // 顶部 81 高度 蓝底
        _topBlueView = _PSMV_TopBlueView.new;
        [_topBlueView.attMoneyLabs.firstObject setAttributedText:_PSMV_Price(325)];
        [_topBlueView.attMoneyLabs[1] setAttributedText:_PSMV_Price(325)];
        [_topBlueView.attMoneyLabs.lastObject setAttributedText:_PSMV_Price(325)];
        [self addSubview:_topBlueView];
        
        // 中间 Performance 18 高度 24上下间距 66区域高度
        
        // 底部 9宫格 固定显示5格
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat selfW = CGRectGetWidth(self.bounds);
    //CGFloat selfH = CGRectGetHeight(self.bounds);
    
    _topBlueView.frame = CGRectMake(0, 0, selfW, 81);
}

@end



@implementation _PSMV_TopBlueView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _attMoneyLabs = @[].mutableCopy;
        _descLabs = @[].mutableCopy;
        
        // 蓝底-。-
        self.layer.backgroundColor = UIColor.blueColor.CGColor;
        self.layer.contents = (__bridge id)[UIImage imageNamed:@""].CGImage;
        
        // J价格
        for (int i = 0; i < 3; i++)
        {
            UILabel *lab = UILabel.new;
            [self addSubview:lab];
            lab.textAlignment = NSTextAlignmentCenter;
            [_attMoneyLabs addObject:lab];
        }
        // 描述
        [self _addDesLab:@"CASHABLE"];
        [self _addDesLab:@"PENDING"];
        [self _addDesLab:@"CASHED"];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat selfW = CGRectGetWidth(self.bounds);
    //CGFloat selfH = CGRectGetHeight(self.bounds);
    CGFloat labW = selfW / 3;
    // J价格
    for (int i = 0; i < 3; i++)
    {
        UILabel *lab = self.attMoneyLabs[i];
        lab.frame = CGRectMake(labW*i, 20, labW, 23);
        
        UILabel *lab2 = self.descLabs[i];
        lab2.frame = CGRectMake(labW*i, 50, labW, 12);
    }
}

#pragma mark - private

- (void)_addDesLab:(NSString *)desc
{
    UILabel *lab = UILabel.new;
    lab.font = [UIFont systemFontOfSize:10.0];
    lab.textColor = UIColor.whiteColor;
    lab.text = desc;
    lab.textAlignment = NSTextAlignmentCenter;
    [self addSubview:lab];
    [_descLabs addObject:lab];
}

@end


