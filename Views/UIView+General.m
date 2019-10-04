//
//  UIView+General.m
//  CmdMe
//
//  Created by Charles on 12/24/15.
//  Copyright (c) 2015 Charles. All rights reserved.
//

#import "UIView+General.h"

@implementation UIView (General)

-(void)addShadow {
    UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRect:self.bounds];
    self.layer.masksToBounds = NO;
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(0.0f, 0.2f);
    self.layer.shadowOpacity = 0.5f;
    self.layer.shadowPath = shadowPath.CGPath;
}

-(void)addHorizontalGradient:(NSArray *)colors {
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.bounds;
    gradientLayer.colors = colors;
    gradientLayer.startPoint = CGPointMake(0.0, 0.5);
    gradientLayer.endPoint = CGPointMake(1.0, 0.5);
    [[self layer] addSublayer:gradientLayer];
}

-(void)addRoundedShadow:(float)radius {
    [self.layer setMasksToBounds:NO];
    //[self setClipsToBounds:NO];
    [self.layer setShadowPath:[[UIBezierPath bezierPathWithRoundedRect:CGRectMake(self.layer.bounds.origin.x, self.layer.bounds.origin.y, self.layer.bounds.size.width - 14, self.layer.bounds.size.height - 14) cornerRadius:radius] CGPath]];
    [self.layer setShadowColor:[UIColor blackColor].CGColor];
    [self.layer setShadowOpacity:0.5];
    [self.layer setShadowRadius:radius];
    [self.layer setShadowOffset:CGSizeMake(0.0, 0.0)];
}

-(void)addBorder:(float)radius withColor:(UIColor *)borderColor {
    [self.layer setMasksToBounds:NO];
    [self.layer setCornerRadius:radius];
    [self.layer setMasksToBounds:YES];
    [self.layer setBorderColor:borderColor.CGColor];
}

@end
