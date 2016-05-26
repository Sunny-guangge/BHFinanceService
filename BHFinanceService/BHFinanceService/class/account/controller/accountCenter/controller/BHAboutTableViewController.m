//
//  BHAboutTableViewController.m
//  BHFinanceService
//
//  Created by 王帅广 on 16/5/25.
//  Copyright © 2016年 sunny. All rights reserved.
//

#import "BHAboutTableViewController.h"
#import "BHAccountCenterTableViewCell.h"
#import "BHItem.h"
#import "constant.h"

@interface BHAboutTableViewController ()

@property (nonatomic,strong) NSMutableArray *array;

@end

@implementation BHAboutTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"关于我们";
    
    self.view.backgroundColor = [UIColor stringTOColor:BHAPPBackGroundColor];
    self.tableView.backgroundColor = [UIColor stringTOColor:BHAPPBackGroundColor];
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEHW, 200)];
    headerView.backgroundColor = [UIColor stringTOColor:BHAPPBackGroundColor];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEHW / 2 - 30, 70, 60, 60)];
    imageView.image = [UIImage imageNamed:@"logo"];
    [headerView addSubview:imageView];
    
    self.tableView.tableHeaderView = headerView;
    
    
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
        
        BHItem *item1 = [[BHItem alloc] initWithTitle:@"版本" labelStr:@"v1.0.0" ItemType:BHItemTypeLabelWithoutJianTou];
        BHItem *item2 = [[BHItem alloc] initWithTitle:@"官方微信" labelStr:@"p2p" ItemType:BHItemTypeLabelWithoutJianTou];
        BHItem *item3 = [[BHItem alloc] initWithTitle:@"客服电话" labelStr:@"400-888-8888" ItemType:BHItemTypeLabelWithoutJianTou];
        
        
        [_array addObject:item1];
        [_array addObject:item2];
        [_array addObject:item3];
    }
    return _array;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BHAccountCenterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tableView"];
    
    if (cell == nil) {
        
        cell = [[BHAccountCenterTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"tableView"];
    }
    
    cell.topLineStyle = BHCellLineStyleNone;
    cell.bottomLineStyle = BHCellLineStyleNone;
    
    cell.item = [self.array objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
