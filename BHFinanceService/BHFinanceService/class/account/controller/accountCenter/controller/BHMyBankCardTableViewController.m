//
//  BHMyBankCardTableViewController.m
//  BHFinanceService
//
//  Created by 王帅广 on 16/5/25.
//  Copyright © 2016年 sunny. All rights reserved.
//

#import "BHMyBankCardTableViewController.h"

@interface BHMyBankCardTableViewController ()

@end

@implementation BHMyBankCardTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"我的银行卡";
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tableView"];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"tableView"];
    }
    
    cell.textLabel.text = @(indexPath.row).description;
    
    return cell;
}

@end
