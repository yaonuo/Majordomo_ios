#import <UIKit/UIKit.h>

#import <QuartzCore/QuartzCore.h>

// For debuging graphics
//#define ARCTAB_DEBUG_GRAPHICS 1

// View Basic
#define kArcTabViewHeight CGRectGetHeight([UIScreen mainScreen].applicationFrame)
#define kArcTabViewWidth  CGRectGetWidth([UIScreen mainScreen].applicationFrame)

// Notification Name
// Notification for toggling tab bar
#define kNArcTabToggleTabBar @"NArcTabToggleTabBar"

// Tag Constants
#define kNArcTabArrowTag                  1021
#define kNArcTabSelectedItemTag           1022
#define kNArcTabSelectedViewControllerTag 1023


@protocol ArcTabDelegate

- (UIImage *)iconFor:(NSUInteger)itemIndex;

@optional
- (void)touchUpInsideItemAtIndex:(NSUInteger)itemIndex;
- (void)touchDownAtItemAtIndex:(NSUInteger)itemIndex
         withPreviousItemIndex:(NSUInteger)previousItemIndex;

@end


@interface ArcTab : UIView {
  NSObject <ArcTabDelegate> * delegate_;
  NSMutableArray              * buttons_;
  NSInteger                     previousItemIndex_;
}

@property (nonatomic, assign) NSObject <ArcTabDelegate> * delegate;
@property (nonatomic, retain) NSMutableArray              * buttons;
@property (nonatomic, assign) NSInteger                     previousItemIndex;

// Designated initializer
- (id)initWithFrame:(CGRect)frame              // frame of tab bar
         tabBarSize:(CGSize)tabBarSize         // size of tab bar
    backgroundColor:(UIColor *)backgroundColor // background color of tab bar
           itemSize:(CGSize)itemSize           // size of items on tab bar
          itemCount:(NSUInteger)itemCount      // number of items on tab bar
              arrow:(UIImage *)arrow           // arrow on the tab bar
                tag:(NSInteger)tag             // tag for the tab bar
           delegate:(NSObject <ArcTabDelegate> *)delegate;
// Action of touch down on tab bar item
- (void)touchDownAction:(UIButton *)button;
// Action for selected item
- (void)selectItemAtIndex:(NSInteger)index;
// TODO:
//   This message is for device's rotation management
//- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
//                                duration:(NSTimeInterval)duration;

@end
