//
//  CmdNavigationViewController.m
//  CmdMe
//
//  Created by Charles Camp on 1/9/16.
//  Copyright © 2016 Charles. All rights reserved.
//

#import "CmdNavigationViewController.h"
#import <Google/Analytics.h>

@interface CmdNavigationViewController ()

@end

@implementation CmdNavigationViewController

@synthesize cmdStoryBoard;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNeedsStatusBarAppearanceUpdate];
    [self addPageView];
    // Do any additional setup after loading the view.
}

#pragma mark - Analytics

-(void)addPageView {
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName value:[NSString stringWithFormat:@"%@", [self class]]];
    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
}

#pragma mark - Initialization

-(id)initWithStoryBoardId:(NSString *)storyBoardID {
    cmdStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self = [cmdStoryBoard instantiateViewControllerWithIdentifier:storyBoardID];
    if (self) {
        
    }
    return self;
}

#pragma mark - Status Bar

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
