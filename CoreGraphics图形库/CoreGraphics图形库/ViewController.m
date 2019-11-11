//
//  ViewController.m
//  CoreGraphics图形库
//
//  Created by 徐金城 on 2019/11/8.
//  Copyright © 2019 xujincheng. All rights reserved.
//

#import "ViewController.h"
#import "CustomViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"CoreGraphics图形库";
    
    UIButton *oneBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    oneBtn.frame = CGRectMake(120, 200, 200, 50);
    oneBtn.backgroundColor = [UIColor orangeColor];
    [oneBtn setTitle:@"画图自定义View" forState:UIControlStateNormal];
    [oneBtn addTarget:self action:@selector(oneBtnClicked)  forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:oneBtn];
}

- (void)oneBtnClicked {
    CustomViewController*vc = [[CustomViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
