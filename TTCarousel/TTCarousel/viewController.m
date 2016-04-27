//
//  viewController.m
//  TTCarousel
//
//  Created by Lavender on 16/4/26.
//  Copyright © 2016年 DirkChen. All rights reserved.
//

#import "viewController.h"
#import "TTCarousel.h"


@interface viewController ()
@property (nonatomic, strong) NSMutableArray *images;
@end
@implementation viewController

- (void)viewDidLoad
{
    TTCarousel *carousel = [[TTCarousel alloc]init];
    [self.view addSubview:carousel];
    
    
}




//模型懒加载
- (NSMutableArray *)images
{
    if (!_images) {
        NSMutableArray *images = @[@"ad_00.png",@"ad_01.png",@"ad_02.png",@"ad_03.png",@"ad_04.png"];
    }
    return _images;
}

@end
