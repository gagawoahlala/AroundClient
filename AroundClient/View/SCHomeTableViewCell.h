//
//  SCHomeTableViewCell.h
//  AroundClient
//
//  Created by Yikun Huang on 10/4/17.
//  Copyright © 2017 Yikun Huang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SCPost;

@interface SCHomeTableViewCell : UITableViewCell
- (void)loadCellWithPost:(SCPost *)post;
+ (CGFloat)cellHeight;

@end
