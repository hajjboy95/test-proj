//
//  XYZViewController.m
//  PongTutorial
//
//  Created by Ismail El-Habbash on 07/12/2013.
//  Copyright (c) 2013 Ismail El-Habbash. All rights reserved.
//

#import "XYZViewController.h"

@interface XYZViewController ()

@end

@implementation XYZViewController

//Code that will run as soon as the view will load.
//we will use this to animate are Background.

- (void)viewDidLoad
{
    animatedBackground.animationImages = [NSArray arrayWithObjects:
                                          [UIImage imageNamed:@"1.png"],
                                          [UIImage imageNamed:@"2.png"],
                                          [UIImage imageNamed:@"3.png"],
                                          [UIImage imageNamed:@"4.png"],
                                          [UIImage imageNamed:@"5.png"],
                                          nil
                                          ];
    

    [animatedBackground setAnimationRepeatCount:0];
    animatedBackground.animationDuration = 4;
     [animatedBackground startAnimating];
    
    
    
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
