#import "TabViewController.h"

//TabPages
#import "GoodsViewController.h"

@interface TabViewController () {
 @private
  UIViewController * viewControllerOne_,
                   * viewControllerTwo_,
                   * viewControllerThree_,
                   * viewControllerFour_;
  UINavigationController *navigationControllerTwo_;
}

@property (nonatomic, retain) UIViewController * viewControllerOne,
                                               * viewControllerTwo,
                                               * viewControllerThree,
                                               * viewControllerFour;
@property (nonatomic, retain) UINavigationController *navigationControllerTwo;
@end


@implementation TabViewController
@synthesize viewControllerOne   = viewControllerOne_,
            viewControllerTwo   = viewControllerTwo_,
            viewControllerThree = viewControllerThree_,
            viewControllerFour  = viewControllerFour_;
@synthesize navigationControllerTwo = navigationControllerTwo_;

- (void)dealloc {
  self.viewControllerOne =
    self.viewControllerTwo =
    self.viewControllerThree =
  self.viewControllerFour = nil;
  
  self.navigationControllerTwo = nil;
  [super dealloc];
}

- (void)didReceiveMemoryWarning {
  // Releases the view if it doesn't have a superview.
  [super didReceiveMemoryWarning];
  
  // Release any cached data, images, etc that aren't in use.
}

#pragma mark - Override

// Override |ArcTabViewController|'s |-setup|
- (void)setup {
  // Set View Frame
  self.viewFrame = (CGRect){CGPointZero, {kViewWidth, kViewHeight}};
  
  // Add child view controllers to¡ each tab
  viewControllerOne_   = [[UIViewController alloc] init];
  
  viewControllerTwo_   = [[GoodsViewController alloc] initWithNibName:@"GoodsViewController" bundle:nil];
  navigationControllerTwo_ = [[UINavigationController alloc] initWithRootViewController:viewControllerTwo_];
  
  viewControllerThree_ = [[UIViewController alloc] init];
  viewControllerFour_  = [[UIViewController alloc] init];
  
  // Set child views' Frame
  CGRect childViewFrame = self.viewFrame;
  [viewControllerOne_.view   setFrame:childViewFrame];
  [viewControllerTwo_.view   setFrame:childViewFrame];
  [viewControllerThree_.view setFrame:childViewFrame];
  [viewControllerFour_.view  setFrame:childViewFrame];
  
  // Set child views' background color
  [viewControllerOne_.view   setBackgroundColor:[UIColor blackColor]];
  [viewControllerTwo_.view   setBackgroundColor:[UIColor redColor]];
  [viewControllerThree_.view setBackgroundColor:[UIColor greenColor]];
  [viewControllerFour_.view  setBackgroundColor:[UIColor blueColor]];
  
  // Add child views as tab bar items
  self.tabBarItems = @[@{@"image"          : [NSString stringWithFormat:kTabBarItemImageNameFormat, 1],
                         @"viewController" : viewControllerOne_},
                       @{@"image"          : [NSString stringWithFormat:kTabBarItemImageNameFormat, 2],
                         @"viewController" : navigationControllerTwo_},
                       @{@"image"          : [NSString stringWithFormat:kTabBarItemImageNameFormat, 3],
                         @"viewController" : viewControllerThree_},
                       @{@"image"          : [NSString stringWithFormat:kTabBarItemImageNameFormat, 4],
                         @"viewController" : viewControllerFour_}];
  
  // Add a gesture signal on the first view
  UIImage * gestureImage = [UIImage imageNamed:kArcTabGestureHelp];
  CGRect gestureImageViewFrame =
    (CGRect){{(kViewWidth - gestureImage.size.width) / 2.f,
              (kViewHeight - kTabBarHeight - gestureImage.size.height) / 2.f},
             gestureImage.size};
  UIImageView * gestureImageView = [[UIImageView alloc] initWithFrame:gestureImageViewFrame];
  [gestureImageView setImage:gestureImage];
  [gestureImageView setUserInteractionEnabled:YES];
  [viewControllerOne_.view addSubview:gestureImageView];
  
  [gestureImageView release];
}

@end
