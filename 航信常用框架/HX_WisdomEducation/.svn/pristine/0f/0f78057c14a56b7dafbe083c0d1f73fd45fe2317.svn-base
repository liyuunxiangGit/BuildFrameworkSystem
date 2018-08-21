//
//  LQScrollView.m
//  CycleScrollView
//
//  Created by liuqiang on 15/10/12.
//  Copyright © 2015年 liuqiang. All rights reserved.
//

#import "LQScrollView.h"
#import "UIView+SDExtension.h"
#import "TAPageControl.h"

#import "UIImageView+WebCache.h"

@interface LQScrollView()
{
    UILabel *_title; //标题
}
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) NSInteger totalItemsCount;
@property (nonatomic, weak) TAPageControl *pageControl;

@end
static float LHeight;
@implementation LQScrollView
- (id)initWithFrame:(CGRect)frame images:(NSArray *)images titles:(NSArray *)titles isWebImageType:(BOOL)bo
{
    self = [super initWithFrame:frame];
    if (self) {
        self.pageControlAliment = LQScrollViewPageContolAlimentRight;
        _autoScrollTimeInterval = 3;
        NSMutableArray *array = [NSMutableArray arrayWithArray:images];
//        [array insertObject:images[images.count-1] atIndex:0];
        [array addObject:images[0]];
        _imagesGroup = array;
        _totalItemsCount = 1;//array.count-2;
        
        self.titlesGroup = titles;
        self.imageResourceType = bo;
        [self SetupMainView];
//        [self setupPageControl];
//        [self setupsTimer];
    }
    return self;
}
//本地
+ (instancetype)cycleScrollViewWithFrame:(CGRect)frame imagesGroup:(NSArray *)imagesGroup titles:(NSArray *)titles isWebImageType:(BOOL)bo;
{
    LQScrollView *scrollView = [[self alloc] initWithFrame:frame images:imagesGroup titles:titles isWebImageType:bo];
    return scrollView;
}
- (void)SetupMainView
{
    LHeight = self.frame.size.height;
    UIScrollView *sc = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, w, LHeight)];
    sc.backgroundColor = [UIColor whiteColor];
    [sc setPagingEnabled:YES];
    [sc setShowsHorizontalScrollIndicator:NO];
    [sc setShowsVerticalScrollIndicator:NO];
    sc.delegate = self;
    [self addSubview:sc];
    _scrollView = sc;
    
    //加载新的图片
    for (int i =0; i<[self.imagesGroup count]; i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(i*_scrollView.frame.size.width, 0, _scrollView.frame.size.width, LHeight)];
        if (!self.imageResourceType) {
            [imageView setImage:[UIImage imageNamed:self.imagesGroup[i]]];
        }else{
            //imageView.backgroundColor = [UIColor grayColor];
//            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            });
            [imageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",self.imagesGroup[i]]] placeholderImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",@"placeholder@2x"]]];
            
        }
        [_scrollView addSubview:imageView];
        [imageView setUserInteractionEnabled:YES];
        [imageView setTag:i+100];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick:)];
        [imageView addGestureRecognizer:tap];
    }//w
    [_scrollView setContentSize:CGSizeMake(1*[self.imagesGroup count], LHeight)];
    //设置scrollView的偏移量
    [_scrollView setContentOffset:CGPointMake(self.sd_width, 0)];
    _pageControl.currentPage = 0;
    
    
    //底部模糊背景
//    _title = [[UILabel alloc] initWithFrame:CGRectMake(0, self.sd_height - 30, self.sd_width, 30)];
//    _title.font = [UIFont systemFontOfSize:14];
//    _title.backgroundColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:0.5];
//    _title.textAlignment = NSTextAlignmentLeft;
//    _title.textColor = [UIColor blackColor] ;
//    if ([self.titlesGroup count] != 0) {//如果传入了标题数组
//        [_title setText:[NSString stringWithFormat:@"   %@",self.titlesGroup[0]]];
//    }
//    [self addSubview:_title];
}
- (void)tapClick:(UITapGestureRecognizer *)tap
{
    int a = (int)tap.view.tag;
    if ([self.delegate respondsToSelector:@selector(cycleScrollView:didSelectItemAtIndex:)]) {
        [self.delegate cycleScrollView:self didSelectItemAtIndex:a];
    }
    
}


