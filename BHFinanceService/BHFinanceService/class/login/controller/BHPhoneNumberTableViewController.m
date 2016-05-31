//
//  BHPhoneNumberTableViewController.m
//  BHFinanceService
//
//  Created by 王帅广 on 16/5/30.
//  Copyright © 2016年 sunny. All rights reserved.
//

#import "BHPhoneNumberTableViewController.h"
#import "BHAccountCenterTableViewCell.h"
#import "BHItem.h"
#import "constant.h"
#import "BHRegisterTableViewController.h"
#import "BHNoteLoginTableViewController.h"
#import "BHAccount.h"

@interface BHPhoneNumberTableViewController ()<BHAccountCenterTableViewCellDelegate>

@property (nonatomic,strong) NSMutableArray *array;

@end

@implementation BHPhoneNumberTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"填写手机号";
    
    self.tableView.contentInset = UIEdgeInsetsMake(60, 0, 0, 0);
    
    self.view.backgroundColor = [UIColor stringTOColor:BHAPPBackGroundColor];
    self.tableView.backgroundColor = [UIColor stringTOColor:BHAPPBackGroundColor];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_back"] style:UIBarButtonItemStylePlain target:self action:@selector(didClickBackButtonItem)];
    
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
}

#pragma mark = Selector
- (void)didClickBackButtonItem
{
    [self.navigationController popViewControllerAnimated:YES];
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
        
        NSMutableArray *array1 = [NSMutableArray array];
        
        BHItem *item1 = [[BHItem alloc] initWithTitle:@"手机号" placeHoleder:@"请输入手机号进行登录或注册" text:@"" ItemType:BHItemTypeTextField];
        [array1 addObject:item1];
        
        NSMutableArray *array2 = [NSMutableArray array];
        
        BHItem *item2 = [[BHItem alloc] initWithTitle:@"下一步" ItemType:BHItemTypeButton];
        [array2 addObject:item2];
        
        [_array addObject:array1];
        [_array addObject:array2];
        
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
    NSMutableArray *array = [self.array objectAtIndex:section];
    
    return array.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
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
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.delegate = self;
    
    cell.item = [[self.array objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    
    cell.topLineStyle = BHCellLineStyleNone;
    cell.bottomLineStyle = BHCellLineStyleNone;
    
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

#pragma mark - BHAccountCenterTableViewCellDelegate
- (void)clickAccountCenterTableViewCellButtonWithButton:(UIButton *)button
{
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    
    BHAccountCenterTableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    
    [BHAccount verifyUserPhone:cell.textField.text success:^(BHResopnse *response) {
        
        NSLog(@"%@",response);
        
    } failure:^(NSError *error) {
        
        NSLog(@"%@",error);
        
    }];
    
}

- (void)accountCenterTextFieldDidEndEditing:(UITextField *)textField
{
    
    
    
}

- (void)enterNextViewController
{
    //    BHNoteLoginTableViewController *noteVC = [[BHNoteLoginTableViewController alloc] init];
    //
    //    [self.navigationController pushViewController:noteVC animated:YES];
    
    BHRegisterTableViewController *registerVC = [[BHRegisterTableViewController alloc] init];
    
    [self.navigationController pushViewController:registerVC animated:YES];
}

@end
