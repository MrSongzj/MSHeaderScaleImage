//
//  ViewController.m
//  Demo
//
//  Created by MrSong on 2016/11/27.
//  Copyright © 2016年 MrSong. All rights reserved.
//

#import "ViewController.h"
#import "UITableView+MSHeaderScaleImage.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 200)];
    // 把背景设置为透明，不然会挡住缩放图片
    headerView.backgroundColor = [UIColor clearColor];
    tableView.tableHeaderView = headerView;
    tableView.ms_headerScaleImage = [UIImage imageNamed:@"headerImage.jpg"];
    tableView.ms_defaultDisplayRectHeight = 150;
    
    [self.view addSubview:tableView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
