#import <UIKit/UIKit.h>

#import "ArcTab.h"

@interface ArcTabViewController : UIViewController <ArcTabDelegate> {
  ArcTab * tabBar_;
  NSArray  * tabBarItems_;
  CGRect     viewFrame_;
}

@property (nonatomic, retain) ArcTab * tabBar;
@property (nonatomic, copy)   NSArray  * tabBarItems;
@property (nonatomic, assign) CGRect     viewFrame;

// Designated initializer
- (id)  initWithTitle:(NSString *)title                // title
           tabBarSize:(CGSize)tabBarSize               // size of tab bar
tabBarBackgroundColor:(UIColor *)tabBarBackgroundColor // background color of tab bar
             itemSize:(CGSize)itemSize                 // size of items on tab bar
                arrow:(UIImage *)arrow;                // arrow on the tab bar
// Setup message, override it to do customize jobs
- (void)setup;
// Toggle tab bar when receive the right notification
- (void)toggleTabBar:(NSNotification *)notification;

@end
