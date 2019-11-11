//
//  DrawView2.h
//  CoreGraphics图形库
//
//  Created by 徐金城 on 2019/11/8.
//  Copyright © 2019 xujincheng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DrawView2 : UIView

//进度图
//画的进度图的进度,进度值在 [0,1]
@property (nonatomic,assign) float pregress;//进度

//饼状图
// 数据里只能放int @[@20,@30,@20,@30]  饼的个数
@property (nonatomic,strong)NSArray   *sections;
//指定不同section的饼状颜色             饼的颜色
@property (nonatomic,strong)NSArray   *sectionColors;

@end

NS_ASSUME_NONNULL_END
