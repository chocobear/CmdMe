//
//  CmdLoginPageControl.h
//  CmdMe
//
//  Created by Charles on 12/24/15.
//  Copyright (c) 2015 Charles. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CmdPageControl : UIPageControl

// View Properties
@property NSArray *pageImageArray;
@property NSArray *pageLabelArray;
@property NSMutableArray *pageViewControllers;
@property UIImageView *currentImg;
@property UILabel *currentLabel;
@property UIScrollView *pageScroll;

// Initialization
-(void)initCurrentDefaults:(UIImageView *)imgCurrent withLabel:(UILabel *)lblCurrent andScrollView:(UIScrollView *)scroll;
-(void)createPageControl:(UIViewController *)controller;

@end
