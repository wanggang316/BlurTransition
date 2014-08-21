//
//  WGPresentAnimation.m
//  WGBlurTransition
//
//  Created by 王刚 on 14/8/20.
//  Copyright (c) 2014年 wwwlife. All rights reserved.
//

#import "WGPresentAnimation.h"
#import "WGPresentViewController.h"
#import "UIView+ScreenShot.h"
#import "GPUImage.h"

@interface WGPresentAnimation() {
    GPUImageView *_blurView;
}

@end

@implementation WGPresentAnimation

GPUImageiOSBlurFilter *_blurFilter;


- (instancetype)init
{
    self = [super init];
    if (self) {
        if (_blurFilter == nil) {
            _blurFilter = [[GPUImageiOSBlurFilter alloc]init];
            _blurFilter.blurRadiusInPixels = 5.0f;
        }
        _blurView = [[GPUImageView alloc] init];
        _blurView.opaque = NO;
    }
    return self;
}



- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.3f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    WGPresentViewController *toVC = (WGPresentViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIImage *fromImage = [fromVC.view convertToImage];
    
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    
    UIView* container = [transitionContext containerView];
    [container addSubview:toVC.view];
    toVC.view.frame = screenBounds;
    toVC.view.alpha = 0;
    
    
    //添加滤镜
    
    _blurView.frame = screenBounds;
    GPUImagePicture *fromPic = [[GPUImagePicture alloc]initWithImage:fromImage];
    
    [fromPic addTarget:_blurFilter];
    [_blurFilter addTarget:_blurView];
    
    [fromPic processImageWithCompletionHandler:^{
        [_blurFilter removeAllTargets];
    }];
    //把模糊化的图片作为toView的背景
    UIImage *toBgImage = [_blurView convertToImage];
    toVC.view.backgroundColor = [UIColor colorWithPatternImage:toBgImage];
    
    
    toVC.view.transform = CGAffineTransformMakeScale(2.0, 2.0);
    
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        toVC.view.alpha = 1.0f;
        toVC.view.transform = CGAffineTransformMakeScale(1.0, 1.0);
        
    } completion:^(BOOL finish) {
        [_blurView removeFromSuperview];
        [transitionContext completeTransition:YES];
    }];
    
   
    
    
    
}

@end
