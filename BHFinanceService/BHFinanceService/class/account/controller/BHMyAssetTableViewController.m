//
//  BHMyAssetTableViewController.m
//  BHFinanceService
//
//  Created by 王帅广 on 16/5/27.
//  Copyright © 2016年 sunny. All rights reserved.
//

#import "BHMyAssetTableViewController.h"
#import "BHDrawCircleView.h"
#import "constant.h"

@interface BHMyAssetTableViewController ()

@end

@implementation BHMyAssetTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"资产分析";
    
    self.view.backgroundColor = [UIColor stringTOColor:BHAPPBackGroundColor];
    
    [self initUI];
    
}

- (void)initUI
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEHW, 330)];
    headerView.backgroundColor = [UIColor stringTOColor:BHAPPBackGroundColor];
    
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEHW, 80)];
    topView.backgroundColor = [UIColor whiteColor];
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, SCREEHW, 15)];
    label1.text = @"总资产（元）";
    label1.font = [UIFont systemFontOfSize:14];
    [topView addSubview:label1];
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(label1.frame) + 5, SCREEHW, 35)];
    label2.text = @"99999999.99";
    label2.font = [UIFont systemFontOfSize:30];
    [topView addSubview:label2];
    
    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(label2.frame), SCREEHW, 15)];
    label3.textColor = [UIColor grayColor];
    label3.font = [UIFont systemFontOfSize:12];
    topView.backgroundColor = [UIColor whiteColor];
    label3.text = @"理财资金+余额";
    [topView addSubview:label3];
    
    BHDrawCircleView *drawCricleView = [[BHDrawCircleView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(topView.frame) + 10, SCREEHW, 240)];
    
    [headerView addSubview:topView];
    [headerView addSubview:drawCricleView];
    
    self.tableView.tableHeaderView = headerView;
    
    UIView *footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEHW, 40)];
    footView.backgroundColor = [UIColor stringTOColor:BHAPPBackGroundColor];
    UILabel *label4 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEHW, 40)];
    label4.text = @"资金安全由阳光财产保险100%承保";
    label4.textColor = [UIColor blueColor];
    label4.textAlignment = NSTextAlignmentCenter;
    label4.font = [UIFont systemFontOfSize:12];
    [footView addSubview:label4];
    
    self.tableView.tableFooterView = footView;
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}




@end
