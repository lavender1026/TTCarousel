//
//  viewController.m
//  TTCarousel
//
//  Created by Lavender on 16/4/26.
//  Copyright © 2016年 DirkChen. All rights reserved.
//

#import "viewController.h"
#import "TTCarousel.h"
@implementation viewController

- (void)viewDidLoad
{
    TTCarousel *carousel = [[TTCarousel alloc]initWithFrame:CGRectMake(0, 40, 375, 80)];
    
    [self.view addSubview:carousel];
}




//模型懒加载
- (NSArray *)images
{
    if (!_images) {
        NSArray *images = @[@"ad_00",@"ad_01",@"ad_02",@"ad_03",@"ad_04"];
    }
    return _images;
}

@end
