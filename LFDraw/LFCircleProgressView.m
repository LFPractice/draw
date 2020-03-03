//
//  LFCircleProgressView.m
//  LFDraw
//
//  Created by 王林芳 on 2020/3/3.
//  Copyright © 2020 王林芳. All rights reserved.
//

#import "LFCircleProgressView.h"
@interface LFCircleProgressView()
@property (nonatomic, assign) CGFloat progress;
@property (nonatomic, strong) CAShapeLayer *progressLayer;
@property (nonatomic, strong) CAShapeLayer *bgLayer;
@end
@implementation LFCircleProgressView
#pragma mark - life circle

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}

#pragma mark - target-action
#pragma mark - assist method

- (void)drawRect:(CGRect)rect {
    
    [self updateContent];
}
#pragma mark - delegate
#pragma mark - private

- (void)createUI {
    [self setBackgroundColor:[UIColor whiteColor]];
    
    [self.layer addSublayer:self.bgLayer];
}

- (void)drawProgress:(CGFloat)progress {
    _progress = progress;
    [self.progressLayer removeFromSuperlayer];
    [self setNeedsDisplay];
}

- (void)updateContent {
    CGPoint center = CGPointMake(100, 100);
    CGFloat radius = 90;
    CGFloat startA = -M_PI_2;
    CGFloat endA = -M_PI_2 + M_PI * 2 * _progress;
    
    _progressLayer = [CAShapeLayer layer];
    _progressLayer.frame = self.bounds;
    _progressLayer.fillColor = [[UIColor clearColor]CGColor];
    _progressLayer.strokeColor = [UIColor redColor].CGColor;
    _progressLayer.opacity = 1;
    _progressLayer.lineCap = kCALineCapRound; // 指定线的边缘是圆的
    _progressLayer.lineWidth = 10;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
    
    _progressLayer.path = [path CGPath];
    [self.layer addSublayer:_progressLayer];
}
#pragma mark - lazy load

- (CAShapeLayer *)bgLayer {
    if (!_bgLayer) {
        
        CGPoint center = CGPointMake(100, 100);
        CGFloat radius = 90;
        CGFloat startA = -M_PI_2;
        CGFloat endA = -M_PI_2 + M_PI * 2;
        
        _bgLayer = [CAShapeLayer layer];
        _bgLayer.frame = self.bounds;
        _bgLayer.fillColor = [UIColor clearColor].CGColor;
        _bgLayer.strokeColor = [UIColor redColor].CGColor;
        _bgLayer.opacity = 0.5;
        _bgLayer.lineWidth = 10;
        
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
        
        _bgLayer.path = [path CGPath];
    }
    return _bgLayer;
}

@end
