//
//  QWTabBarController.h
//  QWTabBar
//
//  Created by xxxx on 2017/8/14.
//  Copyright © 2017年 jonh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QWTabBar.h"
@interface QWTabBarController: UITabBarController<QWTabBarDelegate>
@property (nonatomic, strong) QWTabBar *qwTabBar;
+ (QWTabBarController *)qwTabbarController;
@end
