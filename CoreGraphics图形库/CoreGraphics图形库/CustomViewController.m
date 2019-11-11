//
//  CustomViewController.m
//  CoreGraphics图形库
//
//  Created by 徐金城 on 2019/11/11.
//  Copyright © 2019 xujincheng. All rights reserved.
//

#import "CustomViewController.h"
#import "DrawView.h"
#import "DrawView2.h"
#import "DrawView3.h"
#import "BallonView.h"
#import "XUImageView.h"

@interface CustomViewController ()

@end

@implementation CustomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"画图自定义View";
    
    //绘制几何图形
    //    DrawView *view = [[DrawView alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    //    view.backgroundColor = [UIColor yellowColor];
    //    [self.view addSubview:view];
    
    
    //绘制图片,文字,进度条,饼形图
    //    DrawView2 *view2 = [[DrawView2 alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    //    //view2.backgroundColor = [UIColor yellowColor];
    //    view2.backgroundColor = [UIColor whiteColor];
    //    view2.pregress = 0.7;
    //    view2.sections = @[@20,@30,@20,@30];
    //    view2.sectionColors = [self getColors];
    //    [self.view addSubview:view2];
    
    
    //小黄人
//    DrawView3 *view3 = [[DrawView3 alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
//    //view2.backgroundColor = [UIColor yellowColor];
//    view3.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:view3];
    
    //气球上升View
    BallonView *view3 = [[BallonView alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    view3.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view3];
    
    
    //模仿系统的UIImageView
    XUImageView *imageV = [[XUImageView alloc] initWithFrame:CGRectMake(50, 100, 300, 300)];
    imageV.image = [UIImage imageNamed:@"sandyBalloon"];
    [self.view addSubview:imageV];
}

- (NSArray *)getColors {
    UIColor *color1 = [UIColor redColor];
    UIColor *color2 = [UIColor yellowColor];
    UIColor *color3 = [UIColor orangeColor];
    UIColor *color4 = [UIColor blueColor];
    return @[color1,color2,color3,color4];
}

@end
