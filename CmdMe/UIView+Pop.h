//
//  UIView+Pop.h
//  CmdMe
//
//  Created by Charles on 12/22/15.
//  Copyright (c) 2015 Charles. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <POP/POP.h>

@interface UIView (Pop)

-(void)slideInFromOffScreenLeft;
-(void)slideInFromOffScreenRight;
-(void)slideInFromOffScreenTop;
- (void)bounce;
- (void)bounceWithRepeat;

@end
