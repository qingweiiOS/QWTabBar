//
//  QWTabBar.m
//  QWTabBar
//
//  Created by xxxx on 2018/4/26.
//  Copyright © 2018年 xxxx. All rights reserved.
//

#import "QWTabBar.h"
#define K_WIDTH_QW   [UIScreen mainScreen].bounds.size.width
#define ITEMTAG 1000
#define BADGETAG 10086
#define RADIUS  15
@interface QWTabBar()<CAAnimationDelegate>
{
    UIBezierPath *animationPath;
    CAShapeLayer *shapeLayer;
    NSInteger count;
}
@end
@implementation QWTabBar

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */
- (instancetype)initWithTitles:(NSArray <NSString *> *)titles itemImages:(NSArray *)itemImgs selectImages:(NSArray *)selectImages{
    
    self = [super init];
    
    if (self) {
        animationPath = [[UIBezierPath alloc] init];
        shapeLayer = [CAShapeLayer layer];
        _defColor = [UIColor blackColor];
        _tintColor = [UIColor whiteColor];
        _titles = titles;
        _itemImages = itemImgs;
        _selectItemImages = selectImages;
        _selectIndex = 0;
        [self addItems];
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    self.frame = self.superview.bounds;
    self.backgroundColor = [UIColor clearColor];
}
- (void)addItems{
    
    /// 取最小的count 防止越界
    count = _itemImages.count<_selectItemImages.count?_itemImages.count:_selectItemImages.count;
    count = count<_titles.count?count:_titles.count;
    _tabBarItems = [NSMutableArray arrayWithCapacity:count];
    for (int i=0;i<count;i++){
        QWTabBarItem *item = [[QWTabBarItem alloc] initWithFrame:CGRectMake(i*K_WIDTH_QW/count, 0, K_WIDTH_QW/count , 49)];
        item.title = _titles[i];
        item.tag = ITEMTAG + i;
        id images = _itemImages[i];
        item.titleLab.textColor = _defColor;
        id selectimages = _selectItemImages[i];
        
        if([images isKindOfClass:[NSString class]]){
            
            images = [UIImage imageNamed:images];
        }
        
        if([selectimages isKindOfClass:[NSString class]]){
            
            selectimages = [UIImage imageNamed:selectimages];
        }
        item.image = images;
        item.selectImage = selectimages;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectItem:)];
        [item addGestureRecognizer:tap];
        //        item.badge = - 5;
        [_tabBarItems addObject:item];
        [self addSubview:item];
        ///默认选中
        if(i==0){
            self.selectIndex = 0;
            item.isSelect = YES;
            _tabBarItem = item;
            [self setBePath:0];
        }
    }
    
}
- (void)setSelectIndex:(NSInteger)selectIndex{
    
    if(_selectIndex == selectIndex){
        return;
    }
    
    [self pathAnimation:_selectIndex toIndex:selectIndex];
    _selectIndex = selectIndex;
    _tabBarItem.isSelect = NO;
    _tabBarItem.titleLab.textColor = _defColor;
    if(self.delegate){
        [self.delegate selectIndex:selectIndex];
    }
    //
}
- (void)setDefColor:(UIColor *)defColor{
    
    if(_defColor == defColor){
        return;
    }
    _defColor = defColor;
    for (QWTabBarItem * tempItem in _tabBarItems) {
        if(!tempItem.isSelect){
            tempItem.titleLab.textColor = _defColor;
        }
    }
}
- (void)setTintColor:(UIColor *)tintColor{
    
    if(_tintColor == tintColor){
        return;
    }
    _tintColor = tintColor;
    shapeLayer.strokeColor = _tintColor.CGColor;
    for (QWTabBarItem * tempItem in _tabBarItems) {
        if(tempItem.isSelect){
            tempItem.titleLab.textColor = _tintColor;
            return;
        }
    }
    
    
}
- (void)selectItem:(UITapGestureRecognizer *)tap{
    
    QWTabBarItem *tapItem = (QWTabBarItem *)tap.view;
    
    if(_tabBarItem == tapItem){
        return;
    }
    self.selectIndex = tapItem.tag - ITEMTAG;
}
- (void)setBePath:(NSInteger) index{
    //计算中心点
    CGFloat x = K_WIDTH_QW/count*(index+0.5);
    CGPoint center = CGPointMake(x,19);
    [animationPath removeAllPoints];
    [animationPath addArcWithCenter:center radius:RADIUS startAngle:M_PI_2 endAngle:M_PI*2+M_PI_2 clockwise:YES];
    shapeLayer.path = animationPath.CGPath;
    shapeLayer.strokeColor = self.tintColor.CGColor;
    shapeLayer.lineCap = kCALineCapRound;
    shapeLayer.lineWidth = 1;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    [self.layer addSublayer:shapeLayer];
}
- (void)pathAnimation:(NSInteger)formIndex toIndex:(NSInteger)toIndex{
    
    self.superview.userInteractionEnabled = NO;
    //当前中心点
    CGFloat x1 = K_WIDTH_QW/count*(formIndex+0.5);
    CGPoint center1 = CGPointMake(x1,19);
    //目标中心点
    CGFloat x2 = K_WIDTH_QW/count*(toIndex+0.5);
    CGPoint center2 = CGPointMake(x2,19);
    /// 相隔几个item
    NSInteger indexPoor = toIndex - formIndex;
    
    // 计算 运动路径长度
    CGFloat length = 4*M_PI*RADIUS+labs(indexPoor)*K_WIDTH_QW/count;
    //计算一个圆的周长
    CGFloat s = 2*M_PI*RADIUS;
    
    /// 判断动画执行方向 顺时针 或 逆时针
    BOOL clockwise = indexPoor<0?YES:NO;
    /// 移除之前的路径
    [animationPath removeAllPoints];
    
    /// 添加路径 两个圆圈
    [animationPath addArcWithCenter:center1 radius:RADIUS startAngle:M_PI_2-0.001 endAngle:M_PI*2+M_PI_2 clockwise:clockwise];
    [animationPath addArcWithCenter:center2 radius:RADIUS startAngle:M_PI_2-0.001 endAngle:M_PI*2+M_PI_2 clockwise:clockwise];
    
    shapeLayer.path = animationPath.CGPath;
    //strokeEnd 绘制路径
    CABasicAnimation *strokeEndAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    strokeEndAnimation.duration = 0.5;
    /*
     fromValue = 0，toValue = 1 不一定是0到1 也可以是1-0 也可以是其他 自行实验
     就是从开始位置（fromValue）0 一直绘制toValue（1） 效果就是一条路径慢慢显示
     */
    strokeEndAnimation.fromValue = @0;
    strokeEndAnimation.toValue = @1;
    
    strokeEndAnimation.removedOnCompletion = clockwise;
    strokeEndAnimation.fillMode =kCAFillModeForwards;
    strokeEndAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    //strokeStart 清除路径
    CABasicAnimation *strokeStartAnimation = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    
    strokeStartAnimation.duration = strokeEndAnimation.duration - 0.15;
   
    strokeStartAnimation.removedOnCompletion = clockwise;
    strokeStartAnimation.fillMode =kCAFillModeForwards;
    /*
    fromValue = 0，toValue = 1 不一定是0到1 也可以是1-0 也可以是其他 自行实验
    就是从开始位置（fromValue）0 一直清除到toValue（1） 效果就是一条路径慢慢的消失
     */
    strokeStartAnimation.fromValue = @0;
    strokeStartAnimation.toValue = @(1-(s/length));
    strokeStartAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];

    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.animations  = @[strokeEndAnimation,strokeStartAnimation];
    animationGroup.duration = strokeEndAnimation.duration;
    animationGroup.removedOnCompletion = NO;
    animationGroup.fillMode =kCAFillModeForwards;
    
    animationGroup.delegate = self;
    [shapeLayer addAnimation:animationGroup forKey:@"stroke"];
}
///动画完成
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    //    [self setBePath:_selectIndex];
    self.superview.userInteractionEnabled = YES;
    QWTabBarItem *tapItem = (QWTabBarItem *)[self viewWithTag:_selectIndex + ITEMTAG];
    tapItem.isSelect = YES;
    tapItem.titleLab.textColor = _tintColor;
    _tabBarItem = tapItem;
}

//// 对外方法
- (void)setBadge:(NSInteger)count1 index:(NSUInteger)index{
    QWTabBarBadge *badgeLab = [self viewWithTag:BADGETAG + index];
    if(index>_tabBarItems.count){
        NSLog(@"设置角标  下标越界啦");
        return;
    }
    if(!badgeLab){
        badgeLab = [[QWTabBarBadge alloc] init];
        badgeLab.itemCount = _tabBarItems.count;
        badgeLab.tag = BADGETAG + index;
        [self addSubview:badgeLab];
    }
    badgeLab.badge = count1;
}
@end
