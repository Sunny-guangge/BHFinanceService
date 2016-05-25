//
//  BHNavigationViewController.m
//  bankHuiClient
//
//  Created by 王帅广 on 16/3/15.
//  Copyright © 2016年 sunny. All rights reserved.
//

#import "BHNavigationViewController.h"
#import "UIColor+BH.h"

@interface BHNavigationViewController ()

@end

@implementation BHNavigationViewController
#define     DEFAULT_NAVBAR_COLOR            [UIColor colorWithRed:20.0/255.0 green:20.0/255.0 blue:20.0/255.0 alpha:0.9]

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    UINavigationBar *navigationBar = [UINavigationBar appearance];
//    
//    navigationBar.barTintColor = BHColorWithSix(BHAPPMAINCOLOR);
//    
//    navigationBar.tintColor = [UIColor whiteColor];
//    
//    navigationBar.titleTextAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:20],
//                                          
//                                          NSForegroundColorAttributeName:[UIColor whiteColor]};
    
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    viewController.hidesBottomBarWhenPushed = YES;
    
    [super pushViewController:viewController animated:animated];
}



- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
