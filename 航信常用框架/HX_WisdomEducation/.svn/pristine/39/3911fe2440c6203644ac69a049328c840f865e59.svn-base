//
//  CZSegmentViewController.m
//  fullScreenScroll
//
//  Created by qcm on 17/2/10.
//  Copyright © 2017年 muchangqing. All rights reserved.
//

#import "CZSegmentViewController.h"
#import "HMSegmentedControl.h"

#define KTOP_HEIGHT 60.0

@interface CZSegmentViewController ()<UIPageViewControllerDelegate, UIPageViewControllerDataSource, UIScrollViewDelegate>

/** pageView */
@property (strong, nonatomic) UIPageViewController *pageViewController;
/** 顶部分类 */
@property (strong, nonatomic) UIScrollView * scrollView;
/** 页面指示器 */
@property (strong, nonatomic) HMSegmentedControl *segmentControl;
/** 缓存控制器 */
@property (nonatomic, strong) NSMutableDictionary<NSNumber *, UIViewController *> *cacheDictionaty;

@property (nonatomic, assign) NSInteger lastSegmentIndex;

@end

@implementation CZSegmentViewController
{
        //是否用户点击
        BOOL _isDragging;
}

#pragma mark - life cycle
- (void)loadView
{
        [super loadView];
        [self addChildViewController:self.pageViewController];
        [self.pageViewController didMoveToParentViewController:self];
        [self.view addSubview:self.pageViewController.view];
        [self.view addSubview:self.segmentControl];
}

- (void)viewDidLoad
{
        [super viewDidLoad];
        self.automaticallyAdjustsScrollViewInsets = NO;
        self.lastSegmentIndex = -1;
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewDidLayoutSubviews
{
        [super viewDidLayoutSubviews];
        self.segmentControl.frame = CGRectMake(AdaptedWidth(80),
                                               0,
                                               self.view.width-AdaptedWidth(160),
                                               60);
        
        CGFloat topHeight = CGRectGetMaxY(self.segmentControl.frame);
        self.pageViewController.view.frame = CGRectMake(0,
                                                        topHeight,
                                                        self.view.width,
                                                        self.view.height - topHeight);
}

- (void)didReceiveMemoryWarning
{
        [super didReceiveMemoryWarning];
}

#pragma mark - Setter
- (void)setTitles:(NSArray<NSString *> *)titles
{
        _titles = titles;
        self.segmentControl.sectionTitles = titles;
}

- (void)reloadDataOfSegment
{
        self.segmentControl.selectedSegmentIndex = self.currentIndex;
        [self resetControllerWithIndex:self.currentIndex];
}

- (void)resetControllerWithIndex:(NSInteger)index
{
        if (index < 0)
        {
                return;
        }
        
        if (index >= [self countOfContentItems])
        {
                return;
        }
        
        if (index == self.lastSegmentIndex)
        {
                return;
        }
        
        BOOL isForward = self.lastSegmentIndex < index;
        
        UIPageViewControllerNavigationDirection direction = isForward ? UIPageViewControllerNavigationDirectionForward : UIPageViewControllerNavigationDirectionReverse;
        
        UIViewController *showController = [self getCacheControllerAtIndex:index];
        
        if (showController)
        {
                __weak __typeof(self)weakSelf = self;
                [self.pageViewController setViewControllers:@[showController] direction:direction animated:YES completion:^(BOOL finished) {
                        
                        weakSelf.lastSegmentIndex = index;
                }];
        }
}

- (void)setCacheController:(UIViewController *)controller forKey:(NSNumber *)key
{
        if (controller == nil || key == nil)
        {
                return;
        }
        [self.cacheDictionaty setObject:controller forKey:key];
}

- (void)resetSegmentIndex:(UIScrollView *)scrollView
{
        NSInteger index = [self indexOfCacheController:self.pageViewController.viewControllers.firstObject];
        if (self.segmentControl.selectedSegmentIndex == index)
        {
                return;
        }
        [self.segmentControl setSelectedSegmentIndex:index animated:YES];
}

#pragma mark - Getter
- (NSInteger)countOfContentItems
{
        return self.titles.count;
}

- (UIViewController *)getCacheControllerForKey:(NSNumber *)key
{
        return [self.cacheDictionaty objectForKey:key];
}

/** 视图控制器显示的控制器 */
- (UIViewController *)getCacheControllerAtIndex:(NSInteger)index
{
        if (index < 0)
        {
                return nil;
        }
        
        if (index >= [self countOfContentItems])
        {
                return nil;
        }
        
        UIViewController *controller = [self getCacheControllerForKey:@(index)];
        if (controller == nil)
        {
                controller = [self contentControllerAtIndex:index];
                [self setCacheController:controller forKey:@(index)];
        }
        
        [self configController:controller atIndex:index];
        
        return controller;
}

- (NSInteger)indexOfCacheController:(UIViewController *)vc
{
        return [self.cacheDictionaty allKeysForObject:vc].firstObject.integerValue;
}



#pragma mark - UIPageViewControllerDataSource
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
        NSInteger index = [self indexOfCacheController:viewController];
        return [self getCacheControllerAtIndex:(index - 1)];
}

- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
        NSInteger index = [self indexOfCacheController:viewController];
        return [self getCacheControllerAtIndex:(index + 1)];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
        if (scrollView == nil || !_isDragging)
        {
                return;
        }
        [self resetSegmentIndex:scrollView];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
        _isDragging = YES;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
        _isDragging = NO;
}

#pragma mark - lazyMethod
- (UIPageViewController *)pageViewController
{
        if (!_pageViewController)
        {
                _pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:@{UIPageViewControllerOptionInterPageSpacingKey : @0}];
                _pageViewController.delegate = self;
                _pageViewController.dataSource = self;
                [self scrollView];
        }
        return _pageViewController;
}

- (UIScrollView *)scrollView
{
        if (!_scrollView)
        {
                [self.pageViewController.view.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                        
                        if ([obj isKindOfClass:[UIScrollView class]])
                        {
                                _scrollView = (UIScrollView *)obj;
                                _scrollView.delegate = self;
                                *stop = YES;
                        }
                }];
        }
        return _scrollView;
}

- (HMSegmentedControl *)segmentControl
{
        if (!_segmentControl)
        {
                _segmentControl = [[HMSegmentedControl alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, KTOP_HEIGHT)];
                _segmentControl.translatesAutoresizingMaskIntoConstraints = NO;
                _segmentControl.shouldAnimateUserSelection = YES;
                _segmentControl.selectionIndicatorEdgeInsets    = UIEdgeInsetsMake(0, 0, -15, 0);
                _segmentControl.selectionStyle                  = HMSegmentedControlSelectionStyleTextWidthStripe;
                _segmentControl.type                            = HMSegmentedControlTypeText;
                _segmentControl.selectionIndicatorColor = UIColorMainGreenColor;
                _segmentControl.titleTextAttributes = @{
                                                        NSForegroundColorAttributeName : UIColorFromRGB2(102,102,102),
                                                        NSFontAttributeName : [UIFont systemFontOfSize:14.0]
                                                        };
                _segmentControl.selectedTitleTextAttributes = @{
                                                                NSForegroundColorAttributeName : UIColorMainGreenColor,
                                                                NSFontAttributeName : [UIFont systemFontOfSize:14.0],
                                                                };
                _segmentControl.selectionIndicatorLocation      = HMSegmentedControlSelectionIndicatorLocationDown;
                _segmentControl.segmentWidthStyle               = HMSegmentedControlSegmentWidthStyleFixed;
                _segmentControl.selectionIndicatorHeight        = 3.0;
                _segmentControl.backgroundColor                 = [UIColor clearColor];
                _segmentControl.selectionIndicatorColor       = UIColorMainGreenColor;
                _segmentControl.selectedSegmentIndex            = 0;
                __weak typeof(self) weakSelf = self;
                [_segmentControl setIndexChangeBlock:^(NSInteger index) {
                        __strong typeof(self) strongSelf = weakSelf;
                        strongSelf.currentIndex  = index;
                        [strongSelf resetControllerWithIndex:index];
                }];
        }
        return _segmentControl;
}

- (NSMutableDictionary<NSNumber *,UIViewController *> *)cacheDictionaty
{
        if (!_cacheDictionaty)
        {
                _cacheDictionaty = [[NSMutableDictionary alloc] init];
        }
        return _cacheDictionaty;
}

@end
