//
//  DrawView3.m
//  CoreGraphics图形库
//
//  Created by 徐金城 on 2019/11/11.
//  Copyright © 2019 xujincheng. All rights reserved.
//

#import "DrawView3.h"

@implementation DrawView3

- (void)drawRect:(CGRect)rect {
    [self drawYellowPerson:rect];
}

//画小黄人
-(void)drawYellowPerson:(CGRect)rect
{
    // 先获取图片上下文对象
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 设置头及颜色
    [self setHeaderWithCGContextRef:ctx andRect:rect];
    [self setMouthWith:ctx andRect:rect];
    [self setGlassesWith:ctx andRect:rect];
    [self setHairWith:ctx andRect:rect];

}
/**
 *   画嘴
 */
-(void)setMouthWith:(CGContextRef)ctx andRect:(CGRect)rect
{
    // 设置中间点
    CGFloat CenterX = rect.size.width * 0.5;
    CGFloat CenterY = rect.size.width * 0.5;
    
    // 设置当前点
    CGFloat marginX = 30;
    CGFloat marginY = 20;
    CGFloat currenX = CenterX - marginX;
    CGFloat currenY = CenterY - marginY;
    CGContextMoveToPoint(ctx, currenX, currenY);
    
    // 结束点
    CGFloat endX = CenterX + marginX;
    CGFloat endY = currenY;
    // 贝塞尔曲线
    CGContextAddQuadCurveToPoint(ctx, CenterX, CenterY, endX, endY);
    
    // 设置颜色
    [[UIColor blackColor]set];
    // 渲染
    CGContextStrokePath(ctx);
}

// 设置眼镜
-(void)setGlassesWith:(CGContextRef)ctx andRect:(CGRect)rect
{
    CGFloat LineX = rect.size.width * 0.5 - 70;  // 减半径
    CGFloat LineY = 100;
    // 画一条黑线
    CGContextMoveToPoint(ctx,LineX , LineY);
    // 结束点
    CGFloat EndLineX = LineX + 2 * 70;
    CGFloat EndLineY = LineY;
    CGContextAddLineToPoint(ctx,EndLineX, EndLineY);
    CGContextSetLineWidth(ctx, 20);
    [[UIColor blackColor]set];
    CGContextStrokePath(ctx);
    
    // 2.画眼
    // 注释：画眼就是画圆
    CGFloat leftEyesY = LineY;
    CGFloat leftEyesRadius = 30;
    CGFloat leftEyesX = rect.size.width *0.5 - leftEyesRadius;
    CGFloat leftEyesStartAngle = 0;
    CGFloat leftEyesEndAngle = M_PI * 2;
    [[UIColor redColor]set];
    CGContextAddArc(ctx, leftEyesX, leftEyesY, leftEyesRadius, leftEyesStartAngle, leftEyesEndAngle, 0);
    CGContextFillPath(ctx);
    
    CGFloat rightEyesX = leftEyesX + leftEyesRadius * 2;
    CGFloat rightEyesY = leftEyesY;
    CGFloat rightEyesSstartAngle = 0;
    CGFloat rightEyesRadius = leftEyesRadius;
    CGFloat rightEyesEndAngle = leftEyesEndAngle;
    CGContextAddArc(ctx, rightEyesX, rightEyesY, rightEyesRadius, rightEyesSstartAngle, rightEyesEndAngle, 0);
    [[UIColor redColor]set];
    CGContextFillPath(ctx);
    
    // 镜片
    CGFloat leftGlassesRadius = 20;
    CGFloat leftGlassesX = leftEyesX;
    CGFloat leftGlassesY = LineY;
    CGContextAddArc(ctx, leftGlassesX, leftGlassesY, leftGlassesRadius, 0, M_PI * 2, 0);
    
    CGFloat rightGlassesRadius = leftGlassesRadius;
    CGFloat rightGlassesX = rightEyesX;
    CGFloat rightGlassesY = LineY;
    CGContextAddArc(ctx, rightGlassesX, rightGlassesY, rightGlassesRadius,0, M_PI * 2 , 0);
    [[UIColor whiteColor]set];
    CGContextFillPath(ctx);
    
    // 眼睛珠
    CGFloat leftZhuRadius = 10;
    CGFloat leftZhuY = LineY;
    CGFloat leftZhuX = leftGlassesX +5;
    CGContextAddArc(ctx, leftZhuX, leftZhuY, leftZhuRadius, 0, M_PI * 2, 0);
    
    
    CGFloat rightZhuRadius = leftZhuRadius;
    CGFloat rightZhuY = LineY;
    CGFloat rightZhuX = rightGlassesX - 5;
    CGContextAddArc(ctx, rightZhuX, rightZhuY, rightZhuRadius, 0, M_PI * 2, 0);
    
    [[UIColor colorWithRed:89/255.0 green:19/255.0 blue:13/255.0 alpha:1]set];
    CGContextFillPath(ctx);
    
    // 左瞳孔
    CGFloat  leftTongRadius = 5;
    CGFloat  leftTongY = leftZhuY;
    CGFloat  leftTontX = leftZhuX;
    CGContextAddArc(ctx, leftTontX, leftTongY, leftTongRadius, 0, M_PI * 2, 0);
    
    // 右瞳孔
    CGFloat rightTongRadius = leftTongRadius;
    CGFloat rightTongX = rightZhuX;
    CGFloat rightTongY = rightZhuY;
    CGContextAddArc(ctx, rightTongX, rightTongY, rightTongRadius, 0, M_PI *2, 0);
    [[UIColor colorWithRed:42/255.0 green:6/255.0 blue:2/255.0 alpha:1]set];
    CGContextFillPath(ctx);
    
    // 左聚光
    CGFloat leftJuRadius = 3;
    CGFloat leftJuX = leftTontX - 3;
    CGFloat leftJuY =leftTongY - 3;
    CGContextAddArc(ctx, leftJuX, leftJuY, leftJuRadius, 0, M_PI * 2, 0);
    
    
    // 右聚光
    CGFloat rightJuRadius = leftJuRadius;
    CGFloat rightJuX = rightTongX - 3;
    CGFloat rightJuY = rightTongY - 3;
    CGContextAddArc(ctx, rightJuX, rightJuY, rightJuRadius, 0, M_PI *2, 0);
    [[UIColor whiteColor]set];
    CGContextFillPath(ctx);
}

