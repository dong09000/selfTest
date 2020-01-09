//
//  ViewController.m
//  20191227attAlert
//
//  Created by dongouc on 2019/12/27.
//  Copyright © 2019 dongouc. All rights reserved.
//

#import "ViewController.h"
#import <Masonry/Masonry.h>
#import "UIAlertController+xes.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)testClick:(id)sender {
    
    [self test001];
}

- (void)test002
{
    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:@"" message:@"" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *ac1 = [UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            //
        }];
        [alertVc addAction:ac1];
        UIAlertAction *ac2 = [UIAlertAction actionWithTitle:@"sure" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //
        }];
        [alertVc addAction:ac2];
        
        NSDictionary *titAttDict = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:16],
                                     NSForegroundColorAttributeName: UIColor.blackColor
        };
        NSDictionary *conAttDict = @{NSFontAttributeName: [UIFont systemFontOfSize:14],
                                     NSForegroundColorAttributeName: UIColor.blueColor
        };
        NSMutableAttributedString *att = [[NSMutableAttributedString alloc] initWithString:@"学员姓名: " attributes:titAttDict];
        NSAttributedString *name = [[NSAttributedString alloc] initWithString:@"tony" attributes:conAttDict];
        [att appendAttributedString:name];
        NSAttributedString *telNumT = [[NSAttributedString alloc] initWithString:@"\n已接来电: " attributes:titAttDict];
        [att appendAttributedString:telNumT];
        NSAttributedString *telNumC = [[NSAttributedString alloc] initWithString:@"3" attributes:conAttDict];
        [att appendAttributedString:telNumC];
        NSAttributedString *tagCountT = [[NSAttributedString alloc] initWithString:@"\n标记已打扰: " attributes:titAttDict];
        [att appendAttributedString:tagCountT];
        NSAttributedString *tagCountC = [[NSAttributedString alloc] initWithString:@"您,其它3位老师" attributes:conAttDict];
        [att appendAttributedString:tagCountC];
        NSAttributedString *lastDesc = [[NSAttributedString alloc] initWithString: @"\n\n您确定要使用xxxx的号码继续拨打吗？\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n22222\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n22222"];
        [att appendAttributedString:lastDesc];
        
        [alertVc xes_setAttributedText:att];
        [alertVc xes_setTextAligment:NSTextAlignmentLeft];
        [self presentViewController:alertVc animated:YES completion:nil];
}

- (void)test001
{
    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:@"提示" message:@"" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *ac1 = [UIAlertAction actionWithTitle:@"渐渐懂了" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            //
        }];
        [alertVc addAction:ac1];
        
        NSDictionary *titAttDict = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:16],
                                     NSForegroundColorAttributeName: UIColor.blackColor
        };
        NSDictionary *conAttDict = @{NSFontAttributeName: [UIFont systemFontOfSize:14],
                                     NSForegroundColorAttributeName: UIColor.blueColor
        };
        NSMutableAttributedString *att = [[NSMutableAttributedString alloc] initWithString:@"学员姓名: " attributes:titAttDict];
        NSAttributedString *name = [[NSAttributedString alloc] initWithString:@"tony" attributes:conAttDict];
        [att appendAttributedString:name];
        NSAttributedString *telNumT = [[NSAttributedString alloc] initWithString:@"\n已接来电: " attributes:titAttDict];
        [att appendAttributedString:telNumT];
        NSAttributedString *telNumC = [[NSAttributedString alloc] initWithString:@"3" attributes:conAttDict];
        [att appendAttributedString:telNumC];
        NSAttributedString *tagCountT = [[NSAttributedString alloc] initWithString:@"\n标记已打扰: " attributes:titAttDict];
        [att appendAttributedString:tagCountT];
        NSAttributedString *tagCountC = [[NSAttributedString alloc] initWithString:@"您,其它3位老师" attributes:conAttDict];
        [att appendAttributedString:tagCountC];
        NSAttributedString *lastDesc = [[NSAttributedString alloc] initWithString: @"\n\n您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？您确定要使用xxxx的号码继续拨打吗？"];
        [att appendAttributedString:lastDesc];
        
        [alertVc xes_setAttributedText:att];
        [alertVc xes_setTextAligment:NSTextAlignmentLeft];
    
        [self presentViewController:alertVc animated:YES completion:nil];
}

@end
