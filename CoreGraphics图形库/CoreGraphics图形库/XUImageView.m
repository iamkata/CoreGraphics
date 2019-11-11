//
//  XUImageView.m
//  CoreGraphics图形库
//
//  Created by 徐金城 on 2019/11/11.
//  Copyright © 2019 xujincheng. All rights reserved.
//

#import "XUImageView.h"

@implementation XUImageView

- (instancetype)initWithImage:(UIImage *)image {
    
    if (self = [super init]) {
        //确定当前ImageView的尺寸大小
        self.frame = CGRectMake(0, 0, image.size.width, image.size.height);
        _image = image;
    }
    return self;
}

-(void)setImage:(UIImage *)image {
    _image = image;
    //重绘
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
    [self.image drawInRect:rect];
    
}

@end
