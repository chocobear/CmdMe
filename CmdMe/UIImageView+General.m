//
//  UIImageView+General.m
//  CmdMe
//
//  Created by Charles Camp on 1/9/16.
//  Copyright © 2016 Charles. All rights reserved.
//

#import "UIImageView+General.h"

@implementation UIImageView (General)

-(void)addGradient {
    if (![self hasGradient]) {
        CAGradientLayer *gradient = [CAGradientLayer layer];
        gradient.frame = self.frame;
        UIColor *centerColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.25];
        UIColor *endColor = [UIColor grayColor];
        gradient.colors = [NSArray arrayWithObjects:(id)[endColor CGColor], (id)[centerColor CGColor], (id)[endColor CGColor], nil];
        [self.layer insertSublayer:gradient atIndex:0];
    }
}

-(BOOL)hasGradient {
    BOOL hasGradientLayer = FALSE;
    for (CALayer *layer in [self.layer sublayers]) {
        if ([layer isKindOfClass:[CAGradientLayer class]]) {
            hasGradientLayer = TRUE;
        }
    }
    return hasGradientLayer;
}

-(void)removeGradient {
    for (CALayer *layer in [self.layer sublayers]) {
        if ([layer isKindOfClass:[CAGradientLayer class]]) {
            [layer removeFromSuperlayer];
        }
    }
}

@end
