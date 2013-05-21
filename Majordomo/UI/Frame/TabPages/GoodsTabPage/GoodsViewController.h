//
//  GoodsViewController.h
//  Majordomo
//
//  Created by Nashio on 13-5-15.
//  Copyright (c) 2013年 Nashio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GoodsViewController : UIViewController
<UITableViewDataSource,
UITableViewDelegate>
@property (nonatomic, retain) IBOutlet UITableView *tableView;
@end
