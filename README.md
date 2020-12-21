
# QWTabBar 目前 支持横竖屏切换
# 参考 [(BATabBarController)](https://github.com/antiguab/BATabBarController)
￼ 支持pod
 > pod 'QWTabBar'
 
 > 当前版本 3.0
 
> 具体使用看dome

![TabBar.gif](https://github.com/qingweiiOS/QWTabBar/blob/master/BrowserPreview_tmp.gif)


tabbar

> @property (nonatomic, readonly, strong) NSMutableArray <QWTabBarItem *> *tabBarItems;

标题

> @property (nonatomic, copy) NSArray <NSString *> *titles;

默认图标 UIImage 类型 或者 NSString 类型

 > @property (nonatomic, strong) NSArray *itemImages;

选中图标 UIImage 类型 或者 NSString 类型

 > @property (nonatomic, strong) NSArray *selectItemImages;

 默认标题颜色
 
 > @property (nonatomic, strong) UIColor *defColor;

 选中标题颜色
 
 > @property (nonatomic, strong) UIColor *tintColor;

当前选中的下标

 > @property (nonatomic, assign) NSInteger selectIndex;

当前选中的 TabBar

 > @property (nonatomic, strong) QWTabBarItem *tabBarItem;

 > @property (nonatomic, weak) id <QWTabBarDelegate>delegate;
 
  创建方法
 >  -(instancetype)initWithTitles:(NSArray <NSString *> *)titles itemImages:(NSArray *)itemImgs selectImages:(NSArray *)selectImages;
 
 设置角标
 > -(void)setBadge:(NSInteger)count index:(NSUInteger)index;
