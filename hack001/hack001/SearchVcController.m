//
//  SearchVcController.m
//  hack001
//
//  Created by dongouc on 2020/1/4.
//  Copyright © 2020 dongouc. All rights reserved.
//

#import "SearchVcController.h"
#import "XESDLNA.h"

@interface SearchVcController () <XESDLNADelegate>

@property(nonatomic,strong) XESDLNA *dlnaManager;
/** 搜索到的设备 */
@property (nonatomic, strong) NSMutableArray<XESUPnPDevice *> *deviceArray;

@end

@implementation SearchVcController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"reuseIdentifier"];
    [self.dlnaManager startSearch];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.deviceArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    
    cell.textLabel.text = self.deviceArray[indexPath.row].friendlyName;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *testUrl = @"http://vfx.mtime.cn/Video/2019/03/18/mp4/190318214226685784.mp4";
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row < self.deviceArray.count) {
        XESUPnPDevice *device = self.deviceArray[indexPath.row];
        self.dlnaManager.device = device;
        self.dlnaManager.playUrl = testUrl;
    }
}

#pragma mark - XESDLNADelegate

- (void)searchDLNAResult:(NSArray<XESUPnPDevice *> *)devicesArray
{
    NSLog(@"发现设备");
    [self.deviceArray removeAllObjects];
    [self.deviceArray addObjectsFromArray:devicesArray];
    [self.tableView reloadData];
}

- (void)dlnaStartPlay{
    NSLog(@"投屏成功 开始播放");
}

#pragma mark - lazy

- (XESDLNA *)dlnaManager
{
    if (!_dlnaManager)
    {
        _dlnaManager = [XESDLNA sharedManager];
        _dlnaManager.delegate = self;
    }
    return _dlnaManager;
}

@end
