//
//  GoodsCell.m
//  Majordomo
//
//  Created by Nashio on 13-5-16.
//  Copyright (c) 2013年 Nashio. All rights reserved.
//

#import "GoodsCell.h"

@implementation GoodsCell
@synthesize goodsOne = _goodsOne;
@synthesize goodsTwo = _goodsTwo;
@synthesize goodsThree = _goodsThree;
@synthesize footLine = _footLine;

- (void)dealloc
{
  [_goodsOne release];
  [_goodsTwo release];
  [_goodsThree release];
  [_footLine release];
  
  [super dealloc];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
