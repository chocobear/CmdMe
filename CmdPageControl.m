//
//  CmdLoginPageControl.m
//  CmdMe
//
//  Created by Charles on 12/24/15.
//  Copyright (c) 2015 Charles. All rights reserved.
//

#import "CmdPageControl.h"
#import "LoginViewController.h"

@implementation CmdPageControl

@synthesize pageImageArray;
@synthesize pageLabelArray;
@synthesize pageViewControllers;
@synthesize currentImg;
@synthesize currentLabel;
@synthesize pageScroll;

#pragma mark - Initialization

-(id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        pageImageArray = [[NSArray alloc] initWithObjects:@"Graph", @"Graph", @"Graph", nil];
        pageLabelArray = [[NSArray alloc] initWithObjects:@"Grow your productivity.", @"Grow your productivity.", @"Grow your productivity.", nil];
    }
    return self;
}

-(void)initCurrentDefaults:(UIImageView *)imgCurrent withLabel:(UILabel *)lblCurrent andScrollView:(UIScrollView *)scroll {
    [self setCurrentImg:imgCurrent];
    [self setCurrentLabel:lblCurrent];
    [self setPageScroll:scroll];
}

-(void)createPageControl:(UIViewController *)controller {
    if ([controller isKindOfClass:[LoginViewController class]]) {
        [currentImg setImage:[UIImage imageNamed:@"Graph"]];
        NSMutableArray *controllers = [[NSMutableArray alloc] init];
        for (int n = 0; n < 3; n++) {
            [controllers addObject:[NSNull null]];
        }
        pageViewControllers = controllers;
        [pageScroll setPagingEnabled:YES];
        [pageScroll setContentSize:CGSizeMake(CGRectGetWidth(pageScroll.frame) * 3, CGRectGetHeight(pageScroll.frame))];
        [pageScroll setShowsHorizontalScrollIndicator:NO];
        [pageScroll setShowsVerticalScrollIndicator:NO];
        [pageScroll setScrollsToTop:NO];
        [pageScroll setDelegate:(LoginViewController *)controller];
        [self setNumberOfPages:3];
        [self setCurrentPage:0];
        [self loadScrollViewWithPage:0 andLoginViewController:(LoginViewController *)controller];
        [self loadScrollViewWithPage:1 andLoginViewController:(LoginViewController *)controller];
        [self loadScrollViewWithPage:2 andLoginViewController:(LoginViewController *)controller];
    }
}

- (void)loadScrollViewWithPage:(NSUInteger)page andLoginViewController:(LoginViewController *)loginController {
    if (page >= pageImageArray.count)
        return;
    
    UIViewController *controller = [pageViewControllers objectAtIndex:page];
    if ((NSNull *)controller == [NSNull null]) {
        controller = [[UIViewController alloc] init];
        [pageViewControllers replaceObjectAtIndex:page withObject:controller];
    }
    if (controller.view.superview == nil) {
        CGRect frame = pageScroll.frame;
        frame.origin.x = CGRectGetWidth(frame) * page;
        frame.origin.y = 0;
        controller.view.frame = frame;
        [loginController addChildViewController:controller];
        UILabel *tutLabel = [[UILabel alloc] initWithFrame:[currentLabel frame]];
        [tutLabel setFont:[currentLabel font]];
        [tutLabel setTextColor:[currentLabel textColor]];
        [tutLabel setText:[pageLabelArray objectAtIndex:page]];
        [tutLabel setTextAlignment:NSTextAlignmentCenter];
        UIImageView *iView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[pageImageArray objectAtIndex:page]]];
        [iView setFrame:[currentImg frame]];
        iView.contentMode = UIViewContentModeScaleAspectFit;
        [controller.view addSubview:iView];
        [controller.view addSubview:tutLabel];
        [pageScroll addSubview:controller.view];
        [controller didMoveToParentViewController:loginController];
    }
}

@end
