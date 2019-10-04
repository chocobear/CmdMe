//
//  LoginViewcontroller.m
//  CmdMe
//
//  Created by Charles on 12/24/15.
//  Copyright (c) 2015 Charles. All rights reserved.
//

#import "LoginViewController.h"
#import "UIView+Pop.h"
#import "HomeViewController.h"

@implementation LoginViewController

@synthesize videoPlayerContainer;
@synthesize videoPlayer;
@synthesize facebookLoginBtn;
@synthesize tutImg;
@synthesize tutLbl;
@synthesize tutScroll;
@synthesize cmdMeIcon;
@synthesize bounceLogo;
@synthesize unit101;
@synthesize loginPageControl;

#pragma mark - View Controller State Management

-(void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Initialization

-(void)initDefaults {
    [super initDefaults];
    [self initTopSecret];
    [self initVideoPlayer];
    [self timeBounceLogo];
    [self initCmdPage];
}

#pragma mark - Page Control

-(void)initCmdPage {
    [loginPageControl initCurrentDefaults:tutImg withLabel:tutLbl andScrollView:tutScroll];
    [loginPageControl createPageControl:self];
}

#pragma mark - Scroll View Delegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat pageWidth = CGRectGetWidth(loginPageControl.pageScroll.frame);
    NSUInteger page = floor((loginPageControl.pageScroll.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    loginPageControl.currentPage = page;
    [UIView transitionWithView:tutImg
                      duration:0.5f
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^{
                        [tutImg setImage:[UIImage imageNamed:[loginPageControl.pageImageArray objectAtIndex:page]]];
                        [tutLbl setText:[loginPageControl.pageLabelArray objectAtIndex:page]];
                    } completion:NULL];
}

#pragma mark - NSTimer

-(void)timeBounceLogo {
    bounceLogo = [NSTimer scheduledTimerWithTimeInterval:3.5 target:cmdMeIcon selector:@selector(bounceWithRepeat) userInfo:nil repeats:NO];
}

#pragma mark - Top Secret

// Initialization

-(void)initTopSecret {
    unit101 = [[Unit101 alloc] init];
}

#pragma mark - Video Player

-(void)initVideoPlayer {
    videoPlayer = [[CmdVideoPlayer alloc] initForLogin:self];
    [videoPlayer initDefaultsForLoginWithContainer:videoPlayerContainer];
    [videoPlayer prepareAndPlay];
}

-(void)stopVideoPlayer {
    [videoPlayer stop];
}


#pragma mark - Video Player Listeners

-(void)moviePreloadDidFinish:(MPMoviePlayerController *)video {
    
}

-(void)moviePlayBackDidFinish:(MPMoviePlayerController *)video {
    
}

-(void)movieNowPlaying:(MPMoviePlayerController *)video {
    
}

-(void)moviePlayBackChanged:(MPMoviePlayerController *)video {
    
}

#pragma mark - View Actions

- (IBAction)goHome:(id)sender {
    [self stopVideoPlayer];
    HomeViewController *home = [self.storyboard instantiateViewControllerWithIdentifier:@"home"];
    NSArray *newViewControllers = [NSArray arrayWithObjects:home, nil];
    [self.navigationController setViewControllers:newViewControllers];
}



@end
