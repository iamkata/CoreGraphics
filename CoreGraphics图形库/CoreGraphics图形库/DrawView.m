//
//  DrawView.m
//  CoreGraphics图形库
//
//  Created by 徐金城 on 2019/11/8.
//  Copyright © 2019 xujincheng. All rights reserved.
//

#import "DrawView.h"

@implementation DrawView


- (void)drawRect:(CGRect)rect {
    
    [self drawLine]; //直线
    //[self drawTriangle]; //三角形
    //[self drawRectangle]; //矩形
    //[self drawSector]; //扇形
    //[self drawArc]; //弧
    //[self drawCircle]; //圆
}


#pragma mark 画线
- (void)drawLine {
    //获取上下文 上下文的输出目标就是self.layer
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // 设置线颜色
    CGContextSetRGBStrokeColor(context, 1.0, 0.0, 0.0, 1);
    
    // 设置线宽
    CGContextSetLineWidth(context, 13);
    
    // 设置线条终点形状
    CGContextSetLineCap(context, kCGLineCapButt);
    
    // 设置连接点的样式    连点是圆角
    CGContextSetLineJoin(context, kCGLineJoinRound);
    
    //设置起点
    CGContextMoveToPoint(context, 100, 100);
    //设置连线一个点
    CGContextAddLineToPoint(context, 130, 200);
    //设置连线另一个点
    CGContextAddLineToPoint(context, 210, 210);
    
    //画到view [渲染]
    CGContextStrokePath(context);
}

#pragma mark 画三角形
-(void)drawTriangle{
    //获取上下文 上下文的输出目标就是self.layer
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // 设置线颜色
    CGContextSetRGBStrokeColor(context, 1.0, 0.0, 0.0, 1);
    
    //设置起点
    CGContextMoveToPoint(context, 110, 110);
    
    //设置另外三个点
    CGContextAddLineToPoint(context, 210, 110);
    CGContextAddLineToPoint(context, 210, 210);
    //CGContextAddLineToPoint(context, 10, 10);
    //关闭路径后只需画两个点
    CGContextClosePath(context);
    
    // 渲染
    CGContextStrokePath(context);
}

#pragma mark 画矩形
-(void)drawRectangle{
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // 设置线颜色
    CGContextSetRGBStrokeColor(context, 1.0, 0.0, 0.0, 1);
    
    // 设置线宽
    //CGContextSetLineWidth(context, 13);
    
    //画一个矩形
    // ＝＝＝＝＝＝＝第一方法＝＝＝＝＝＝＝＝＝＝＝＝
    //    //设置一起点
    //    CGContextMoveToPoint(context, 10, 10);
    //    //设置另外三个点
    //
    //    CGContextAddLineToPoint(context, 110, 10);
    //    CGContextAddLineToPoint(context, 110, 110);
    //    CGContextAddLineToPoint(context, 10, 110);
    //    CGContextAddLineToPoint(context, 10, 10);
    
    // ＝＝＝＝＝＝＝第二方法＝＝＝＝＝＝＝＝＝＝＝＝
    CGContextAddRect(context, CGRectMake(10, 10, 100, 100));
    
    //画到view [渲染]
    
    //只是画一条，【矩形内部是空心】
    //CGContextStrokePath(context);
    
    //填充 【矩形内部是实心】
    CGContextFillPath(context);
}

#pragma mark 画扇形
-(void)drawSector{
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //设置一个起点
    CGContextMoveToPoint(context, 100, 100);
    
    /**
     *x,y 圆心
     *radius 半径
     *startAngle 画弧的起始位置
     *endAngel 画弧的结束位置
     * clockwise 0 顺针 1 逆时针
     */
    CGContextAddArc(context, 100, 100, 60, - M_PI_4, - 3 * M_PI_4, 1);
    
    CGContextClosePath(context);
    
    CGContextStrokePath(context);//空心
    //CGContextFillPath(context);//实心
}

#pragma mark 画弧
-(void)drawArc{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    /**
     *x,y 圆心
     *radius 半径
     *startAngle 画弧的起始位置
     *endAngel 画弧的结束位置
     * clockwise 0 顺针 1 逆时针
     */
    CGContextAddArc(context, 100, 100, 60, 0, M_PI, 1);
    
    CGContextClosePath(context);
    
    //渲染
    CGContextStrokePath(context);
    //CGContextFillPath(context);
}


#pragma mark 画圆
-(void)drawCircle{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    /**
     *x,y 圆心
     *width 水平宽
     *height 垂直高
     */
    //画圈
    CGContextAddEllipseInRect(context, CGRectMake(10, 10, 100, 200));
    
    //渲染
    CGContextStrokePath(context);
}

@end
