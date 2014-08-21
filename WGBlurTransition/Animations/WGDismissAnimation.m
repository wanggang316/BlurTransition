//
//  WGDismissAnimation.m
//  WGBlurTransition
//
//  Created by 王刚 on 14/8/21.
//  Copyright (c) 2014年 wwwlife. All rights reserved.
//

#import "WGDismissAnimation.h"
#import "WGPresentViewController.h"
#import "WGViewController.h"
#import "UIView+ScreenShot.h"


@implementation WGDismissAnimation


- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.3f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    WGPresentViewController *fromVC = (WGPresentViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    WGViewController *toVC = (WGViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView* container = [transitionContext containerView];
    [container addSubview:toVC.view];
    [container sendSubviewToBack:toVC.view];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        fromVC.view.transform = CGAffineTransformMakeScale(2.0,2.0);
        fromVC.view.alpha = 0.0;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
    
}



@end
