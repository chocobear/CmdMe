//
//  CmdCoreTableViewController.m
//  CmdMe
//
//  Created by Charles on 12/24/15.
//  Copyright (c) 2015 Charles. All rights reserved.
//

#import "CmdCoreTableViewController.h"
#import "CmdAlertView.h"
#import <Google/Analytics.h>

@implementation CmdCoreTableViewController

@synthesize entities;
@synthesize cmdStoryBoard;

#pragma mark - View Controller State Management

-(void)viewDidLoad {
    [self initDefaults];
}

-(void)addPageView {
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName value:[NSString stringWithFormat:@"%@", [self class]]];
    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
}

#pragma mark - Initialization

-(void)initDefaults {
    [self.navigationController setNavigationBarHidden:FALSE];
    [self addPageView];
}

-(id)initWithStoryBoardId:(NSString *)storyBoardID {
    cmdStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self = [cmdStoryBoard instantiateViewControllerWithIdentifier:storyBoardID];
    if (self) {
        
    }
    return self;
}

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
