//
//  WGPresentViewController.m
//  WGBlurTransition
//
//  Created by 王刚 on 14/8/20.
//  Copyright (c) 2014年 wwwlife. All rights reserved.
//

#import "WGPresentViewController.h"

@interface WGPresentViewController ()

@end

@implementation WGPresentViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    [self.view addSubview:self.bgBlurView];
    
}
- (IBAction)dismiss:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