//小圆点
- (void)setupPageControl
{
    TAPageControl *pageControl = [[TAPageControl alloc] init];
    pageControl.numberOfPages = self.imagesGroup.count-2;
    [self addSubview:pageControl];
    _pageControl = pageControl;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    CGSize size = [_pageControl sizeForNumberOfPages:self.totalItemsCount];
    CGFloat x = (self.sd_width - size.width) * 0.5;
    if (self.pageControlAliment == LQScrollViewPageContolAlimentRight) {
        x = self.sd_width - size.width - 10;
    }
    CGFloat y = self.sd_height - size.height - 10;
    _pageControl.frame = CGRectMake(x, y, size.width, size.height);
    [_pageControl sizeToFit];
    
}
//定时器
- (void)setAutoScrollTimeInterval:(CGFloat)autoScrollTimeInterval
{
//    _autoScrollTimeInterval = autoScrollTimeInterval;
//
//    [_timer invalidate];
//    _timer = nil;
//    [self setupsTimer];
}
- (void)setupsTimer
{
//    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:self.autoScrollTimeInterval target:self selector:@selector(automaticScrolls) userInfo:nil repeats:YES];
//    _timer = timer;
//    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}
- (void)automaticScrolls
{
//    if (_scrollView.contentOffset.x == self.sd_width*(_pageControl.currentPage+1)) {
//        [UIView animateWithDuration:0.6 animations:^{
//            int dex = (_scrollView.contentOffset.x+self.sd_width)/self.sd_width-1;
//            _pageControl.currentPage = dex%self.totalItemsCount;
//            _scrollView.contentOffset = CGPointMake(_scrollView.contentOffset.x+self.sd_width, 0);
//            if ([self.titlesGroup count] != 0) {//如果传入了标题数组
//                [_title setText:[NSString stringWithFormat:@"   %@",self.titlesGroup[_pageControl.currentPage]]];
//            }
//        } completion:^(BOOL finished) {
//            if (_scrollView.contentOffset.x == self.sd_width*([self.imagesGroup count]-1)){
//                [_scrollView setContentOffset:CGPointMake(self.sd_width, 0)];//因为前面隐藏了一张图,所以是WIDTH开始的
//
//                [_pageControl setCurrentPage:0];
//                if ([self.titlesGroup count] != 0) {//如果传入了标题数组
//                    [_title setText:[NSString stringWithFormat:@"   %@",self.titlesGroup[_pageControl.currentPage]]];
//                }
//            }
//
//        }];
//    }
    
}
#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //计算当前页
//    int dex = (scrollView.contentOffset.x+0.5*self.sd_width)/self.sd_width-1;
//    _pageControl.currentPage = dex%self.totalItemsCount;
//
//    //显示当前页标题
//    if ([self.titlesGroup count] != 0) {//如果传入了标题数组
//        [_title setText:[NSString stringWithFormat:@"   %@",self.titlesGroup[_pageControl.currentPage]]];
//    }
//
//    if (_scrollView.contentOffset.x == self.sd_width*([self.imagesGroup count]-1)) {//往后翻
//        [UIView animateWithDuration:0.4 animations:^{
//            //实现动画效果,当第四页往后翻,要设置回到第一页.
//        } completion:^(BOOL finished) {
//            [_scrollView setContentOffset:CGPointMake(self.sd_width, 0)];//因为前面隐藏了一张图,所以是WIDTH开始的
//            _pageControl.currentPage = 0;
//            if ([self.titlesGroup count] != 0) {//如果传入了标题数组
//                [_title setText:[NSString stringWithFormat:@"   %@",self.titlesGroup[_pageControl.currentPage]]];
//            }
//        }];
//    }
//    if (_scrollView.contentOffset.x == 0) {//往前翻
//        [UIView animateWithDuration:0.4 animations:^{
//            //实现动画效果
//        } completion:^(BOOL finished) {
//            _scrollView.contentOffset = CGPointMake(self.sd_width*([self.imagesGroup count]-2), 0);//最后面还隐藏了一张图
//            [_pageControl setCurrentPage:self.totalItemsCount-1];
//            if ([self.titlesGroup count] != 0) {//如果传入了标题数组
//                [_title setText:[NSString stringWithFormat:@"   %@",self.titlesGroup[_pageControl.currentPage]]];
//
//            }
//
//        }];
//    }
    
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
//    [_timer invalidate];
//    _timer = nil;
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
//    [self setupsTimer];
}

@end
