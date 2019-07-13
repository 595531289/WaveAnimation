//
//  WBWaveAnimation.m
//  NewTongDaOA
//
//  Created by 王斌 on 2019/7/13.
//  Copyright © 2019 wangbin. All rights reserved.
//

#import "WBWaveAnimation.h"


@interface WBWaveAnimation ()

@property (nonatomic, strong) CADisplayLink *displayLink;
@property (nonatomic,strong) CAShapeLayer *firstWaveLayer;
@property (nonatomic,strong) CAShapeLayer *secondeWaveLayer;
@property (nonatomic,strong) CAShapeLayer *thirdWaveLayer;



@end

@implementation WBWaveAnimation

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.masksToBounds = YES;
        [self ConfigParams];
//        self.backgroundColor = [UIColor grayColor];
        [self.layer addSublayer:self.firstWaveLayer];
        [self.layer addSublayer:self.secondeWaveLayer];
        [self.layer addSublayer:self.thirdWaveLayer];
        
    }
    return self;
}
#pragma mark 配置参数
- (void)ConfigParams
{
    _waterWaveWidth = self.frame.size.width;
    _waterWaveHeight = self.frame.size.height;
    _waveColor = [UIColor colorWithRed:14/255.0 green:134/255.0 blue:254/255.0 alpha:0.5];
    _waveSpeed = 0.25/M_PI;
    _waveOffsetX = 0;
    _wavePointY = _waterWaveHeight - 50;
    _waveAmplitude = 13;
    _waveCycle =  1.29 * M_PI / _waterWaveWidth;
}
#pragma mark 帧刷新事件
- (void)getCurrentWave
{
    _waveOffsetX += _waveSpeed;
    
    [self setFirstWaveLayerPath];
    [self setSecondWaveLayerPath];
    [self setThirdWaveLayerPath];
}

#pragma mark  绑定runloop
- (void)startAnimation{
    [self.displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];

}
- (void)stopAnimation{
    [self.displayLink removeFromRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
}
#pragma mark 三个shapeLayer动画
- (void)setFirstWaveLayerPath
{
    CGMutablePathRef path = CGPathCreateMutable();
    CGFloat y = _wavePointY;
    CGPathMoveToPoint(path, nil, 0, y);
    for (float x = 0.0f; x <= _waterWaveWidth; x ++) {
        y = _waveAmplitude * sin(_waveCycle * x + _waveOffsetX - 10) + _wavePointY + 10;
        CGPathAddLineToPoint(path, nil, x, y);
    }
    CGPathAddLineToPoint(path, nil, _waterWaveWidth, self.frame.size.height);
    CGPathAddLineToPoint(path, nil, 0, self.frame.size.height);
    CGPathCloseSubpath(path);
    _firstWaveLayer.path = path;
    CGPathRelease(path);
}

- (void)setSecondWaveLayerPath
{
    CGMutablePathRef path = CGPathCreateMutable();
    CGFloat y = _wavePointY;
    CGPathMoveToPoint(path, nil, 0, y);
    for (float x = 0.0f; x <= _waterWaveWidth; x ++) {
        y = (_waveAmplitude -2) * sin(_waveCycle * x + _waveOffsetX ) + _wavePointY ;
        CGPathAddLineToPoint(path, nil, x, y);
    }
    
    CGPathAddLineToPoint(path, nil, _waterWaveWidth, self.frame.size.height);
    CGPathAddLineToPoint(path, nil, 0, self.frame.size.height);
    CGPathCloseSubpath(path);
    _secondeWaveLayer.path = path;
    CGPathRelease(path);
}

- (void)setThirdWaveLayerPath
{
    CGMutablePathRef path = CGPathCreateMutable();
    CGFloat y = _wavePointY;
    CGPathMoveToPoint(path, nil, 0, y);
    for (float x = 0.0f; x <= _waterWaveWidth; x ++) {
        y = (_waveAmplitude +2)* sin(_waveCycle * x + _waveOffsetX + 20) + _wavePointY -10;
        CGPathAddLineToPoint(path, nil, x, y);
    }
    
    CGPathAddLineToPoint(path, nil, _waterWaveWidth, self.frame.size.height);
    CGPathAddLineToPoint(path, nil, 0, self.frame.size.height);
    CGPathCloseSubpath(path);
    
    _thirdWaveLayer.path = path;
    
    CGPathRelease(path);
}

#pragma mark Get
- (CAShapeLayer *)firstWaveLayer
{
    if (!_firstWaveLayer) {
        _firstWaveLayer = [CAShapeLayer layer];
        _firstWaveLayer.fillColor = [_waveColor CGColor];
    }
    return _firstWaveLayer;
}

- (CAShapeLayer *)secondeWaveLayer
{
    if (!_secondeWaveLayer) {
        _secondeWaveLayer = [CAShapeLayer layer];
        _secondeWaveLayer.fillColor = [_waveColor CGColor];
    }
    return _secondeWaveLayer;
}

- (CAShapeLayer *)thirdWaveLayer
{
    if (!_thirdWaveLayer) {
        _thirdWaveLayer = [CAShapeLayer layer];
        _thirdWaveLayer.fillColor = [_waveColor CGColor];
    }
    return _thirdWaveLayer;
}

- (CADisplayLink *)displayLink
{
    if (!_displayLink) {
        _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(getCurrentWave)];
    }
    return _displayLink;
}
- (void)dealloc{
    [self.displayLink invalidate];
     self.displayLink = nil;
}
@end
