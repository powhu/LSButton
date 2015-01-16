//
//  ViewController.m
//  LSButton
//
//  Created by Yang on 2015/01/16.
//  Copyright (c) 2015年 Yang. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
}

-(void)viewDidLayoutSubviews
{
    if (!buttonFromCode)
    {
        buttonFromCode = [LSButton buttonWithFrame:CGRectOffset(button.frame, 0, -button.frame.size.height - 10) icon:button.currentImage buttonColor:[UIColor grayColor] shadowColor:[UIColor blackColor] tintColor:[UIColor whiteColor] radius:10 angel:45 target:nil action:nil];
        [self.view addSubview:buttonFromCode];
    }
}

- (IBAction)valueDidChanged:(UISlider *)sender
{
    button.angel = sender.value;
    [button setNeedsDisplay];
    
    buttonFromCode.angel = sender.value;
    [buttonFromCode setNeedsDisplay];
}


@end
