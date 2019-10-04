//
//  NavigationView.m
//  CmdMe
//
//  Created by Charles Camp on 1/9/16.
//  Copyright © 2016 Charles. All rights reserved.
//

#import "NavigationView.h"

@implementation NavigationView

-(id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setIsShown:FALSE];
    }
    return self;
}

-(id)initNaviagation {
    self = [super init];
    if (self) {
        [self setIsShown:FALSE];
        [self setFrame:CGRectMake(0, 0, 320, 464)];
    }
    return self;
}

-(void)animateUp {
    if (![self isShown]) {
        [UIView animateWithDuration:.3 delay:0.1 options:UIViewAnimationOptionCurveEaseIn animations:^{
            [self setFrame:CGRectMake(0, 0, 320, 464)];
        } completion:^(BOOL finished) {
            [self setIsShown:TRUE];
        }];
    }
}

-(void)animateDown {
    if ([self isShown]) {
        [UIView animateWithDuration:.3 delay:0.1 options:UIViewAnimationOptionCurveEaseIn animations:^{
            [self setFrame:CGRectMake(0, 464, 320, 464)];
        } completion:^(BOOL finished) {
            [self setIsShown:FALSE];
        }];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
