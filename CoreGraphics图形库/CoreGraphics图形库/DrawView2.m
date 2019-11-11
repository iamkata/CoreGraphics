//
//  DrawView2.m
//  CoreGraphics图形库
//
//  Created by 徐金城 on 2019/11/8.
//  Copyright © 2019 xujincheng. All rights reserved.
//

#import "DrawView2.h"

@implementation DrawView2

- (void)drawRect:(CGRect)rect {
    
    //[self drawImage]; //图片
    //[self drawText]; //文字
    //[self drawProgress:CGRectMake(20, 20, 100, 100)]; //进度图
    //[self drawBing:CGRectMake(50, 50, 100, 100)]; //饼状图
}

//图片
- (void)drawImage {
    //画图片
    UIImage *image = [UIImage imageNamed:@"papa.png"];
    //[image drawAtPoint:CGPointZero];
    //[image drawInRect:CGRectMake(10, 10, 50, 50)];
    
    //平铺
    [image drawAsPatternInRect:CGRectMake(0, 0, 180, 180)];
}

//画文字
- (void)drawText{
    
    NSString  *str = @"哈哈哈哈哈哈啊哈哈哈";
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    //字体大小
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:30];
    //设置颜色
    dict[NSForegroundColorAttributeName] = [UIColor redColor];
    //设置描边
    dict[NSStrokeColorAttributeName] = [UIColor greenColor];
    dict[NSStrokeWidthAttributeName] = @2;
    //设置阴影
    NSShadow *shaw = [[NSShadow alloc] init];
    shaw.shadowColor = [UIColor blueColor];
    //设置阴影的偏移量
    shaw.shadowOffset = CGSizeMake(1, 1);
    shaw.shadowBlurRadius = 2;
    dict[NSShadowAttributeName] = shaw;
    //画文字
    [str drawAtPoint:CGPointZero withAttributes:dict];
    //[str drawInRect:rect withAttributes:dict];
    //用drawInRect:rect会自动换行.用drawAtPoint不会自动换行.
}

//进度图
- (void)drawProgress:(CGRect)rect{
    CGFloat textH = 20;
    CGFloat textW = 30;
    CGFloat viewW = rect.size.width;
    CGFloat viewH = rect.size.height;
    
    CGFloat textX = (viewW - textW) * 0.5;
    CGFloat textY = (viewH - textH) * 0.5;
    
    // 1.画文字
    NSString *text = [NSString stringWithFormat:@"%.2f",self.pregress];
    [text drawInRect:CGRectMake(textX, textY, textW, textH) withAttributes:nil];
    
    
    // 2.画弧
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    //半径
    CGFloat progressRadius = (viewW - 10) * 0.5;
    
    CGFloat endAngle = self.pregress * 2 * M_PI - M_PI_4;
    
    CGContextAddArc(context, viewW * 0.5, viewH * 0.5, progressRadius, - M_PI_4, endAngle, 0);
    //渲染到view上
    CGContextStrokePath(context);
}

//饼状图
//@[@20,30,@20,30] 0.2,0.3,0.2,03
//3.在drawrect里面去画不同的扇形
- (void)drawBing:(CGRect)rect {
    // 需求：根据sections的数据，绘制多个扇形
    
    // 1.获取上下文(Layer Graphics Context)
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2.根据sections的个数，计算扇形的起始和结束位置来画扇形
    NSInteger count = self.sections.count;
    
    // 如果没有数据，直接返回，不用画
    if(count == 0) return;
    
    // 圆心
    CGFloat centerX = rect.size.width * 0.5;
    CGFloat centerY = rect.size.height * 0.5;
    
    //半径就是x的中心点
    CGFloat radius4 = centerX;
    
    // 计算所有组的总数
    NSInteger sum = 0;
    for (NSInteger i = 0; i < count; i++) {
        sum += [self.sections[i] integerValue];
    }
    
    // 默认设置扇形的起始位置为 0
    CGFloat startAngle = 0;
    
    for (NSInteger i = 0; i < count; i++) {
        // 计算每组占用的比例
#warning 计算float的值，一要除以一个float类型值
        CGFloat scale = [self.sections[i] integerValue] / (sum * 1.0);
        
        // 指定颜色
        UIColor *sectionColor = self.sectionColors[i];
        [sectionColor set];
        
        // 计算结束的位置
#warning 计算结束的位置　＝　起始位置　＋　需要的画的弧度
        CGFloat endAngle = startAngle + scale * 2 * M_PI;
        
#warning 指定 "弧" 的中心点路径
        CGContextMoveToPoint(ctx, centerX, centerY);
        // 画弧
        CGContextAddArc(ctx, centerX, centerY, radius4, startAngle, endAngle, 0);
        
        // 渲染
        CGContextFillPath(ctx);
        
        NSLog(@"scale:%f startAngle:%f endAngle:%f",scale, startAngle,endAngle);
        
        // 重新设置起始的位置，供一次循环使用
        startAngle = endAngle;
    }
}

-(void)setPregress:(float)pregress{
    _pregress = pregress;
    //重绘
    [self setNeedsDisplay];
}

@end
