//
//  WGViewController.m
//  WGBlurTransition
//
//  Created by 王刚 on 14/8/20.
//  Copyright (c) 2014年 wwwlife. All rights reserved.
//

#import "WGViewController.h"
#import "WGPresentViewController.h"
#import "WGPresentAnimation.h"
#import "WGDismissAnimation.h"

@interface WGViewController () <UIViewControllerTransitioningDelegate>

@property (strong, nonatomic) WGPresentAnimation *presentAnimation;
@property (strong, nonatomic) WGDismissAnimation *dismissAnimation;

@end

@implementation WGViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _presentAnimation = [WGPresentAnimation new];
        _dismissAnimation = [WGDismissAnimation new];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (IBAction)presentNewView:(id)sender {
    
    WGPresentViewController *controller = [[WGPresentViewController alloc]initWithNibName:@"WGPresentViewController" bundle:nil];
    controller.transitioningDelegate = self;
    
    [self presentViewController:controller animated:YES completion:nil];
    
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return self.presentAnimation;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return self.dismissAnimation;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
