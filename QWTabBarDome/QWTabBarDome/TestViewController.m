//
//  TestViewController.m
//  QWTabBarDome
//
//  Created by xxxx on 2018/5/7.
//  Copyright © 2018年 xxxx. All rights reserved.
//

#import "TestViewController.h"
#import "QWTabBarController.h"
@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    [[QWTabBarController qwTabbarController].qwTabBar setBadge:122 index:4];
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
