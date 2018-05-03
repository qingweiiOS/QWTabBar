//
//  QWTabBarController.h
//  Mehmet
//  微微卿 制作
//  Created by jonh on 2017/8/14.
//  Copyright © 2017年 jonh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QWTabBar.h"
typedef NS_ENUM(NSInteger, TabBarType) {
    TabBarTypeDefult,//默认从0开始
    TabBarTypeBPath
};
@interface QWTabBarController: UITabBarController<QWTabBarDelegate>
@property (nonatomic, strong) QWTabBar *qwTabBar;
+ (QWTabBarController *)qwTabbarController;
@end
