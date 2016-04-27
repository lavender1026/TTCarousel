//
//  viewController.m
//  TTCarousel
//
//  Created by Lavender on 16/4/26.
//  Copyright © 2016年 DirkChen. All rights reserved.
//

#import "viewController.h"

#define ImageCount 5

@interface viewController ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *carousel;
/**
 *   分页指示器
 */
@property (nonatomic, strong) UIPageControl *pageControl;
@end
@implementation viewController

- (void)viewDidLoad
{
    
    UIScrollView *carousel = [[UIScrollView alloc]initWithFrame:CGRectMake(20, 30, 335, 161)];
    carousel.backgroundColor = [UIColor redColor];
    // 定义图片的尺寸
    _carousel = carousel;
    CGFloat imageViewW = carousel.bounds.size.width;
    CGFloat imageViewH = carousel.bounds.size.height;
    CGFloat imageViewY = 0;
    // 循环来创建和添加scrollView中的5个图片
    for (NSInteger i = 0; i < ImageCount; i++) {
        // 1.创建UIImageView
        UIImageView *imageView = [[UIImageView alloc] init];
       
        // 2.设置frame
        CGFloat imageViewX = imageViewW * i;
        imageView.frame = CGRectMake(imageViewX, imageViewY, imageViewW, imageViewH);
        
        // 3.设置图片
        // 拼接图片的名称
        NSString *imageName = [NSString stringWithFormat:@"ad_%02zd", i];
        imageView.image = [UIImage imageNamed:imageName];
        // 4.添加到scrollView中
        [self.carousel addSubview:imageView];
    }
    
    // 要想让scrollView中的内容进行滚动要设置它的cotentSize
    carousel.contentSize = CGSizeMake(imageViewW * ImageCount, 0);
    
    // 隐藏水平方向的滚动条
    carousel.showsHorizontalScrollIndicator = NO;
    carousel.showsVerticalScrollIndicator = NO;
    
    // 设置分页效果
    carousel.pagingEnabled = YES;
    
    // 设置分页指示器
    
    UIPageControl *pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(270, 170, 50, 20)];
    
    // 设置总页数
    pageControl.numberOfPages = ImageCount;
    // 设置默认的当前是第几页
    pageControl.currentPage = 0;
    // 设置其它页的颜色
    pageControl.pageIndicatorTintColor = [UIColor purpleColor];
    // 设置当前页的颜色
    pageControl.currentPageIndicatorTintColor = [UIColor orangeColor];
    _pageControl = pageControl;
    
    // 设置代理
    carousel.delegate = self;
    
    // 关闭弹簧效果
    carousel.bounces = NO;
    
    [self.view addSubview:carousel];
    [self.view addSubview:pageControl];
    
}


#pragma mark - scrollView的代理方法
// 只要在滚动中都会一直调用
- (void)scrollViewDidScroll:(UIScrollView *)carousel {
    NSLog(@"%@", NSStringFromCGPoint(carousel.contentOffset));
    CGFloat scrollViewW = carousel.bounds.size.width;
    // 计算当前滚动第几页 scrollView内容水平方法滚动的距离Offset.x / scrollView得宽
    NSInteger page = (carousel.contentOffset.x + scrollViewW * 0.5) / scrollViewW;
    // 设置分页指示器当前页
    self.pageControl.currentPage = page;
}


//模型懒加载
//- (NSMutableArray *)images
//{
//    if (!_images) {
//        NSMutableArray *images = @[@"ad_00.png",@"ad_01.png",@"ad_02.png",@"ad_03.png",@"ad_04.png"];
//    }
//    return _images;
//}

@end
