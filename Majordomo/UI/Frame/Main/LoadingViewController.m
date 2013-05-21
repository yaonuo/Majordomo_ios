//
//  LoadingViewController.m
//  Majordomo
//
//  Created by Nashio on 13-5-20.
//  Copyright (c) 2013年 Nashio. All rights reserved.
//

#import "LoadingViewController.h"
#import "AppDelegate.h"
@interface LoadingViewController ()

@end

@implementation LoadingViewController
@synthesize  activityIndicatorView = activityIndicatorView_;

- (void)dealloc
{
  [activityIndicatorView_ release];
  [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (id)init
{
  self = [super init];
  if (self) {
    activityIndicatorView_ = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [activityIndicatorView_ setFrame:CGRectMake(kMainScreenViewWidth /2, kMainScreenViewHeight, 20, 20)];
    [self.view addSubview:activityIndicatorView_];
    [activityIndicatorView_ release];
  }
  return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.  
  UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kMainScreenViewWidth, kMainScreenViewHeight)];
  backgroundImageView.backgroundColor = [UIColor clearColor];
  backgroundImageView.image = [UIImage imageNamed:@"loading.png"];
  [self.view addSubview:backgroundImageView];
  [backgroundImageView release];
  
  [activityIndicatorView_ setHidesWhenStopped:YES];
  [activityIndicatorView_ startAnimating];
  
  [self performSelector:@selector(loadingDone) withObject:nil afterDelay:2]; // default loading 2s
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadingDone
{
  [NSObject cancelPreviousPerformRequestsWithTarget:self];
  [(AppDelegate *)[UIApplication sharedApplication].delegate loadMainView];
  [activityIndicatorView_ stopAnimating];
}
@end
