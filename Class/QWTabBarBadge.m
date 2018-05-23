//
//  QWTabBarBadge.m
//  QWTabBar
//
//  Created by 卿伟 on 2018/4/26.
//  Copyright © 2018年 xxxx. All rights reserved.
//

#import "QWTabBarBadge.h"
@implementation QWTabBarBadge

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        self.textColor = [UIColor whiteColor];
        self.font = [UIFont boldSystemFontOfSize:10];
      
        self.textAlignment = NSTextAlignmentCenter;
        self.clipsToBounds = YES;
    }
    return self;
}
- (void)setFrame:(CGRect)frame{
    
    [super setFrame:frame];
     self.layer.cornerRadius = self.frame.size.height/2.0;
}
- (void)setBadge:(NSInteger)badge{
    NSString *badgeStr;
    if(badge>99){
        badgeStr = @"99+";
    }
    else if(badge <=0){
        self.hidden = YES;
        self.text = @"";
        return;
    }
    else {
        badgeStr = [NSString stringWithFormat:@"%ld",badge];
    }
    self.hidden = NO;
    CGFloat widths = badgeStr.length*9<18?18:badgeStr.length*9;
    CGFloat swith = self.superview.frame.size.width/_itemCount;
    self.frame = CGRectMake(swith/2+8+(self.tag-10086)*swith, 5, widths, 18);
    self.text = badgeStr;
}
@end
