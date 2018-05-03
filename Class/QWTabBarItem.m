//
//  QWTabBarItem.m
//  QWTabBar
//
//  Created by xxxx on 2018/4/26.
//  Copyright © 2018年 xxxx. All rights reserved.
//

#import "QWTabBarItem.h"
#import "QWTabBarBadge.h"
@interface QWTabBarItem()

@end
@implementation QWTabBarItem
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
        
    }
    return self;
}

- (void)createView{
    _isSelect = NO;
    _icomImgView = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width/2-10, 9, 20, 20)];
    _icomImgView.contentMode = UIViewContentModeScaleAspectFit;

    [self addSubview:_icomImgView];
    _titleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 35, self.frame.size.width, 14)];
    _titleLab.textAlignment = NSTextAlignmentCenter;
    _titleLab.font = [UIFont systemFontOfSize:9];
    [self addSubview:_titleLab];
}
- (void)setTitle:(NSString *)title{
    _title = title;
    self.titleLab.text = _title;
}
- (void)setImage:(UIImage *)image{
    _image = image;
    self.icomImgView.image = _image;
}
- (void)setIsSelect:(BOOL)isSelect{
    _isSelect = isSelect;
    if(_isSelect)
    {
        self.icomImgView.image = _selectImage;
    }else{
        self.icomImgView.image = _image;
    }
}

@end
