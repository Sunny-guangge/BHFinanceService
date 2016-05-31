//
//  BHFinanceTableViewController.m
//  BHFinanceService
//
//  Created by 王帅广 on 16/5/20.
//  Copyright © 2016年 sunny. All rights reserved.
//

#import "BHFinanceTableViewController.h"
#import "BHInvestListTableViewCell.h"
#import "BHLoginTableViewController.h"
#import "BHNavigationViewController.h"

@implementation BHFinanceTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.tableFooterView = [UIView new];
    
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"登陆" style:UIBarButtonItemStylePlain target:self action:@selector(didClickLogiinButton)];
    
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
}

- (void)didClickLogiinButton
{
    UIStoryboard *login = [UIStoryboard storyboardWithName:@"login" bundle:nil];
    
    BHNavigationViewController *loginVC = [login instantiateInitialViewController];
    
    [self presentViewController:loginVC animated:YES completion:nil];
}

#pragma mark - UITableViewDelegate & UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"tableViewCell";
    
    BHInvestListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        
        cell = [[BHInvestListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        
    }
    cell.backgroundColor = [UIColor grayColor];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.topLineStyle = BHCellLineStyleNone;
    cell.bottomLineStyle = BHCellLineStyleNone;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


@end
