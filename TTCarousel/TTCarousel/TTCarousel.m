//
//  TTCarousel.m
//  TTCarousel
//
//  Created by Lavender on 16/4/26.
//  Copyright © 2016年 DirkChen. All rights reserved.
//

#import "TTCarousel.h"

static int const ImageCount = 3;
@interface TTCarousel ()
/**
 *   轮播器
 */
@property (nonatomic, weak) UIScrollView *scrollView;
/**
 *   定时器
 */
@property (nonatomic, weak) NSTimer *timer;
/**
 *   页码
 */
@property (nonatomic, assign) NSInteger imageIndex;
@end
@implementation TTCarousel

/**
 *   需要定时器 模型数组
 */



//MARK:  初始化
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIScrollView *scrollView = [[UIScrollView alloc]init];
        self.scrollView = scrollView;
        //        禁止设置回弹
        scrollView.bounces = NO;
//        for循环创建5个视图加载到scrollView中
        for (NSInteger i = 0; i < ImageCount; ++i) {
            UIImageView *iconView = [[UIImageView alloc]init];
            [scrollView addSubview:iconView];
        }
#warning      父视图添加轮播器界面
        [super addSubview:self];
        
    }
    return self;
}
//MARK:布局子控件
- (void)layoutSubviews
{
    self.scrollView.frame = CGRectMake(0, 50, 375, 200);
    if (self.scrollViewDirection == ScrollDirectionHorizontal) {
        self.scrollView.contentSize = CGSizeMake(ImageCount*self.bounds.size.width, 0);
    }
    else{
        self.scrollView.contentSize = CGSizeMake(0, ImageCount*self.bounds.size.height);
    }
    for (NSInteger i = 0; i < ImageCount; ++i) {
        UIImageView *iconView =self.scrollView.subviews[i];
        if (self.scrollViewDirection == ScrollDirectionHorizontal) {
            iconView.frame = CGRectMake(i*self.scrollView.frame.size.width, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
        }
    else
    {
     iconView.frame = CGRectMake(0, i * self.scrollView.frame.size.height, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
    }
    }
    [self updateImage];
}
//MARK:设置图片内容
- (void)updateImage
{
    // 设置图片
    for (int i = 0; i < self.scrollView.subviews.count; i++) {
        
        NSInteger pageIndex = self.imageIndex;
        // 遍历每一个imageView
        UIImageView * imageView = self.scrollView.subviews[i];
        
        if (i == 0) {
            pageIndex--;
        } else if (i == 2) {
            pageIndex++;
        }
        
        if (pageIndex < 0) {
            pageIndex = self.images.count - 1;
        } else if (pageIndex >= self.images.count) {
            pageIndex = 0;
        }
        // 图片角标 赋值给 imageView的tag
        imageView.tag = pageIndex;
        imageView.image = self.images[imageView.tag];
    }
    
    // 设置偏移量在中间 // 不能使用带动画 contentOffset
    if (self.scrollViewDirection == ScrollDirectionVertical) {
        self.scrollView.contentOffset = CGPointMake(0, self.scrollView.bounds.size.height);
    } else {
        self.scrollView.contentOffset = CGPointMake(self.scrollView.bounds.size.width, 0);
    }
    
}
//MARK:定时器
- (void)startTimer
{
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}
- (void)endTimer
{
    [self.timer invalidate];
//    停止了记得置为nil，这样安全
    self.timer = nil;
}
- (void)nextImage
{
    
}
//MARK： 设置数据

//MARK： 调用方法
+(instancetype)scrollViewWithFrame:(CGRect)frame superView:(UIView *)superView images:(NSMutableArray *)images scrollViewDirection:(ScrollViewDirection)scrollViewDirection
{
    return self;
}
@end
