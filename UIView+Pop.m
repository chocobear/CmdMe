//
//  UIView+Pop.m
//  CmdMe
//
//  Created by Charles on 12/22/15.
//  Copyright (c) 2015 Charles. All rights reserved.
//

#import "UIView+Pop.h"
#import <objc/runtime.h>

@implementation UIView (Pop)

- (void)setAnimateOnAppear:(BOOL)animateOnAppear {
    objc_setAssociatedObject(self, @selector(animateOnAppear), @(animateOnAppear), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)animateOnAppear {
    return [objc_getAssociatedObject(self, @selector(animateOnAppear)) boolValue];
}

-(void)awakeFromNib{
    if (self.animateOnAppear){
        if ([self isKindOfClass:[UIButton class]]) {
            [self setHidden:TRUE];
            [self slideInFromOffScreenRight];
        } else if ([self isKindOfClass:[UIImageView class]] && self.tag == 1) {
            [self setHidden:TRUE];
            [self slideInFromOffScreenLeft];
        } else if ([self isKindOfClass:[UIImageView class]]) {
            [self setHidden:TRUE];
            [self slideInFromOffScreenTop];
        } else if ([self isKindOfClass:[UILabel class]]) {
            [self bounce];
        }
    }
}

-(void)slideInFromOffScreenLeft {
    CGPoint toCenter = self.center;
    [self setCenter:CGPointMake(0, self.center.y)];
    [self animateSpringAnimationToCenterX:toCenter];
}

-(void)slideInFromOffScreenRight {
    CGPoint toCenter = self.center;
    [self setCenter:CGPointMake(320, self.center.y)];
    [self animateSpringAnimationToCenterX:toCenter];
}

-(void)slideInFromOffScreenTop  {
    [self setCenter:CGPointMake(self.center.x, 0)];
    [self animateSpringAnimationToCenterY:68];
}

-(void)animateSpringAnimationToCenterY:(float)toCenterY {
    [self setHidden:FALSE];
    POPBasicAnimation *anim = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPosition];
    anim.fromValue = [NSValue valueWithCGPoint:CGPointMake(self.center.x, self.center.y)];
    anim.toValue = [NSValue valueWithCGPoint:CGPointMake(self.center.x, toCenterY)];
    anim.duration = 1.0;
    [self.layer pop_addAnimation:anim forKey:@"move"];
}

-(void)animateSpringAnimationToCenterX:(CGPoint)toCenter {
    [self setHidden:FALSE];
    POPBasicAnimation *anim = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPosition];
    anim.fromValue = [NSValue valueWithCGPoint:CGPointMake(self.center.x, self.center.y)];
    anim.toValue = [NSValue valueWithCGPoint:CGPointMake([[UIScreen mainScreen] bounds].size.width / 2, toCenter.y)];
    anim.duration = 1.0;
    [self.layer pop_addAnimation:anim forKey:@"move"];
}

- (void)bounce {
    [self bounceandRepeat:FALSE];
}

- (void)bounceWithRepeat {
    [self bounceandRepeat:TRUE];
}

- (void)bounceandRepeat:(BOOL)shouldRepeat {
    if ([self tag] != 2) {
        [self setTag:2];
        POPSpringAnimation *sprintAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
        sprintAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(1.2, 1.2)];
        sprintAnimation.velocity = [NSValue valueWithCGPoint:CGPointMake(2, 2)];
        sprintAnimation.springBounciness = 20.f;
        if ([self isKindOfClass:[UILabel class]] || [self isKindOfClass:[UIImageView class]]) {
            [self pop_addAnimation:sprintAnimation forKey:@"springAnimation"];
        } else {
            [self.layer pop_addAnimation:sprintAnimation forKey:@"springAnimation"];
        }
        if (shouldRepeat) {
            [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(bounceWithRepeat) userInfo:nil repeats:NO];
        } else {
            [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(bounce) userInfo:nil repeats:NO];
        }
    } else {
        POPSpringAnimation *sprintAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
        sprintAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(1.0, 1.0)];
        sprintAnimation.velocity = [NSValue valueWithCGPoint:CGPointMake(2, 2)];
        sprintAnimation.springBounciness = 20.f;
        if ([self isKindOfClass:[UILabel class]] || [self isKindOfClass:[UIImageView class]]) {
            [self pop_addAnimation:sprintAnimation forKey:@"springAnimation"];
        } else {
            [self.layer pop_addAnimation:sprintAnimation forKey:@"springAnimation"];
        }
        [self setTag:0];
        if (shouldRepeat) {
            [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(bounceWithRepeat) userInfo:nil repeats:NO];
        }
    }
}

@end
