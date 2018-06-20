//
//  TabBarController.m
//  LearnDemo
//
//  Created by 王兴财 on 2018/2/24.
//  Copyright © 2018年 wangxingcai. All rights reserved.
//

#import "TabBarController.h"
#import "HomeViewController.h"
#import "MyViewController.h"
@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    HomeViewController * homeVC = [[HomeViewController alloc]init];
    UINavigationController *homeNavi = [[UINavigationController alloc]initWithRootViewController:homeVC];
    homeNavi.title = @"首页";
    
    MyViewController * myVC = [[MyViewController alloc]init];
    UINavigationController *myNavi = [[UINavigationController alloc]initWithRootViewController:myVC];
    myNavi.title = @"我的";
    
    self.viewControllers = @[homeNavi, myNavi];
    // Do any additional setup after loading the view.
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
