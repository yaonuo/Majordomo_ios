//
//  AppDelegate.h
//  Majordomo
//
//  Created by Nashio on 13-5-9.
//  Copyright (c) 2013年 Nashio. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;
@class LoadingViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
  @private
  LoadingViewController     *loadingViewController_;
  UITabBarController        *mainTabBarController_;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) ViewController *viewController;

@property (nonatomic, retain) LoadingViewController *loadingViewController;
@property (nonatomic, retain) UITabBarController  *mainTabBarController;

- (void)loadLoadingView;
- (void)loadMainView;
@end
