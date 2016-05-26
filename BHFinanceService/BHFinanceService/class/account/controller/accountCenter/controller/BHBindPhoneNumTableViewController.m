//
//  BHBindPhoneNumTableViewController.m
//  BHFinanceService
//
//  Created by 王帅广 on 16/5/25.
//  Copyright © 2016年 sunny. All rights reserved.
//

#import "BHBindPhoneNumTableViewController.h"
#import "BHItem.h"
#import "BHAccountCenterTableViewCell.h"
#import "constant.h"
#import "BHBindNewPhoneTableViewController.h"

@interface BHBindPhoneNumTableViewController ()<BHAccountCenterTableViewCellDelegate>

@property (nonatomic,strong) NSMutableArray *array;

@end

@implementation BHBindPhoneNumTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"绑定手机号";
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEHW, 80)];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, SCREEHW, 20)];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont systemFontOfSize:14];
    titleLabel.textColor = [UIColor grayColor];
    titleLabel.text = @"原手机号码";
    [view addSubview:titleLabel];
    
    UILabel *phoneLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(titleLabel.frame)+5, SCREEHW, 40)];
    phoneLabel.textAlignment = NSTextAlignmentCenter;
    phoneLabel.font = [UIFont systemFontOfSize:25];
    phoneLabel.textColor = [UIColor blackColor];
    phoneLabel.text = @"188****8888";
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


- (NSMutableArray *)array
{
    if (_array == nil) {
        _array = [NSMutableArray array];
        
        BHItem *item1 = [[BHItem alloc] initWithTitle:@"" placeHoleder:@"请输入验证码" text:@"" ItemType:BHItemTypeTextFieldGetCode];
        
        NSMutableArray *array1 = [NSMutableArray array];
        [array1 addObject:item1];
        
        BHItem *item2 = [[BHItem alloc] initWithTitle:@"下一步" ItemType:BHItemTypeButton];
        
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
    BHBindNewPhoneTableViewController *newPhoneVC = [[BHBindNewPhoneTableViewController alloc] init];
    
    [self.navigationController pushViewController:newPhoneVC animated:YES];
}

@end