-(void)setHeaderWithCGContextRef:(CGContextRef)ctx andRect:(CGRect)rect
{
    // 画图片
    CGFloat topX = rect.size.width * 0.5; // 确定x 轴的点
    CGFloat topY = 100;
    CGFloat topRadius = 70; // 半径
    CGFloat topStartAngle = 0; // 起点
    CGFloat topEndAngle = M_PI;
    // 0 是顺时针  1 是逆时针
    CGContextAddArc(ctx, topX, topY, topRadius, topStartAngle, topEndAngle, 1);
    // 以上一个终点为起点画直线
    CGFloat leftLineX = topX - topRadius;
    CGFloat leftLineY = topY + 100;
    CGContextAddLineToPoint(ctx, leftLineX, leftLineY);
    
    CGFloat downX = topX;
    CGFloat downY = leftLineY;
    CGContextAddArc(ctx, downX, downY, topRadius,topEndAngle , topStartAngle, 1);
    // 关闭路径
    CGContextClosePath(ctx);
    // 填充背景颜色
    [[UIColor yellowColor]set];
    //显示在view
    CGContextFillPath(ctx);
}
/**
 *  设置头发
 *
 */
- (void)setHairWith:(CGContextRef)ctx andRect:(CGRect)rect
{
    // 第一根头发
    CGFloat hairStartX = rect.size.width *0.5;
    CGFloat hairStartY = 2;
    CGContextMoveToPoint(ctx, hairStartX, hairStartY);
    CGFloat hairEndX = rect.size.width * 0.5 + 2;
    CGFloat hairEndY = 30;
    CGContextAddLineToPoint(ctx, hairEndX, hairEndY);
    
    // 第二根头发
    CGFloat hairTwoStartX = rect.size.width * 0.5 + 20;
    CGFloat hairTwoStartY = 2;
    CGContextMoveToPoint(ctx, hairTwoStartX, hairTwoStartY);
    CGFloat hairTowEndX = rect.size.width * 0.5 + 10;
    CGFloat hairTowEndY = 30;
    CGContextAddLineToPoint(ctx, hairTowEndX, hairTowEndY);
    
    // 第三根头发
    CGFloat hairThreeStartX = rect.size.width * 0.5 - 20;
    CGFloat hairThreeStartY = 2;
    CGContextMoveToPoint(ctx, hairThreeStartX, hairThreeStartY);
    CGFloat hairThreeEndX = rect.size.width * 0.5 - 10;
    CGFloat hairThreeEndY = 33;
    CGContextAddLineToPoint(ctx, hairThreeEndX, hairThreeEndY);
    // 第四个头发
    CGFloat hairFourStartX = rect.size.width * 0.5 - 50;
    CGFloat hairFourStartY = 2;
    CGContextMoveToPoint(ctx, hairFourStartX, hairFourStartY);
    CGFloat hairFourEndX = rect.size.width *0.5 - 35;
    CGFloat hairFourEndY = 40;
    CGContextAddLineToPoint(ctx, hairFourEndX, hairFourEndY);
    
    // 第五根头发
    CGFloat hairFiveStartX = rect.size.width * 0.5 + 50;
    CGFloat hairFiveStartY = 2;
    CGContextMoveToPoint(ctx, hairFiveStartX, hairFiveStartY);
    CGFloat hairFiveEndX = rect.size.width * 0.5 + 35;
    CGFloat hairFiveEndY = 40;
    CGContextAddLineToPoint(ctx, hairFiveEndX, hairFiveEndY);
    
    [[UIColor blackColor]set];
    CGContextSetLineWidth(ctx, 1);
    CGContextStrokePath(ctx);
}



@end
