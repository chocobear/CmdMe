//
//  UIView+General.h
//  CmdMe
//
//  Created by Charles on 12/24/15.
//  Copyright (c) 2015 Charles. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (General)

-(void)addShadow;
-(void)addHorizontalGradient:(NSArray *)colors;
-(void)addRoundedShadow:(float)radius;
-(void)addBorder:(float)radius withColor:(UIColor *)borderColor;

@end
