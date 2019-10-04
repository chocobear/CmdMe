//
//  CmdCoreViewController.m
//  CmdMe
//
//  Created by Charles on 12/22/15.
//  Copyright (c) 2015 Charles. All rights reserved.
//

#import "CmdCoreViewController.h"
#import "CmdAlertView.h"
#import <Google/Analytics.h>

@implementation CmdCoreViewController

@synthesize cmdStoryBoard;

#pragma mark - View Controller State Management

-(void)viewDidLoad {
    [self initDefaults];
}

#pragma mark - Analytics

-(void)addPageView {
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName value:[NSString stringWithFormat:@"%@", [self class]]];
    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
}

#pragma mark - Initialization

-(void)initDefaults {
    [self addPageView];
}

-(id)initWithStoryBoardId:(NSString *)storyBoardID {
    cmdStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self = [cmdStoryBoard instantiateViewControllerWithIdentifier:storyBoardID];
    if (self) {
        
    }
    return self;
}

#pragma mark - Networking

- (BOOL)connected {
    return [AFNetworkReachabilityManager sharedManager].reachable;
}

#pragma mark - Alerts

-(void)showNotConnected {
    [self showNotConnected:nil];
}

-(void)showNotConnected:(CmdSpinner *)spinner {
    if (spinner != nil) {
        [spinner stopAnimation];
    }
    CmdAlertView *notConnectedAlert = [CmdAlertView sharedAlertWithTitle:@"Oops" message:@"Looks like you are not connected. Our app requires an internet connection." CancelButtonTitle:@"Cancel"];
    [notConnectedAlert show];
}

@end
