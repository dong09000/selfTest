//
//  ViewController.m
//  20190905-testLongPressChangeIndexPath
//
//  Created by dongouc on 2019/9/5.
//  Copyright © 2019 dongouc. All rights reserved.
//

#import "ViewController.h"
#import "ShakeCell.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UIGestureRecognizerDelegate>

/** collectionView */
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic,strong) NSMutableArray *colorArray;

@end

@implementation ViewController
{
    BOOL _isItemShake;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self test01];
    });
    
    UICollectionViewFlowLayout *collectionFlowLayout = [[UICollectionViewFlowLayout alloc] init];
    collectionFlowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:collectionFlowLayout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[ShakeCell class] forCellWithReuseIdentifier:NSStringFromClass([ShakeCell class])];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self.view addSubview:self.collectionView];
    
    [self addLongGesture];
    // 为collectionView添加拖动手势
    //[self addPanGesture];
}

- (void)addLongGesture
{
    UILongPressGestureRecognizer *recognize = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressGestureAction:)];
    //设置长按响应时间为0.5秒
    recognize.minimumPressDuration = 0.5;
    [self.collectionView addGestureRecognizer:recognize];
    //recognize.delegate = self;
}



// 长按抖动手势方法
- (void)longPressGestureAction:(UILongPressGestureRecognizer *)longGesture {
    //if (_isItemShake) { return; }
    switch (longGesture.state) {
        case UIGestureRecognizerStateBegan: {
            // 用一个BOOL类型的全局变量，记录collectionView是否为抖动状态，YES：抖动，NO：停止抖动
            _isItemShake = YES;
            [self.collectionView reloadData];
            
            // 通过手势获取点，通过点获取点击的indexPath， 移动该cell
            NSIndexPath *aIndexPath = [self.collectionView indexPathForItemAtPoint:[longGesture locationInView:self.collectionView]];
            [self.collectionView beginInteractiveMovementForItemAtIndexPath:aIndexPath];
        }
            break;
        case UIGestureRecognizerStateChanged: {
            [self.collectionView updateInteractiveMovementTargetPosition:[longGesture locationInView:self.collectionView]];
        }
            break;
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateEnded: {
            // 移动完成关闭cell移动
            [self.collectionView endInteractiveMovement];
            //[self.collectionView removeGestureRecognizer:longGesture];
            _isItemShake = NO;
            [self.collectionView reloadData];
        }
            break;
        default:
            break;
    }
}

#pragma mark -- UICollectionView / DataSource Delegate
- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    [self.colorArray exchangeObjectAtIndex:sourceIndexPath.item withObjectAtIndex:destinationIndexPath.item];
    [collectionView reloadData];
    NSArray *cellArray = [self.collectionView visibleCells];
    for (ShakeCell *cell in cellArray ) {
        [cell stopShake];
    }
    
}

//配置item大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(167, 167);
}

//配置行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 15;
}

//配置每组上下左右的间距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 13, 15, 13);
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

//配置每个组里面有多少个item
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.colorArray.count;
}
//配置cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ShakeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([ShakeCell class]) forIndexPath:indexPath];
    cell.backgroundColor = self.colorArray[indexPath.row];
    if (_isItemShake) {
        [cell beginShake];
    }else{
        [cell stopShake];
    }
    return cell;
}

- (NSMutableArray *)colorArray {
    if (!_colorArray)
    {
        _colorArray = [NSMutableArray array];
        for (int i = 0; i < 20; i ++) {
            int R = (arc4random() % 256);
            int G = (arc4random() % 256);
            int B = (arc4random() % 256) ;
            [_colorArray addObject:[UIColor colorWithRed:R/255.0f green:G/255.0f blue:B/255.0f alpha:1]];
        }
    }
    return _colorArray;
}


- (void)test01
{
    // 弹出发布
    NSString *title = @"";
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:@""
                                                            preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *actionQS = [UIAlertAction actionWithTitle:@"Save & Quit"
                                                       style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction * _Nonnull action) {
                                                         NSLog(@"%s， %d", __func__, __LINE__);
                                                     }];
    [alert addAction:actionQS];
    
    UIAlertAction *actionCancel = [UIAlertAction actionWithTitle:@"Cancel"
                                                           style:UIAlertActionStyleCancel
                                                         handler:^(UIAlertAction * _Nonnull action) {
                                                             
                                                         }];
    [alert addAction:actionCancel];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
