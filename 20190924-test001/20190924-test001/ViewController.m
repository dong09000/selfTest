//
//  ViewController.m
//  20190924-test001
//
//  Created by dongouc on 2019/9/24.
//  Copyright © 2019 dongouc. All rights reserved.
//

#import "ViewController.h"
#import <MJRefresh/MJRefresh.h>
#import <Masonry/Masonry.h>

#import "PerferSpaceMiddleView.h"

#define kPerferSpacePadding 12
#define kPerferSpaceSubPadding 24

@interface PerferSpaceTopView : UIView
@end


@interface ViewController ()

/** 内容 */
@property (nonatomic, strong) UIScrollView *pContentView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"PerferSpace";
    [self setUpSubViews];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.pContentView.frame = CGRectMake(0, self.view.safeAreaInsets.top, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds) - self.view.safeAreaInsets.top - self.view.safeAreaInsets.bottom);
}

#pragma mark - subViews

- (void)setUpSubViews
{
    //
    self.pContentView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self refreshPerferSpaceData];
    }];
}

#pragma mark - private

- (void)refreshPerferSpaceData
{
#warning noCode
    // mock netloading
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.pContentView.mj_header endRefreshing];
    });
}

#pragma mark - lazy

- (UIScrollView *)pContentView
{
    if (!_pContentView)
    {
        _pContentView = [[UIScrollView alloc] init];
        _pContentView.backgroundColor = UIColor.greenColor;
        _pContentView.frame = self.view.bounds;
        _pContentView.alwaysBounceVertical = YES;
        [self.view addSubview:_pContentView];
        
        CGFloat contentW = CGRectGetWidth([UIScreen mainScreen].bounds) - 2*kPerferSpacePadding;
        PerferSpaceTopView *topView = PerferSpaceTopView.new;
        [_pContentView addSubview:topView];
        [topView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(kPerferSpacePadding);
            make.height.mas_equalTo(182);
            make.width.mas_equalTo(contentW);
        }];
        
        PerferSpaceMiddleView *middleView = PerferSpaceMiddleView.new;
        [_pContentView addSubview:middleView];
        [middleView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(topView.mas_bottom).mas_offset(12);
            make.left.mas_equalTo(kPerferSpacePadding);
            make.height.mas_equalTo(290);
            make.width.mas_equalTo(contentW);
        }];
        
    }
    return _pContentView;
}

@end

#pragma mark - <PerferSpaceTopView>

@implementation PerferSpaceTopView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.backgroundColor = UIColor.whiteColor.CGColor;
        self.layer.cornerRadius = 4;
        // userId
        UILabel *userLab = UILabel.new;
        userLab.font = [UIFont boldSystemFontOfSize:16.0];
        //userLab.textColor = 43,44,45;
        userLab.text = @"userIDFromUserInfo";
        [self addSubview:userLab];
        [userLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(kPerferSpaceSubPadding);
            make.right.mas_equalTo(-kPerferSpaceSubPadding);
            make.top.mas_equalTo(22);
            make.height.mas_equalTo(18);
        }];
        
        // welcome
        UILabel *welLab = UILabel.new;
        welLab.text = @"WELCOME BACK";
        welLab.font = [UIFont systemFontOfSize:30.0];
        //welLab.textColor = ;
        [self addSubview:welLab];
        [welLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(kPerferSpaceSubPadding);
            make.right.mas_equalTo(-kPerferSpaceSubPadding);
            make.top.mas_equalTo(userLab.mas_bottom).mas_offset(4);
            make.height.mas_equalTo(28);
        }];
        
        // tapBtn
        UIButton *btn = UIButton.new;
        [btn setTitle:@"TAP TO CHECK OUT YOUR BLOG" forState:UIControlStateNormal];
        [btn setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont boldSystemFontOfSize:12.0];
        btn.layer.cornerRadius = 8;
        // 这里应该跟UI要图
        btn.layer.backgroundColor = UIColor.purpleColor.CGColor;
        [btn addTarget:self action:@selector(jumpToBlog:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.top.mas_equalTo(welLab.mas_bottom).mas_offset(28);
            make.height.mas_equalTo(50);
            make.width.mas_equalTo(251);
        }];
    }
    return self;
}

- (void)jumpToBlog:(UIButton *)sender
{
    // 跳转浏览器
    NSURL *url = [NSURL URLWithString:@"www.baidu.com"];
    if (@available(iOS 10.0, *))
    {
        [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:^(BOOL success) {
            //
        }];
    }
    else
    {
        [[UIApplication sharedApplication] openURL:url];
    }
}

@end
