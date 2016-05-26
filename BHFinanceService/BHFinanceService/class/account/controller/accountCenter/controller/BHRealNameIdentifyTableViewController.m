//
//  BHRealNameIdentifyTableViewController.m
//  BHFinanceService
//
//  Created by 王帅广 on 16/5/25.
//  Copyright © 2016年 sunny. All rights reserved.
//

#import "BHRealNameIdentifyTableViewController.h"
#import "BHItem.h"
#import "BHAccountCenterTableViewCell.h"
#import "constant.h"

@interface BHRealNameIdentifyTableViewController ()<BHAccountCenterTableViewCellDelegate>

@property (nonatomic,strong) NSMutableArray *array;

@end

@implementation BHRealNameIdentifyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"实名认证";
    
    self.view.backgroundColor = [UIColor stringTOColor:BHAPPBackGroundColor];
    self.tableView.backgroundColor = [UIColor stringTOColor:BHAPPBackGroundColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
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
        
        BHItem *item1 = [[BHItem alloc] initWithTitle:@"姓名 " placeHoleder:@"请输入持卡人真是姓名" text:@"" ItemType:BHItemTypeTextField];
        BHItem *item2 = [[BHItem alloc] initWithTitle:@"证件号 " placeHoleder:@"仅支持中国大陆身份证号" text:@"" ItemType:BHItemTypeTextField];
        
        NSMutableArray *array1 = [NSMutableArray array];
        [array1 addObject:item1];
        [array1 addObject:item2];
        
        BHItem *item3 = [[BHItem alloc] initWithTitle:@"提交" ItemType:BHItemTypeButton];
        
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
    
    cell.textField.tag = indexPath.row + 10;
    
    NSMutableArray *arrrr = [self.array objectAtIndex:indexPath.section];
    
    cell.topLineStyle = BHCellLineStyleNone;
    
    cell.bottomLineStyle = indexPath.row < (arrrr.count-1) ? BHCellLineStyleFill : BHCellLineStyleNone;
    
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

#pragma mark - BHAccountCenterTableViewCellDelegate
- (void)clickAccountCenterTableViewCellButtonWithButton:(UIButton *)button
{
    
}

- (void)accountCenterTextFieldDidEndEditing:(UITextField *)textField
{
    if (textField.tag == 10) {
        
    }
    
    if (textField.tag == 11) {
        
        
        
    }
}

@end
