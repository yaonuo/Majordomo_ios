//
//  UINavigationBar+custom.m
//  Majordomo
//
//  Created by Nashio on 13-5-16.
//  Copyright (c) 2013年 Nashio. All rights reserved.
//

#import "UINavigationBar+custom.h"

@implementation UINavigationBar (custom)
- (void)customNavigationBar {
  if ([self respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)]) {
    [self setBackgroundImage:[UIImage imageNamed:@"bar_wood.png"] forBarMetrics:UIBarMetricsDefault];
  } else {
    [self drawRect:self.bounds];
  }
  
  [self drawRoundCornerAndShadow];
}


- (void)drawRect:(CGRect)rect {
  [[UIImage imageNamed:@"bar_wood.png"] drawInRect:rect];
}

- (void)drawRoundCornerAndShadow {
  CGRect bounds = self.bounds;
  bounds.size.height +=10;
  UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:bounds
                                                 byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerTopRight)
                                                       cornerRadii:CGSizeMake(10.0, 10.0)];
  
  CAShapeLayer *maskLayer = [CAShapeLayer layer];
  maskLayer.frame = bounds;
  maskLayer.path = maskPath.CGPath;
  
  [self.layer addSublayer:maskLayer];
  self.layer.mask = maskLayer;
  self.layer.shadowOffset = CGSizeMake(3, 3);
  self.layer.shadowOpacity = 0.7;
  self.layer.shadowPath = [UIBezierPath bezierPathWithRect:self.bounds].CGPath;
}

@end
