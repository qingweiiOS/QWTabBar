//
//  QWTabBarController.m
//  Created by jonh on 2017/8/14.
//    Copyright © 2017年 jonh. All rights reserved.
//
//  Copyright © 2017年 jonh. All rights reserved.
//

#import "QWTabBarController.h"
#import <Masonry.h>


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
 最好在这里不要设置与VC视图显示相关的内容）比如：背景颜色） 如果设置了，该VC的viewDidLoad 方法就会加载 这不是我们想看到的
 Don't set anything to show in the VC view here, like :(background color) if set, the viewDidLoad method of the VC will load, which is not what we want to see.
  */
//        vc.view.backgroundColor = [UIColor whiteColor];
        
        /*
         如果想用系统的TabBar，解除以下3行注释 删除 【****】代码
         if you want to use the system's TabBar, uncomment the following 3 lines and delete the [***] code
         */
//        vc.tabBarItem.title = titles[i];
//        vc.tabBarItem.image = [UIImage imageNamed:imgArray[i]];
//        vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectImageArray[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [array replaceObjectAtIndex:i withObject:vc];
    }
    self.viewControllers = array;
    self.tabBar.tintColor = [UIColor orangeColor];
    self.tabBar.backgroundColor = [UIColor redColor];
    /*
     以下为【****】代码 哈哈哈哈哈哈
     The following code is [****]
     */
    /// 将自定义的覆盖到原来的tabBar上面
    /// Overwrite the TabBar to the TabBar of the system
    self.qwTabBar = [[QWTabBar alloc] initWithTitles:titles itemImages:imgArray selectImages:selectImageArray];
    self.qwTabBar.delegate = self;
    self.qwTabBar.tintColor = [UIColor orangeColor];
    [self.tabBar addSubview:self.qwTabBar];
}
/* 以下为【****】代码
   The following code is [****]
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
