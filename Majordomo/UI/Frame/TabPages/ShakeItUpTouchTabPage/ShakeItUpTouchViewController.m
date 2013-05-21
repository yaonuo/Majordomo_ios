//
//  ShakeItUpTouchViewController.m
//  Majordomo
//
//  Created by Nashio on 13-5-20.
//  Copyright (c) 2013年 Nashio. All rights reserved.
//

#import "ShakeItUpTouchViewController.h"

@interface ShakeItUpTouchViewController ()

@end

@implementation ShakeItUpTouchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    // Custom initialization
    self.title = @"摇一摇，有你感兴趣的";
    
  }
  return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
