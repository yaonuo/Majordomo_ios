//
//  AppDelegate.m
//  Majordomo
//
//  Created by Nashio on 13-5-9.
//  Copyright (c) 2013年 Nashio. All rights reserved.
//

#import "AppDelegate.h"

//#import "TabViewController.h"
#import "LoadingViewController.h"
#import "GoodsViewController.h"
#import "PersonalInfoViewController.h"
#import "ShakeItUpTouchViewController.h"
#import "SettingViewController.h"
@implementation AppDelegate
@synthesize loadingViewController = loadingViewController_;
@synthesize mainTabBarController = mainTabBarController_;

- (void)dealloc
{
  [_window release];
  [_viewController release];
  
  [loadingViewController_ release];
  [mainTabBarController_ release];
  [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
  self.window.backgroundColor = [UIColor blackColor];
    // Override point for customization after application launch.
//  self.viewController = [[[ViewController alloc] initWithNibName:@"ViewController" bundle:nil] autorelease];
//  self.window.rootViewController = self.viewController;
  // Setup root view controller
  
//  TabViewController * tabViewController = [TabViewController alloc];
//  [tabViewController initWithTitle:@"KYArcTab"
//                           tabBarSize:(CGSize){kTabBarWdith, kTabBarHeight}
//                tabBarBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:kTabBarBackground]]
//                             itemSize:(CGSize){kTabBarItemWidth, kTabBarItemHeight}
//                                arrow:[UIImage imageNamed:kTabBarArrow]];
//  [self.window setRootViewController:tabViewController];
//  [tabViewController release];
  
  [self loadLoadingView];
  
  [self.window makeKeyAndVisible];
  return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
  // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
  // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
  // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
  // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
  // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
  // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
  // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - Custom methods
- (void)loadLoadingView
{
  loadingViewController_ = [[LoadingViewController alloc] init];
  [self.window addSubview:self.loadingViewController.view];
}

- (void)loadMainView
{
  // Tab1
  GoodsViewController *goodsViewController = [[GoodsViewController alloc] initWithNibName:@"GoodsViewController" bundle:nil];
  UINavigationController *goodsNavigationController = [[UINavigationController alloc] initWithRootViewController:goodsViewController];
  goodsNavigationController.navigationBar.barStyle = UIBarStyleBlack;
  goodsNavigationController.tabBarItem.title = @"借还";
  goodsNavigationController.tabBarItem.image = [UIImage imageNamed:@"house.png"];
  
  // Tab2
  PersonalInfoViewController *personalInfoViewController = [[PersonalInfoViewController alloc] initWithNibName:@"PersonalInfoViewController" bundle:nil];
  UINavigationController *personalInfoNavigationController = [[UINavigationController alloc] initWithRootViewController:personalInfoViewController];
  personalInfoNavigationController.navigationBar.barStyle = UIBarStyleBlack;
  personalInfoNavigationController.tabBarItem.title = @"个人";
  personalInfoNavigationController.tabBarItem.image = [UIImage imageNamed:@"people.png"];
  
  // Tab3
  ShakeItUpTouchViewController *shakeItUpTouchViewController = [[ShakeItUpTouchViewController alloc] initWithNibName:@"ShakeItUpTouchViewController" bundle:nil];
  UINavigationController *shakeItUpTouchNavigationController = [[UINavigationController alloc] initWithRootViewController:shakeItUpTouchViewController];
  shakeItUpTouchNavigationController.navigationBar.barStyle = UIBarStyleBlack;
  shakeItUpTouchNavigationController.tabBarItem.title = @"摇一摇";
  shakeItUpTouchNavigationController.tabBarItem.image = [UIImage imageNamed:@"refresh.png"];
  
  // Tab4
  SettingViewController *settingViewController = [[SettingViewController alloc] initWithNibName:@"SettingViewController" bundle:nil];
  UINavigationController *settingNavigationController = [[UINavigationController alloc] initWithRootViewController:settingViewController];
  settingNavigationController.navigationBar.barStyle = UIBarStyleBlack;
  settingNavigationController.tabBarItem.title = @"配置";
  settingNavigationController.tabBarItem.image = [UIImage imageNamed:@"setting.png"];
    
  mainTabBarController_  = [[UITabBarController alloc] init];
  self.mainTabBarController.viewControllers = [NSArray arrayWithObjects:
                                            goodsNavigationController,
                                            personalInfoNavigationController,
                                            shakeItUpTouchNavigationController,
                                            settingNavigationController,
                                            nil];
  [self.window addSubview:self.mainTabBarController.view];
  [self.window bringSubviewToFront:self.loadingViewController.view];
  
  [UIView beginAnimations:nil context:nil];
  [UIView setAnimationDelegate:self];
  [UIView setAnimationDidStopSelector:@selector(loadingViewAnimationDone)];
  [UIView setAnimationDuration:2];
  
  self.loadingViewController.view.alpha = 0;
  
  [UIView commitAnimations];
  
  [goodsNavigationController release];
  [goodsViewController release];
  [personalInfoNavigationController release];
  [personalInfoViewController release];
  [shakeItUpTouchNavigationController release];
  [shakeItUpTouchViewController release];
  [settingNavigationController release];
  [settingViewController release];
}

// selector
- (void)loadingViewAnimationDone
{
  self.loadingViewController = nil;
}
@end
