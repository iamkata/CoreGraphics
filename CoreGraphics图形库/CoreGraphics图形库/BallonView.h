//
//  BallonView.h
//  CoreGraphics图形库
//
//  Created by 徐金城 on 2019/11/11.
//  Copyright © 2019 xujincheng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BallonView : UIView

/**
 *  所有气球的位置
 */
@property (nonatomic,strong)NSMutableArray  *locations;

/**
 *  所有的气球
 */
@property (nonatomic,strong)NSMutableArray  *ballons;

//定时器
@property (nonatomic,strong)CADisplayLink  *link;

@end

NS_ASSUME_NONNULL_END
