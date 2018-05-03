//
//  QWTabBarItem.h
//  QWTabBar
//
//  Created by xxxx on 2018/4/26.
//  Copyright © 2018年 xxxx. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface QWTabBarItem : UIView
@property (nonatomic, copy) NSString *title;
/// 当前的 Image
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) UIImage *selectImage;
@property (nonatomic, assign) BOOL isSelect;
@property (nonatomic, strong) UIImageView *icomImgView;
@property (nonatomic, strong) UILabel *titleLab;
@end
