//
//  QWTabBarController.m
//  Created by xxxx on 2017/8/14.
//    Copyright © 2017年 xxxx. All rights reserved.
//
//  Copyright © 2017年 xxxx. All rights reserved.
//

#import "QWTabBarController.h"
static QWTabBarController *tabbarCtl;
@interface QWTabBarController ()
{
    
}
@end
@implementation QWTabBarController
+ (QWTabBarController *)qwTabbarController{

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tabbarCtl = [[QWTabBarController alloc] init];
    });
    return tabbarCtl;
}

- (void)viewDidLoad {
     [super viewDidLoad];
     self.view.backgroundColor = [UIColor whiteColor];
     [self addChildViewControllers];
}
- (void)addChildViewControllers
{
    NSMutableArray *array = [NSMutableArray arrayWithArray:@[@"UIViewController",@"UIViewController",@"UIViewController",@"UIViewController",@"TestViewController"]];
    NSArray *imgArray = @[@"homePage",@"task",@"complaint",@"home_activity",@"me"];
    NSArray *selectImageArray = @[@"homePage_select",@"task_select",@"complaint_select",@"home_activity_select",@"me_select"];
    NSArray *titles = @[@"首页",@"任务",@"动态",@"活动",@"我的"];
    
    for(int i =0;i<array.count;i++)
    {
        UIViewController *vc = [[NSClassFromString(array[i]) alloc] init];
        /*
         如果想用系统的TabBar，解除以下3行注释 删除 【****】代码
         */
//        vc.tabBarItem.title = titles[i];
//        vc.tabBarItem.image = [UIImage imageNamed:imgArray[i]];
//        vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectImageArray[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [array replaceObjectAtIndex:i withObject:vc];
    }
    self.viewControllers = array;
    /*
     * 【****】代码
     */
    /// 将自定义的覆盖到原来的tabBar上面
    self.qwTabBar = [[QWTabBar alloc] initWithTitles:titles itemImages:imgArray selectImages:selectImageArray];
    self.qwTabBar.delegate = self;
    self.qwTabBar.tintColor = [UIColor orangeColor];
    [self.tabBar addSubview:self.qwTabBar];
}
/*
 * 【****】代码
 */
- (void)selectIndex:(NSInteger)index{
    /// 通知 切换视图控制器
    [self setSelectedIndex:index];
}
- (void)setSelectedIndex:(NSUInteger)selectedIndex{
    
    [super setSelectedIndex:selectedIndex];
     if(self.qwTabBar)
     {
       self.qwTabBar.selectIndex = selectedIndex;
     }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
 
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
