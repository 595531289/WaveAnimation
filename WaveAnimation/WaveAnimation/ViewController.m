//
//  ViewController.m
//  WaveAnimation
//
//  Created by 王斌 on 2019/7/13.
//  Copyright © 2019 wangbin. All rights reserved.
//

#import "ViewController.h"
#import "WBWaveAnimation.h"
#define WINDOW_WIDTH     [UIScreen mainScreen].bounds.size.width
#define WINDOW_HEIGHT     [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@property (nonatomic, strong) WBWaveAnimation *waveView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createBtn];
    [self.view addSubview:self.waveView];
}

- (void)createBtn{
    UIButton *startBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    startBtn.frame = CGRectMake(60, 100, 100, 40);
    [startBtn setTitle:@"开始" forState:UIControlStateNormal];
    [startBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [startBtn addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:startBtn];
    UIButton *stopBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    stopBtn.frame = CGRectMake(200, 100, 100, 40);
    [stopBtn setTitle:@"停止" forState:UIControlStateNormal];
    [stopBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [stopBtn addTarget:self action:@selector(stop) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:stopBtn];
}

- (void)start{
    
    [self.waveView startAnimation];

}

- (void)stop{
    
    [self.waveView stopAnimation];

}
- (WBWaveAnimation *)waveView{
    if (!_waveView) {
        _waveView = [[WBWaveAnimation alloc]initWithFrame:CGRectMake(0, WINDOW_HEIGHT-80, WINDOW_WIDTH, 80)];
    }
    return _waveView;
}


@end
