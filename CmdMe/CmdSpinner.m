//
//  CmdSpinner.m
//  CmdMe
//
//  Created by Charles Camp on 1/9/16.
//  Copyright © 2016 Charles. All rights reserved.
//

#import "CmdSpinner.h"

@implementation CmdSpinner

static NSString *const kLoadAnimation = @"ring_0000_Layer-40.png";
static NSString *const kLoadAnimation1 = @"ring_0001_Layer-39.png";
static NSString *const kLoadAnimation2 = @"ring_0002_Layer-38.png";
static NSString *const kLoadAnimation3 = @"ring_0003_Layer-37.png";
static NSString *const kLoadAnimation4 = @"ring_0004_Layer-36.png";
static NSString *const kLoadAnimation5 = @"ring_0005_Layer-35.png";
static NSString *const kLoadAnimation6 = @"ring_0006_Layer-34.png";
static NSString *const kLoadAnimation7 = @"ring_0007_Layer-33.png";
static NSString *const kLoadAnimation8 = @"ring_0008_Layer-32.png";
static NSString *const kLoadAnimation9 = @"ring_0009_Layer-31.png";
static NSString *const kLoadAnimation10 = @"ring_0010_Layer-30.png";
static NSString *const kLoadAnimation11 = @"ring_0011_Layer-29.png";
static NSString *const kLoadAnimation12 = @"ring_0012_Layer-28.png";
static NSString *const kLoadAnimation13 = @"ring_0013_Layer-27.png";
static NSString *const kLoadAnimation14 = @"ring_0014_Layer-26.png";
static NSString *const kLoadAnimation15 = @"ring_0015_Layer-25.png";
static NSString *const kLoadAnimation16 = @"ring_0016_Layer-24.png";
static NSString *const kLoadAnimation17 = @"ring_0017_Layer-23.png";
static NSString *const kLoadAnimation18 = @"ring_0018_Layer-22.png";
static NSString *const kLoadAnimation19 = @"ring_0019_Layer-21.png";
static NSString *const kLoadAnimation20 = @"ring_0020_Layer-20.png";
static NSString *const kLoadAnimation21 = @"ring_0021_Layer-19.png";
static NSString *const kLoadAnimation22 = @"ring_0022_Layer-18.png";
static NSString *const kLoadAnimation23 = @"ring_0023_Layer-17.png";
static NSString *const kLoadAnimation24 = @"ring_0024_Layer-16.png";
static NSString *const kLoadAnimation25 = @"ring_0025_Layer-15.png";
static NSString *const kLoadAnimation26 = @"ring_0026_Layer-14.png";
static NSString *const kLoadAnimation27 = @"ring_0027_Layer-13.png";
static NSString *const kLoadAnimation28 = @"ring_0028_Layer-12.png";
static NSString *const kLoadAnimation29 = @"ring_0029_Layer-11.png";
static NSString *const kLoadAnimation30 = @"ring_0030_Layer-10.png";
static NSString *const kLoadAnimation31 = @"ring_0031_Layer-9.png";
static NSString *const kLoadAnimation32 = @"ring_0032_Layer-8.png";
static NSString *const kLoadAnimation33 = @"ring_0033_Layer-7.png";
static NSString *const kLoadAnimation34 = @"ring_0034_Layer-6.png";
static NSString *const kLoadAnimation35 = @"ring_0035_Layer-5.png";
static NSString *const kLoadAnimation36 = @"ring_0036_Layer-4.png";
static NSString *const kLoadAnimation37 = @"ring_0037_Layer-3.png";
static NSString *const kLoadAnimation38 = @"ring_0038_Layer-2.png";
static NSString *const kLoadAnimation39 = @"ring_0039_Layer-1.png";

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

-(id)initSpinner {
    self = [super init];
    if (self) {
        [self createSpinnerImages];
    }
    return self;
}

-(void)createSpinnerImages {
    [self setFrame:CGRectMake(0, 0, 60, 60)];
    self.animationImages = [NSArray arrayWithObjects:
                                 [UIImage imageNamed:kLoadAnimation],
                                 [UIImage imageNamed:kLoadAnimation1],
                                 [UIImage imageNamed:kLoadAnimation2],
                                 [UIImage imageNamed:kLoadAnimation3],
                                 [UIImage imageNamed:kLoadAnimation4],
                                 [UIImage imageNamed:kLoadAnimation5],
                                 [UIImage imageNamed:kLoadAnimation6],
                                 [UIImage imageNamed:kLoadAnimation7],
                                 [UIImage imageNamed:kLoadAnimation8],
                                 [UIImage imageNamed:kLoadAnimation9],
                                 [UIImage imageNamed:kLoadAnimation10],
                                 [UIImage imageNamed:kLoadAnimation11],
                                 [UIImage imageNamed:kLoadAnimation12],
                                 [UIImage imageNamed:kLoadAnimation13],
                                 [UIImage imageNamed:kLoadAnimation14],
                                 [UIImage imageNamed:kLoadAnimation15],
                                 [UIImage imageNamed:kLoadAnimation16],
                                 [UIImage imageNamed:kLoadAnimation17],
                                 [UIImage imageNamed:kLoadAnimation18],
                                 [UIImage imageNamed:kLoadAnimation19],
                                 [UIImage imageNamed:kLoadAnimation20],
                                 [UIImage imageNamed:kLoadAnimation21],
                                 [UIImage imageNamed:kLoadAnimation22],
                                 [UIImage imageNamed:kLoadAnimation23],
                                 [UIImage imageNamed:kLoadAnimation24],
                                 [UIImage imageNamed:kLoadAnimation25],
                                 [UIImage imageNamed:kLoadAnimation26],
                                 [UIImage imageNamed:kLoadAnimation27],
                                 [UIImage imageNamed:kLoadAnimation28],
                                 [UIImage imageNamed:kLoadAnimation29],
                                 [UIImage imageNamed:kLoadAnimation30],
                                 [UIImage imageNamed:kLoadAnimation31],
                                 [UIImage imageNamed:kLoadAnimation32],
                                 [UIImage imageNamed:kLoadAnimation33],
                                 [UIImage imageNamed:kLoadAnimation34],
                                 [UIImage imageNamed:kLoadAnimation35],
                                 [UIImage imageNamed:kLoadAnimation36],
                                 [UIImage imageNamed:kLoadAnimation37],
                                 [UIImage imageNamed:kLoadAnimation38],
                                 [UIImage imageNamed:kLoadAnimation39], nil];
    self.animationDuration = 1.2f;
    self.animationRepeatCount = 900000000;
}

-(void)animate:(UIView *)parentView {
    [self stopAnimation];
    if (parentView != nil) {
        [self setCenter:[parentView center]];
        [parentView addSubview:self];
        [self startAnimating];
    }
}

-(void)stopAnimation {
    [self removeFromSuperview];
    [self stopAnimating];
}

@end
