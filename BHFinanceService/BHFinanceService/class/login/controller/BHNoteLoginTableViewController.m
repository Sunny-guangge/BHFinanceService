//
//  BHNoteLoginTableViewController.m
//  BHFinanceService
//
//  Created by 王帅广 on 16/5/30.
//  Copyright © 2016年 sunny. All rights reserved.
//

#import "BHNoteLoginTableViewController.h"
#import "BHItem.h"
#import "BHAccountCenterTableViewCell.h"
#import "constant.h"
#import "BHAccount.h"
#import "BHResopnse.h"

@interface BHNoteLoginTableViewController ()<BHAccountCenterTableViewCellDelegate>

@property (nonatomic,strong) NSMutableArray *array;

@end

@implementation BHNoteLoginTableViewController
{
    NSInteger time;
    NSTimer *nstimer;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"登录";
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEHW, 80)];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, SCREEHW, 20)];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont systemFontOfSize:14];
    titleLabel.textColor = [UIColor grayColor];
    titleLabel.text = @"已将短信验证码发送至";
    [view addSubview:titleLabel];
    
    UILabel *phoneLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(titleLabel.frame)+5, SCREEHW, 40)];
    phoneLabel.textAlignment = NSTextAlignmentCenter;
    phoneLabel.font = [UIFont systemFontOfSize:25];
    phoneLabel.textColor = [UIColor blackColor];
    phoneLabel.text = _phoneNumber;
    [view addSubview:phoneLabel];
    
    self.tableView.tableHeaderView = view;
    
    self.view.backgroundColor = [UIColor stringTOColor:BHAPPBackGroundColor];
    self.tableView.backgroundColor = [UIColor stringTOColor:BHAPPBackGroundColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)dealloc
{
    [nstimer invalidate];
    nstimer = nil;
}

- (NSMutableArray *)array
{
    if (_array == nil) {
        _array = [NSMutableArray array];
        
        BHItem *item1 = [[BHItem alloc] initWithTitle:@"验证码" placeHoleder:@"请输入验证码" text:@"" ItemType:BHItemTypeTextFieldGetCode];
        
        NSMutableArray *array1 = [NSMutableArray array];
        [array1 addObject:item1];
        
        BHItem *item2 = [[BHItem alloc] initWithTitle:@"登录" ItemType:BHItemTypeButton];
        
        NSMutableArray *array2 = [NSMutableArray array];
        [array2 addObject:item2];
        
        [_array addObject:array1];
        [_array addObject:array2];
    }
    return _array;
}

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
    BHAccountCenterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tableView"];
    
    if (cell == nil) {
        
        cell = [[BHAccountCenterTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"tableView"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.delegate = self;
    
    cell.topLineStyle = BHCellLineStyleNone;
    cell.bottomLineStyle = BHCellLineStyleNone;
    
    [cell.codeButton addTarget:self action:@selector(didClickSendSMSCoe) forControlEvents:UIControlEventTouchUpInside];
    
    cell.item = [[self.array objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 60;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
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

- (void)didClickSendSMSCoe
{
    
    [BHAccount sendSMSCodeWithPhone:_phoneNumber purpose:@"27" accessPort:@"3" success:^(BHResopnse *response) {
        
        if (response.code == 1) {//发送验证码成功
            nstimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTime) userInfo:nil repeats:YES];
            [nstimer fire];
            //            [weakSelf buttonWithCountDown];
            [MBProgressHUD showSuccess:@"发送成功"];
        }
        if (response.code == 2) {//手机号不能为空
            [MBProgressHUD showError:@"手机号不能为空"];
        }
        if (response.code == 3) {//手机号格式错误
            [MBProgressHUD showError:@"手机号格式错误"];
        }
        if (response.code == 4) {//功能参数不可为空
            [MBProgressHUD showError:@"功能参数不可为空"];
        }
        if (response.code == 5) {//今天该功能发送数量已达到10条
            [MBProgressHUD showError:@"今天该功能发送数量已达到10条"];
        }
        if (response.code == 6) {//一小时内该功能发送数量已达到3条
            [MBProgressHUD showError:@"一小时内该功能发送数量已达到3条"];
        }
        if (response.code == 7) {//手机号[13167548790],发送短信过于频繁
            [MBProgressHUD showError:@"手机号[13167548790],发送短信过于频繁"];
        }
        
    } failure:^(NSError *error) {
        
    }];
}

- (void)updateTime
{
    if (time > 0) {
        
        NSString *strTime = [NSString stringWithFormat:@"%lds",(long)time];
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:2 inSection:0];
        
        BHAccountCenterTableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
        
        [cell.codeButton setTitle:strTime forState:UIControlStateDisabled];
        cell.codeButton.enabled = NO;
        
        time--;
        
    }else
    {
        [nstimer invalidate];
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:2 inSection:0];
        
        BHAccountCenterTableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
        
        [cell.codeButton setTitle:@"获取验证码" forState:UIControlStateNormal];
        
        cell.codeButton.enabled = YES;
        
        time = 59;
        return;
    }
}

- (void)clickAccountCenterTableViewCellButtonWithButton:(UIButton *)button
{
    NSLog(@"短信验证码登录");
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    
    BHAccountCenterTableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    
    if ([[cell.textField.text trimString] isEmptyString]) {
        
        return;
    }
    
    [BHAccount loginWithSMSWithPhone:_phoneNumber SMSCode:[cell.textField.text trimString] success:^(BHResopnse *response) {
        
        if (response.code == 1) {//登录成功
            
        }
        if (response.code == 2) {//手机号错误
            [MBProgressHUD showError:@"手机号错误"];
        }
        if (response.code == 3) {//该手机号未注册
            [MBProgressHUD showError:@"该手机号未注册"];
        }
        if (response.code == 4) {//验证码错误
            [MBProgressHUD showError:@"验证码错误"];
        }
        if (response.code == 5) {//您没有授权!请联系客服
            [MBProgressHUD showError:@"您没有授权!请联系客服"];
        }
        if (response.code == 6) {//该账户已冻结，请联系客服
            [MBProgressHUD showError:@"该账户已冻结，请联系客服"];
        }
        
    } failure:^(NSError *error) {
        
        
    }];
}

@end
