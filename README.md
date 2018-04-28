# QWTabBar
# 参考 [(BATabBarController)](https://github.com/antiguab/BATabBarController)
￼
![TabBar.gif](https://upload-images.jianshu.io/upload_images/2342189-670c46912b066016.gif?imageMogr2/auto-orient/strip)


tabbar
@property (nonatomic, readonly, strong) NSMutableArray <QWTabBarItem *> *tabBarItems;

标题
@property (nonatomic, copy) NSArray <NSString *> *titles;

默认图标 UIImage 类型 或者 NSString 类型
@property (nonatomic, strong) NSArray *itemImages;

选中图标 UIImage 类型 或者 NSString 类型
@property (nonatomic, strong) NSArray *selectItemImages;

 默认标题颜色
@property (nonatomic, strong) UIColor *defColor;

 选中标题颜色
@property (nonatomic, strong) UIColor *tintColor;

当前选中的下标
@property (nonatomic, assign) NSInteger selectIndex;

当前选中的 TabBar
@property (nonatomic, strong) QWTabBarItem *tabBarItem;

@property (nonatomic, weak) id <QWTabBarDelegate>delegate;
 
  创建方法
 >  - (instancetype)initWithTitles:(NSArray <NSString *> *)titles itemImages:(NSArray *)itemImgs selectImages:(NSArray *)selectImages;
 
 设置角标
 > - (void)setBadge:(NSInteger)count index:(NSUInteger)index;
