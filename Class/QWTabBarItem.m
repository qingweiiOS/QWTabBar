//
//  QWTabBarItem.m
//  QWTabBar
//
//  Created by xxxx on 2018/4/26.
//  Copyright © 2018年 xxxx. All rights reserved.
//

#import "QWTabBarItem.h"
#import "QWTabBarBadge.h"
#import "Masonry.h"
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
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self createView];
    }
    return self;
}

- (void)createView{
    _isSelect = NO;

    _icomImgView = [[UIImageView alloc] init];
    
    _icomImgView.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:_icomImgView];
    [_icomImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.mas_offset(9);
        make.width.height.mas_offset(20);
    }];

    _titleLab = [[UILabel alloc] init];
    _titleLab.textAlignment = NSTextAlignmentCenter;
    _titleLab.font = [UIFont systemFontOfSize:9];
    [self addSubview:_titleLab];
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_offset(0);
        make.top.mas_offset(35);
        make.height.mas_offset(14);
    }];
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

- (void)setBadge:(NSInteger)count{
    
    if(!_badgeLab){
        _badgeLab = [[QWTabBarBadge alloc] init];
        [self addSubview:_badgeLab];
        [_badgeLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_icomImgView.mas_right).mas_offset(0);
            make.top.mas_offset(2);
            make.width.height.mas_offset(18);
        }];
    }
     _badgeLab.badge = count;
}
@end
