//
//  BHAccountCenterTableViewController.m
//  BHFinanceService
//
//  Created by 王帅广 on 16/5/25.
//  Copyright © 2016年 sunny. All rights reserved.
//

#import "BHAccountCenterTableViewController.h"
#import "BHAccountCenterTableViewCell.h"
#import "BHItem.h"
#import "constant.h"
#import "BHRealNameIdentifyTableViewController.h"
#import "BHMyBankCardTableViewController.h"
#import "BHBindPhoneNumTableViewController.h"
#import "BHTradeSecretTableViewController.h"
#import "BHLoginSecretTableViewController.h"
#import "BHGestureSecretTableViewController.h"
#import "BHAboutTableViewController.h"
#import "BHFeedbackViewController.h"
#import "BHAccount.h"
#import "BHResopnse.h"

@interface BHAccountCenterTableViewController ()<BHAccountCenterTableViewCellDelegate>

@property (nonatomic,strong) NSMutableArray *array;

@end

@implementation BHAccountCenterTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"账户详情";
    
    self.view.backgroundColor = [UIColor stringTOColor:BHAPPBackGroundColor];
    
    self.tableView.tableFooterView = [UIView new];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.tableView.backgroundColor = [UIColor stringTOColor:BHAPPBackGroundColor];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (NSMutableArray *)array
{
    if (_array == nil) {
        
        _array = [NSMutableArray array];
        
        BHItem *item1 = [[BHItem alloc] initWithTitle:@"头像" headerURL:@"heihei.jpg" ItemType:BHItemTypeUserHeader];
        NSMutableArray *array1 = [NSMutableArray array];
        
        [array1 addObject:item1];
        
        NSMutableArray *array2 = [NSMutableArray array];
        
        BHItem *item2 = [[BHItem alloc] initWithTitle:@"实名认证" labelStr:@"去认证" ItemType:BHItemTypeLabel];
        BHItem *item3 = [[BHItem alloc] initWithTitle:@"我的银行卡" labelStr:@"" ItemType:BHItemTypeLabel];
        BHItem *item4 = [[BHItem alloc] initWithTitle:@"绑定手机" labelStr:@"186****1761" ItemType:BHItemTypeLabel];
        BHItem *item5 = [[BHItem alloc] initWithTitle:@"交易密码" labelStr:@"设置" ItemType:BHItemTypeLabel];
        BHItem *item6 = [[BHItem alloc] initWithTitle:@"登陆密码" labelStr:@"修改" ItemType:BHItemTypeLabel];
        BHItem *item7 = [[BHItem alloc] initWithTitle:@"手势密码" labelStr:@"修改" ItemType:BHItemTypeLabel];
        [array2 addObject:item2];
        [array2 addObject:item3];
        [array2 addObject:item4];
        [array2 addObject:item5];
        [array2 addObject:item6];
        [array2 addObject:item7];
        
        BHItem *item8 = [[BHItem alloc] initWithTitle:@"意见反馈" labelStr:@"" ItemType:BHItemTypeLabel];
        BHItem *item9 = [[BHItem alloc] initWithTitle:@"关于" labelStr:@"" ItemType:BHItemTypeLabel];
        BHItem *item10 = [[BHItem alloc] initWithTitle:@"去评分" labelStr:@"" ItemType:BHItemTypeLabel];
        BHItem *item11 = [[BHItem alloc] initWithTitle:@"安全退出" ItemType:BHItemTypeButton];
        
        NSMutableArray *array3 = [NSMutableArray array];
        [array3 addObject:item8];
        [array3 addObject:item9];
        [array3 addObject:item10];
        [array3 addObject:item11];
        
        [_array addObject:array1];
        [_array addObject:array2];
        [_array addObject:array3];
        
    }
    return _array;
}

#pragma mark - UITableViewDelegate & UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.array.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSMutableArray *arr = [self.array objectAtIndex:section];
    
    return arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BHAccountCenterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BHAccountCenterTableViewCell"];
    
    if (cell == nil) {
        
        cell = [[BHAccountCenterTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"BHAccountCenterTableViewCell"];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.item = [[self.array objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    
    NSMutableArray *arrrr = [self.array objectAtIndex:indexPath.section];
    
    cell.topLineStyle = BHCellLineStyleNone;
    
    cell.bottomLineStyle = indexPath.row < (arrrr.count-1) ? BHCellLineStyleFill : BHCellLineStyleNone;
    
    cell.delegate = self;
    
    if (indexPath.section == 2 && indexPath.row == 2) {
        cell.bottomLineStyle = BHCellLineStyleNone;
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 80;
    }
    if (indexPath.section == 2 && indexPath.row == 3) {
        return 60;
    }
    return 44;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UITableViewHeaderFooterView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"FotterView"];
    if (view == nil) {
        view = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:@"FotterView"];
        [view setBackgroundView:[UIView new]];
    }
    return view;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1 && indexPath.row == 0) {
        
        BHRealNameIdentifyTableViewController *realNameVC = [[BHRealNameIdentifyTableViewController alloc] init];
        
        [self.navigationController pushViewController:realNameVC animated:YES];
        
    }
    if (indexPath.section == 1 && indexPath.row == 1) {
        
        BHMyBankCardTableViewController *bankCardVC = [[BHMyBankCardTableViewController alloc] init];
        
        [self.navigationController pushViewController:bankCardVC animated:YES];
    }
    if (indexPath.section == 1 && indexPath.row == 2) {
        
        BHBindPhoneNumTableViewController *phoneVC = [[BHBindPhoneNumTableViewController alloc] init];
        
        [self.navigationController pushViewController:phoneVC animated:YES];
        
    }
    if (indexPath.section == 1 && indexPath.row == 3) {
        
        BHTradeSecretTableViewController *tradeVC = [[BHTradeSecretTableViewController alloc] init];
        
        [self.navigationController pushViewController:tradeVC animated:YES];
    }
    if (indexPath.section == 1 && indexPath.row == 4) {
        BHLoginSecretTableViewController *loginVC = [[BHLoginSecretTableViewController alloc] init];
        [self.navigationController pushViewController:loginVC animated:YES];
    }
    if (indexPath.section == 1 && indexPath.row == 5) {
        BHGestureSecretTableViewController *gestureVC = [[BHGestureSecretTableViewController alloc] init];
        [self.navigationController pushViewController:gestureVC animated:YES];
    }
    if (indexPath.section == 2 && indexPath.row == 0) {
        BHFeedbackViewController *feedbackVC = [[BHFeedbackViewController alloc] init];
        [self.navigationController pushViewController:feedbackVC animated:YES];
    }
    if (indexPath.section == 2 && indexPath.row == 1) {
        BHAboutTableViewController *aboutVC = [[BHAboutTableViewController alloc] init];
        [self.navigationController pushViewController:aboutVC animated:YES];
    }
}

- (void)clickAccountCenterTableViewCellButtonWithButton:(UIButton *)button
{
    NSLog(@"安全退出");
    
    [BHAccount logoutSuccess:^(BHResopnse *response) {
        
        if (response.code == 1) {//退出成功
            
        }
        
    } failure:^(NSError *error) {
        
    }];
}

@end
