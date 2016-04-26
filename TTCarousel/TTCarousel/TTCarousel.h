//
//  TTCarousel.h
//  TTCarousel
//
//  Created by Lavender on 16/4/26.
//  Copyright © 2016年 DirkChen. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger,ScrollViewDirection)
{   ScrollDirectionHorizontal,
    ScrollDirectionVertical
};
@interface TTCarousel : UIScrollView
@property (nonatomic, strong) NSArray *images;
+ (instancetype)scrollViewWithFrame:(CGRect)frame superView:(UIView *)superView images:(NSArray *)images scrollViewDirection:(ScrollViewDirection)scrollViewDirection;
@end
