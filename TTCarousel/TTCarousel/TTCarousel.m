//
//  TTCarousel.m
//  TTCarousel
//
//  Created by Lavender on 16/4/26.
//  Copyright © 2016年 DirkChen. All rights reserved.
//

#import "TTCarousel.h"

@interface TTCarousel ()
/**
 *   轮播器
 */
@property (nonatomic, weak) UIScrollView *scrollView;
/**
 *   定时器
 */
@property (nonatomic, weak) NSTimer *timer;


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
        
#warning      父视图添加轮播器界面
        [super addSubview:self];
        
    }
    return self;
}

//设置数据



@end
