//
//  WBWaveAnimation.h
//  NewTongDaOA
//
//  Created by 王斌 on 2019/7/13.
//  Copyright © 2019 wangbin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WBWaveAnimation : UIView
@property (nonatomic,assign) CGFloat waveAmplitude;// 振幅
@property (nonatomic,assign) CGFloat waveCycle;// 周期
@property (nonatomic,assign) CGFloat waveSpeed;// 速度
@property (nonatomic,assign) CGFloat waterWaveHeight;
@property (nonatomic,assign) CGFloat waterWaveWidth;
@property (nonatomic,assign) CGFloat waveOffsetX;// 波浪x位移
@property (nonatomic,assign) CGFloat wavePointY;
@property (nonatomic,strong) UIColor *waveColor;// 波浪颜色

- (void)startAnimation;
- (void)stopAnimation;
@end

NS_ASSUME_NONNULL_END
