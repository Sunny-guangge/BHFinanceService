//
//  BHAccountTableViewController.m
//  BHFinanceService
//
//  Created by 王帅广 on 16/5/20.
//  Copyright © 2016年 sunny. All rights reserved.
//

#import "BHAccountTableViewController.h"
#import "BHAccountHeaderView.h"
#import "constant.h"
#import "BHCashViewController.h"
#import "BHChargeViewController.h"
#import "BHFundRecordViewController.h"
#import "BHMyAssetViewController.h"
#import "BHInvestProjectViewController.h"
#import "BHAccountCenterTableViewController.h"

@interface BHAccountTableViewController ()<BHAccountHeaderViewDelegate>

@property (nonatomic,strong) NSMutableArray *dataArray;

@property (nonatomic,strong) UIView *functionView;
@property (nonatomic,strong) UIButton *tiXianButton;
@property (nonatomic,strong) UIButton *chargeButton;

@end

@implementation BHAccountTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.tableFooterView = [UIView new];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEHW, 240)];
    
    BHAccountHeaderView *headerView = [[BHAccountHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 180)];
    headerView.delegate = self;
    self.functionView.frame = CGRectMake(0, CGRectGetMaxY(headerView.frame), SCREEHW, 60);
    
    [view addSubview:headerView];
    [view addSubview:self.functionView];
    
    self.tableView.tableHeaderView = view;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (NSMutableArray *)dataArray
{
    if (_dataArray == nil) {
        
        _dataArray = [NSMutableArray array];
        
        NSMutableArray *array1 = [[NSMutableArray alloc] initWithObjects:@"直投项目",@"more_icon_llwm",@"999999.99元", nil];
        NSMutableArray *array2 = [[NSMutableArray alloc] initWithObjects:@"我的资产",@"more_icon_llwm", nil];
        NSMutableArray *array3 = [[NSMutableArray alloc] initWithObjects:@"优惠券",@"more_icon_llwm", nil];
        NSMutableArray *array4 = [[NSMutableArray alloc] initWithObjects:@"资产记录",@"more_icon_llwm", nil];
        NSMutableArray *array5 = [[NSMutableArray alloc] initWithObjects:@"邀请好友，可赚取额外收益",@"more_icon_llwm", nil];
        
        [_dataArray addObject:array1];
        [_dataArray addObject:array2];
        [_dataArray addObject:array3];
        [_dataArray addObject:array4];
        [_dataArray addObject:array5];
    }
    return _dataArray;
}

#pragma mark - UITableViewDelegate & UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"tableViewCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        
        if (indexPath.row == 0) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        }else
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        }
        
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.textLabel.text = [[self.dataArray objectAtIndex:indexPath.row] objectAtIndex:0];
    
    if (indexPath.row == 0) {
        cell.detailTextLabel.text = [[self.dataArray objectAtIndex:indexPath.row] objectAtIndex:2];
    }
    cell.imageView.image = [UIImage imageNamed:[[self.dataArray objectAtIndex:indexPath.row] objectAtIndex:1]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        
        BHInvestProjectViewController *investVC = [[BHInvestProjectViewController alloc] init];
        
        [self.navigationController pushViewController:investVC animated:YES];
        
    }
    
    if (indexPath.row == 1) {
        BHMyAssetViewController *myAssetVC = [[BHMyAssetViewController alloc] init];
        
        [self.navigationController pushViewController:myAssetVC animated:YES];
    }
    
    if (indexPath.row == 3) {
        
        BHFundRecordViewController *fundVC = [[BHFundRecordViewController alloc] init];
        
        [self.navigationController pushViewController:fundVC animated:YES];
        
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (UIView *)functionView
{
    if (_functionView == nil) {
        _functionView = [[UIView alloc] init];
        _functionView.backgroundColor = [UIColor grayColor];
        [_functionView addSubview:self.tiXianButton];
        [_functionView addSubview:self.chargeButton];
    }
    return _functionView;
}

- (UIButton *)tiXianButton
{
    if (_tiXianButton == nil) {
        _tiXianButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _tiXianButton.backgroundColor = [UIColor whiteColor];
        _tiXianButton.frame = CGRectMake(0, 0, SCREEHW / 2, 59);
        [_tiXianButton setTitle:@"提现" forState:UIControlStateNormal];
        [_tiXianButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_tiXianButton setImage:[UIImage imageNamed:@"more_icon_llwm"] forState:UIControlStateNormal];
        [_tiXianButton addTarget:self action:@selector(didClickTiXianButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return _tiXianButton;
}

- (UIButton *)chargeButton
{
    if (_chargeButton == nil) {
        _chargeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _chargeButton.frame = CGRectMake(SCREEHW / 2 + 1, 0, SCREEHW / 2 - 1, 59);
        _chargeButton.backgroundColor = [UIColor whiteColor];
        [_chargeButton setTitle:@"充值" forState:UIControlStateNormal];
        [_chargeButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_chargeButton setImage:[UIImage imageNamed:@"more_icon_llwm"] forState:UIControlStateNormal];
        [_chargeButton addTarget:self action:@selector(didClickChargeButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return _chargeButton;
}

//提现
- (void)didClickTiXianButton
{
    BHCashViewController *cashVC = [[BHCashViewController alloc] init];
    
    [self.navigationController pushViewController:cashVC animated:YES];
}
//充值
- (void)didClickChargeButton
{
    BHChargeViewController *chargeVC = [[BHChargeViewController alloc] init];
    
    [self.navigationController pushViewController:chargeVC animated:YES];
}

//点击用户的头像
- (void)clickUserHeader
{
    BHAccountCenterTableViewController *accountCenterVC = [[BHAccountCenterTableViewController alloc] init];
    
    [self.navigationController pushViewController:accountCenterVC animated:YES];
}

@end
