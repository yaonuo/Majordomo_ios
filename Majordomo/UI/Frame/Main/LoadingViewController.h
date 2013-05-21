//
//  LoadingViewController.h
//  Majordomo
//
//  Created by Nashio on 13-5-20.
//  Copyright (c) 2013年 Nashio. All rights reserved.
//

#import <UIKit/UIKit.h>
// View Basic
#define kMainScreenViewHeight CGRectGetHeight([UIScreen mainScreen].applicationFrame)
#define kMainScreenViewWidth  CGRectGetWidth([UIScreen mainScreen].applicationFrame)

@interface LoadingViewController : UIViewController
{
  @private
  UIActivityIndicatorView *activityIndicatorView_;
}

@property (nonatomic, retain) UIActivityIndicatorView *activityIndicatorView;
@end
