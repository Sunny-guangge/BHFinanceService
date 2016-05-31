//
//  BHRegisterTableViewController.m
//  BHFinanceService
//
//  Created by 王帅广 on 16/5/30.
//  Copyright © 2016年 sunny. All rights reserved.
//

#import "BHRegisterTableViewController.h"
#import "constant.h"
#import "BHItem.h"
#import "BHAccountCenterTableViewCell.h"
#import "BHAccount.h"
#import "BHResopnse.h"

@interface BHRegisterTableViewController ()<BHAccountCenterTableViewCellDelegate>

@property (nonatomic,strong) NSMutableArray *array;

@end

@implementation BHRegisterTableViewController
{
    BOOL isSelect;
    UIButton *selectButton;
    
    NSInteger time;
    NSTimer *nstimer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"注册";
    
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
    
    isSelect = YES;
    
    
    UIView *footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEHW, 40)];
    
    selectButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [selectButton addTarget:self action:@selector(didClickSelectButton) forControlEvents:UIControlEventTouchUpInside];
    [selectButton setTitle:@"已选择" forState:UIControlStateNormal];
    [selectButton.titleLabel setFont:[UIFont systemFontOfSize:13]];
    [selectButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    selectButton.frame = CGRectMake(40, 10, 40, 20);
    [footView addSubview:selectButton];
    
    UIButton *servceButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [servceButton addTarget:self action:@selector(didClickServiceButton) forControlEvents:UIControlEventTouchUpInside];
    servceButton.titleLabel.textColor = [UIColor greenColor];
    servceButton.titleLabel.font = [UIFont systemFontOfSize:13];
    [servceButton setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    servceButton.frame = CGRectMake(CGRectGetMaxX(selectButton.frame), 10, 110, 20);
    NSString * aString = @"《平台服务协议》";
    
    //富文本对象
    NSMutableAttributedString * aAttributedString = [[NSMutableAttributedString alloc] initWithString:aString];
    
    //富文本样式
    [aAttributedString addAttribute:NSForegroundColorAttributeName  //文字颜色
                              value:[UIColor blueColor]
                              range:NSMakeRange(1, 2)];
    
    [aAttributedString addAttribute:NSFontAttributeName             //文字字体
                              value:[UIFont systemFontOfSize:13]
                              range:NSMakeRange(1, 2)];
    
    [servceButton setAttributedTitle:aAttributedString forState:UIControlStateNormal];
    [footView addSubview:servceButton];
    
    
    UIButton *secretButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [secretButton addTarget:self action:@selector(didClickSecretButton) forControlEvents:UIControlEventTouchUpInside];
    [secretButton setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    secretButton.titleLabel.textColor = [UIColor greenColor];
    secretButton.titleLabel.font = [UIFont systemFontOfSize:13];
    NSString * bString = @"《平台隐私条款》";
    secretButton.frame = CGRectMake(CGRectGetMaxX(servceButton.frame), 10, 110, 20);
    
    //富文本对象
    NSMutableAttributedString * bAttributedString = [[NSMutableAttributedString alloc] initWithString:bString];
    
    //富文本样式
    [bAttributedString addAttribute:NSForegroundColorAttributeName  //文字颜色
                              value:[UIColor blueColor]
                              range:NSMakeRange(1, 2)];
    
    [bAttributedString addAttribute:NSFontAttributeName             //文字字体
                              value:[UIFont systemFontOfSize:13]
                              range:NSMakeRange(1, 2)];
    
    [secretButton setAttributedTitle:bAttributedString forState:UIControlStateNormal];
    [footView addSubview:secretButton];
    
    self.tableView.tableFooterView = footView;
    
}

- (void)dealloc
{
    [nstimer invalidate];
    nstimer = nil;
}

- (void)didClickSelectButton
{
    if (isSelect) {
        
        [selectButton setTitle:@"未选择" forState:UIControlStateNormal];
        isSelect = NO;
        
    }else
    {
        [selectButton setTitle:@"已选择" forState:UIControlStateNormal];
        isSelect = YES;
    }
}

- (void)didClickServiceButton
{
    NSLog(@"服务协议");
}

- (void)didClickSecretButton
{
    NSLog(@"隐私条款");
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
        
        BHItem *item1 = [[BHItem alloc] initWithTitle:@"验证码" placeHoleder:@"请输入验证码" text:@"" ItemType:BHItemTypeTextFieldGetCode];
        BHItem *item2 = [[BHItem alloc] initWithTitle:@"登录密码" placeHoleder:@"6-20位字符" text:@"" ItemType:BHItemTypeTextField];
        
        NSMutableArray *array1 = [NSMutableArray array];
        [array1 addObject:item1];
        [array1 addObject:item2];
        
        BHItem *item3 = [[BHItem alloc] initWithTitle:@"注册" ItemType:BHItemTypeButton];
        
        NSMutableArray *array2 = [NSMutableArray array];
        [array2 addObject:item3];
        
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
    
    cell.item = [[self.array objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    
    [cell.codeButton addTarget:self action:@selector(clicksendCodeButton) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 1) {
        return 10;
    }
    
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

- (void)clickAccountCenterTableViewCellButtonWithButton:(UIButton *)button
{
    NSLog(@"注册");
    
    NSIndexPath *indexPath1 = [NSIndexPath indexPathForRow:0 inSection:0];
    NSIndexPath *indexPath2 = [NSIndexPath indexPathForRow:1 inSection:0];
    
    BHAccountCenterTableViewCell *cell1 = [self.tableView cellForRowAtIndexPath:indexPath1];
    
    BHAccountCenterTableViewCell *cell2 = [self.tableView cellForRowAtIndexPath:indexPath2];
    
    if ([[cell1.textField.text trimString] isEmptyString]) {
        return;
    }
    if ([[cell2.textField.text trimString] isEmptyString]) {
        return;
    }
    
    [BHAccount registerWithPhone:@"" SMSCode:[cell1.textField.text trimString] password:[cell2.textField.text trimString] success:^(BHResopnse *response) {
        
        if (response.code == 1) {// 注册成功
            
        }
        if (response.code == 2) {//手机号错误
            
        }
        if (response.code == 3) {//密码错误
            
        }
        if (response.code == 4) {//该手机号已经注册
            
        }
        if (response.code == 5) {//验证码错误
            
        }
        
    } failure:^(NSError *error) {
        
        
        
    }];
}

- (void)clicksendCodeButton
{
    [BHAccount sendSMSCodeWithPhone:_phoneNumber purpose:@"8" accessPort:@"3" success:^(BHResopnse *response) {
        
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

@end
