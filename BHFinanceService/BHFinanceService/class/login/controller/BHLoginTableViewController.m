//
//  BHLoginTableViewController.m
//  BHFinanceService
//
//  Created by 王帅广 on 16/5/30.
//  Copyright © 2016年 sunny. All rights reserved.
//

#import "BHLoginTableViewController.h"
#import "BHAccountCenterTableViewCell.h"
#import "BHItem.h"
#import "constant.h"
#import "BHPhoneNumberTableViewController.h"
#import "BHForgetSecretTableViewController.h"
#import "BHAccount.h"
#import "BHResopnse.h"

@interface BHLoginTableViewController ()<BHAccountCenterTableViewCellDelegate>

@property (nonatomic,strong) NSMutableArray *array;

@end

@implementation BHLoginTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor stringTOColor:BHAPPBackGroundColor];
    self.tableView.backgroundColor = [UIColor stringTOColor:BHAPPBackGroundColor];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEHW, 200)];
    headerView.backgroundColor = [UIColor stringTOColor:BHAPPBackGroundColor];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEHW / 2 - 30, 70, 60, 60)];
    imageView.image = [UIImage imageNamed:@"logo"];
    [headerView addSubview:imageView];
    
    self.tableView.tableHeaderView = headerView;
    
    UIView *footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEHW, 40)];
    UIButton *registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [registerButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [registerButton setTitle:@"立即注册" forState:UIControlStateNormal];
    registerButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [registerButton addTarget:self action:@selector(clickRegisterButton) forControlEvents:UIControlEventTouchUpInside];
    registerButton.frame = CGRectMake(SCREEHW - 90, 10, 80, 20);
    [footView addSubview:registerButton];
    
    UIButton *forgetButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [forgetButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [forgetButton setTitle:@"忘记密码" forState:UIControlStateNormal];
    forgetButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [forgetButton addTarget:self action:@selector(clickforgetSecretButton) forControlEvents:UIControlEventTouchUpInside];
    forgetButton.frame = CGRectMake(10, 10, 80, 20);
    [footView addSubview:forgetButton];
    
    self.tableView.tableFooterView = footView;
}

- (void)clickRegisterButton
{
    BHPhoneNumberTableViewController *phoneVC = [[BHPhoneNumberTableViewController alloc] init];
    
    [self.navigationController pushViewController:phoneVC animated:YES];
}

- (void)clickforgetSecretButton
{
    BHForgetSecretTableViewController *forgetSecretVC = [[BHForgetSecretTableViewController alloc] init];
    
    [self.navigationController pushViewController:forgetSecretVC animated:YES];
}

- (NSMutableArray *)array
{
    if (_array == nil) {
        _array = [NSMutableArray array];
        
        NSMutableArray *array1 = [NSMutableArray array];
        
        BHItem *item1 = [[BHItem alloc] initWithTitle:@"手机号" placeHoleder:@"手机号/用户名/邮箱" text:@"" ItemType:BHItemTypeTextField];
        BHItem *item2 = [[BHItem alloc] initWithTitle:@"密 码" placeHoleder:@"请输入密码" text:@"" ItemType:BHItemTypeTextField];
        [array1 addObject:item1];
        [array1 addObject:item2];
        
        NSMutableArray *array2 = [NSMutableArray array];
        
        BHItem *item3 = [[BHItem alloc] initWithTitle:@"登录" ItemType:BHItemTypeButton];
        
        BHItem *item4 = [[BHItem alloc] initWithTitle:@"短信验证码登录" ItemType:BHItemTypeBackWhiteButton];
        [array2 addObject:item3];
        
        NSMutableArray *array3 = [NSMutableArray array];
        [array3 addObject:item4];
        
        [_array addObject:array1];
        [_array addObject:array2];
        [_array addObject:array3];
        
    }
    return _array;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

#pragma mark - UITableViewDelegate & UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.array.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSMutableArray *array = [self.array objectAtIndex:section];
    
    return array.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 1) {
        return 10;
    }
    
    if (section == 2) {
        return 10;
    }
    
    return 60;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BHAccountCenterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BHAccountCenterTableViewCell"];
    
    if (cell == nil) {
        
        cell = [[BHAccountCenterTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"BHAccountCenterTableViewCell"];
        
    }
    
    cell.item = [[self.array objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.delegate = self;
    
    if (indexPath.section == 0) {
        cell.topLineStyle = BHCellLineStyleNone;
        cell.bottomLineStyle = BHCellLineStyleFill;
    }else
    {
        cell.bottomLineStyle =BHCellLineStyleNone;
        cell.topLineStyle = BHCellLineStyleNone;
    }
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UITableViewHeaderFooterView *footView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"foot"];
    
    if (footView == nil) {
        footView = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:@"foot"];
        [footView setBackgroundView:[UIView new]];
    }
    
    return footView;
}

- (void)clickAccountCenterTableViewCellButtonWithButton:(UIButton *)button
{
    NSLog(@"登录");
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    [self.view endEditing:YES];
    
    NSIndexPath *indexPath1 = [NSIndexPath indexPathForRow:0 inSection:0];//用户名
    
    NSIndexPath *indexPath2 = [NSIndexPath indexPathForRow:1 inSection:0]; //密码
    
    BHAccountCenterTableViewCell *cell1 = [self.tableView cellForRowAtIndexPath:indexPath1];
    
    BHAccountCenterTableViewCell *cell2 = [self.tableView cellForRowAtIndexPath:indexPath2];
    
    if ([cell1.textField.text isEmptyString]) {
        
        return;
    }
    
    if ([cell2.textField.text isEmptyString]) {
        
        return;
    }
    
    
    [BHAccount loginWithAccountName:cell1.textField.text passWord:cell2.textField.text responseSuccess:^(BHResopnse *response) {
        
        if (response.code == 1) {
            
            [MBProgressHUD showSuccess:@"登陆成功"];
            
        }
        if (response.code == 2) {//用户名或密码错误
            
            [MBProgressHUD showError:@"用户名或密码错误"];
            
        }
        if (response.code == 3) {//您没有授权!请联系客服
            
            [MBProgressHUD showError:@"您没有授权!请联系客服"];
            
        }
        if (response.code == 4) {//该账户已冻结，请联系客服
            
            [MBProgressHUD showError:@"该账户已冻结，请联系客服"];
            
        }
        
    } failure:^(NSError *error) {
        
        NSLog(@"登陆时的网络错误：%@",error);
        
    }];
    
}

- (void)accountCenterTextFieldDidEndEditing:(UITextField *)textField
{
    
}

- (void)clickAccountCenterCellBackWhiteButton:(UIButton *)button
{
    BHPhoneNumberTableViewController *phoneVC = [[BHPhoneNumberTableViewController alloc] init];
    
    [self.navigationController pushViewController:phoneVC animated:YES];
}

@end
