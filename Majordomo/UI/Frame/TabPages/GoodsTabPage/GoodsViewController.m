//
//  GoodsViewController.m
//  Majordomo
//
//  Created by Nashio on 13-5-15.
//  Copyright (c) 2013年 Nashio. All rights reserved.
//

#import "GoodsViewController.h"
#import "GoodsCell.h"
#import "UINavigationBar+custom.h"
@interface GoodsViewController ()

@end

@implementation GoodsViewController
@synthesize tableView = _tableView;

- (void)dealloc
{
  [_tableView release];
  [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    // Custom initialization
    self.title = @"物品清单"; //必须要在这里写，不然没效果
  }
  return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  // Init GoodsViewController's NavigationController
  // step 1: Set right button
  UIButton *rightButton = [[UIButton alloc] initWithFrame:CGRectMake(0,0,25,25)];
  UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
  [rightButton setBackgroundImage:[UIImage imageNamed:@"trolley@2x.png"]
                         forState:UIControlStateNormal];
  [rightButton addTarget:self
                  action:@selector(linxiaoyan:)
        forControlEvents:UIControlEventTouchUpInside];
  [self.navigationItem setRightBarButtonItem:rightItem];
  [self.navigationController.navigationBar customNavigationBar];
  [rightButton release];
  [rightItem release];
  
  // Init Table View
  UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background_wood.jpg"]];
  self.tableView.delegate = self;
  self.tableView.dataSource = self;
  self.tableView.backgroundView = imageView;
  self.tableView.separatorColor = [UIColor clearColor]; // 去掉group边框
  
  [imageView release];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

#pragma mark - Table View Data Source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return 8;
}

//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
////  return [NSString stringWithFormat:@"图书",section];
////  switch (section) {
////    case 0:
////      return @"图书类";
////      break;
////    case 1:
////      return @"运行类";
////    default:
////      return @"未知类型";
////      break;
////  }
//  return nil;
//}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  
  return 120;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString *identifier = @"GoodsTableViewCell";
  
  GoodsCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
  if (cell == nil) {
    
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"GoodsCell" owner:self options:nil];
    cell = [nib objectAtIndex:0];
    
    // 这里不能cell.footLine = imageView_var，不显示。
    [cell.footLine setImage:[UIImage imageNamed:@"shelf_wood.png"]]; // 图片本身大
    [cell.goodsOne setImage:[UIImage imageNamed:@"book1.jpg"]];
    [cell.goodsTwo setImage:[UIImage imageNamed:@"book2.jpg"]];
    [cell.goodsThree setImage:[UIImage imageNamed:@"book3.jpg"]];
    [cell setBackgroundColor:[UIColor clearColor]];
  }
  return  cell;
  
}

// 重绘Header
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
  UIView *headerView = [[[UIView alloc] init] autorelease];
  UILabel *headerTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 90, 22)];
  headerView.backgroundColor = [UIColor colorWithRed:0.10 green:0.68 blue:0.94 alpha:0.7];
  headerTitle.textColor = [UIColor whiteColor];
  headerTitle.backgroundColor = [UIColor clearColor];
  headerTitle.text = [NSString stringWithFormat:@"类别%d",section];
  [headerView addSubview:headerTitle];
  [headerTitle release];
  
  return headerView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
  return 22;
}

- (void)linxiaoyan:(UIButton *)sender
{
  UIAlertView *view = [[UIAlertView alloc] initWithTitle:@"妹纸" message:@"呵呵！～～" delegate:self cancelButtonTitle:@"not" otherButtonTitles:nil];
  [view show];
  [view release];
}
@end
