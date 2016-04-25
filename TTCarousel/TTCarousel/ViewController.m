//
//  ViewController.m
//  图片轮播器手动版
//
//  Created by Lavender on 16/3/18.
//  Copyright © 2016年 lavender. All rights reserved.
//

#import "ViewController.h"
#import "TTImageCell.h"
@interface ViewController ()
@property(nonatomic,strong) NSArray *images;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSLog(@"%@",self.images);
}

#pragma mark 数据源方法
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 3;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.images.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
//    创建cell
    TTImageCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"image" forIndexPath:indexPath];
//    赋值cell
    NSInteger index=
    cell.image=[UIImage imageWithContentsOfFile:self.images[index]];
//    返回cell
    return cell;
}





#pragma mark 加载图片

-(NSArray *)images
{
    if (_images==nil) {
        NSMutableArray *arrM=[NSMutableArray arrayWithCapacity:9];
        for (int i=0; i<9; i++) {
            NSString *imageName=[NSString stringWithFormat:@"%zd.jpg",i];
            NSString *imagePath=[[NSBundle mainBundle]pathForResource:imageName ofType:nil];
            [arrM addObject:imagePath];
        }
        _images=arrM;
    }
    return _images;
}

@end
