//
//  GzSplashViewController.m
//  AsyncServerConnection
//
//  Created by Gazolla on 01/08/14.
//  Copyright (c) 2014 Gazolla. All rights reserved.
//

#import "GzSplashViewController.h"

@implementation GzSplashViewController

-(void)viewDidLoad{
    [super viewDidLoad];

    self.splash = [[UILabel alloc]initWithFrame:CGRectMake(0, 185, 320, 40)];
    self.splash.text = @"Top 200 Itunes Albuns";
    self.splash.numberOfLines = 1;
    self.splash.font = [UIFont fontWithName:@"Arial" size:30.0f];
    self.splash.baselineAdjustment = YES;
    self.splash.adjustsFontSizeToFitWidth = YES;
    self.splash.clipsToBounds = YES;
    self.splash.backgroundColor = [UIColor clearColor];
    self.splash.textColor = [UIColor blackColor];
    self.splash.textAlignment = NSTextAlignmentCenter;
    
    self.message = [[UILabel alloc]initWithFrame:CGRectMake(0, 285, 320, 40)];
    self.message.text = @"loading data from server...";
    self.message.numberOfLines = 1;
    self.message.font = [UIFont fontWithName:@"Arial" size:15.0f];
    self.message.baselineAdjustment = YES;
    self.message.adjustsFontSizeToFitWidth = YES;
    self.message.clipsToBounds = YES;
    self.message.backgroundColor = [UIColor clearColor];
    self.message.textColor = [UIColor blackColor];
    self.message.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:self.message];
    [self.view addSubview:self.splash];
    
}

@end
