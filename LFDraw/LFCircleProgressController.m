//
//  LFCircleProgressController.m
//  LFDraw
//
//  Created by 王林芳 on 2020/3/3.
//  Copyright © 2020 王林芳. All rights reserved.
//

#import "LFCircleProgressController.h"
#import "LFCircleProgressView.h"
@interface LFCircleProgressController ()
@property (nonatomic, strong) LFCircleProgressView *progressView;
@property (nonatomic, strong) UISlider *slider;
@end

@implementation LFCircleProgressController
#pragma mark - life circle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self createUI];
}

#pragma mark - target-action

- (void)sliderEvent:(UISlider *)slider {
    [self.progressView drawProgress:slider.value];
}
#pragma mark - assist method
#pragma mark - delegate
#pragma mark - private

- (void)createUI {
    [self.view addSubview:self.progressView];
    
    [self.view addSubview:self.slider];
}
#pragma mark - lazy load

- (LFCircleProgressView *)progressView{
    if (!_progressView) {
        _progressView = [[LFCircleProgressView alloc]initWithFrame:CGRectMake(50, 100, 200, 200)];
    }
    return _progressView;
}

- (UISlider *)slider {
    if (!_slider) {
        _slider = [[UISlider alloc]initWithFrame:CGRectMake(50, 300, 200, 50)];
        
        [_slider addTarget:self action:@selector(sliderEvent:) forControlEvents:UIControlEventValueChanged];
    }
    return _slider;
}

@end
