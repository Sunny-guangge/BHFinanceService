//
//  BHBindNewPhoneTableViewController.m
//  BHFinanceService
//
//  Created by 王帅广 on 16/5/26.
//  Copyright © 2016年 sunny. All rights reserved.
//

#import "BHBindNewPhoneTableViewController.h"
#import "BHAccountCenterTableViewCell.h"
#import "constant.h"
#import "BHItem.h"

@interface BHBindNewPhoneTableViewController ()<BHAccountCenterTableViewCellDelegate>

@property (nonatomic,strong) NSMutableArray *array;

@end

@implementation BHBindNewPhoneTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor stringTOColor:BHAPPBackGroundColor];
    self.tableView.backgroundColor = [UIColor stringTOColor:BHAPPBackGroundColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
    
    self.title = @"绑定新手机";
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
        
        BHItem *item0 = [[BHItem alloc] initWithTitle:@"" placeHoleder:@"请填写11位手机号" text:@"" ItemType:BHItemTypeTextField];
        BHItem *item1 = [[BHItem alloc] initWithTitle:@"" placeHoleder:@"请输入验证码" text:@"" ItemType:BHItemTypeTextFieldGetCode];
        
        NSMutableArray *array1 = [NSMutableArray array];
        [array1 addObject:item0];
        [array1 addObject:item1];
        
        BHItem *item2 = [[BHItem alloc] initWithTitle:@"提交" ItemType:BHItemTypeButton];
        
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


- (void)clickAccountCenterTableViewCellButtonWithButton:(UIButton *)button
{
    NSLog(@"提交完成");
}

@end
