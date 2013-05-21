#import <Foundation/Foundation.h>

#pragma mark - View  - prefix: 

// App View Basic
#define kViewHeight CGRectGetHeight([UIScreen mainScreen].applicationFrame)
#define kViewWidth  CGRectGetWidth([UIScreen mainScreen].applicationFrame)

// Button Size
#define kButtonInMiniSize   16.f
#define kButtonInSmallSize  32.f
#define kButtonInNormalSize 64.f


#pragma mark - ArcTab Configuration

#define kTabBarHeight     88.f
#define kTabBarWdith      kViewWidth
#define kTabBarItemHeight 44.f
#define kTabBarItemWidth  44.f

// Tab Bar
#define kTabBarBackground          @"TabBarBackground.png"
#define kTabBarArrow               @"TabBarArrow.png"
#define kTabBarItemImageNameFormat @"TabBarItem%.2d.png"
// Gesture
#define kArcTabGestureHelp @"ArcTabGestureHelp.png"

@interface Constants : NSObject

@end
