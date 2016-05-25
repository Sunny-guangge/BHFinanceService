//
//  BHHomeTableViewController.m
//  BHFinanceService
//
//  Created by 王帅广 on 16/5/20.
//  Copyright © 2016年 sunny. All rights reserved.
//

#import "BHHomeTableViewController.h"
#import "WSGScrollView.h"
#import "BHTenderDetailViewController.h"
#import "BHADViewController.h"
#import "BHInvestListTableViewCell.h"
#import "BHRecommandTableViewCell.h"
#import "constant.h"
#import "BHTotalSumView.h"

@implementation BHHomeTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.tableFooterView = [UIView new];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 140 + 55)];
    view.backgroundColor = [UIColor whiteColor];
    NSArray *imageArray = @[
                            @"http://test.weidai.bankhui.com/uploadfiles/homeWeb/174/0fb76b65d27d42b88835be78e7e3f669_water.png",
                            @"http://test.weidai.bankhui.com/uploadfiles/homeWeb/174/64a2dbede5ce484ba2c705a58a34e9fb_water.png",
                            @"http://test.weidai.bankhui.com/uploadfiles/homeWeb/174/be463acdc33a4f929953b8196643b05d_water.png",
                            @"http://test.weidai.bankhui.com/uploadfiles/homeWeb/174/fa183ec1528541b497711362dcbca469_water.png",
                            @"http://test.weidai.bankhui.com/uploadfiles/homeWeb/174/3714888c19d04c07b4e2cb79d944ecfd_water.png",
                            @"http://test.weidai.bankhui.com/uploadfiles/homeWeb/174/8360719c039f47a78d0f3b590bd89742_water.png",
                            @"http://test.weidai.bankhui.com/uploadfiles/homeWeb/174/dbdeb90daa4545e1ad51d1b7c0d0313f_water.png",
                            @"http://test.weidai.bankhui.com/uploadfiles/homeWeb/174/7def7c96faad404ca2e02c010b74be11_water.png",
                            @"http://test.weidai.bankhui.com/uploadfiles/homeWeb/174/a70e606749e3411597030e550ce621e4_water.png",
                            ];
    
    NSMutableArray *array = [NSMutableArray arrayWithArray:imageArray];
    
    WSGScrollView *scroll = [WSGScrollView scrollViewWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 140) imageArray:array placeHolderImage:@"" pageControlShowStyle:WSGPageControlShowStyleCenter];
    scroll.isAutoScrool = YES;
    scroll.scrollTime = 5.0f;
    scroll.tapcallbackBlock = ^(NSUInteger index,NSString *imageURL){
        
        
        BHADViewController *adVC = [[BHADViewController alloc] init];
        
        [self.navigationController pushViewController:adVC animated:YES];
        
    };
//    self.automaticallyAdjustsScrollViewInsets = NO;
    scroll.backgroundColor = [UIColor whiteColor];
    
    
    BHTotalSumView *sumView = [[BHTotalSumView alloc] initWithFrame:CGRectMake(0, 140, SCREEHW, 55)];
    
    [view addSubview:scroll];
    [view addSubview:sumView];
    
    self.tableView.tableHeaderView = view;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
//    self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 49, 0);
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
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
    if (indexPath.row == 0) {
        BHRecommandTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BHRecommandTableViewCell"];
        
        if (cell == nil) {
            cell = [[BHRecommandTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"BHRecommandTableViewCell"];
        }
        
        return cell;
    }
    
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
    if (indexPath.row == 0) {
        return 280;
    }
    
    return 120;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BHTenderDetailViewController *tenderVC = [[BHTenderDetailViewController alloc] init];
    
    [self.navigationController pushViewController:tenderVC animated:YES];
}


@end
