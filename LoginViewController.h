//
//  LoginViewcontroller.h
//  CmdMe
//
//  Created by Charles on 12/24/15.
//  Copyright (c) 2015 Charles. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CmdCoreViewController.h"
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <POP/POP.h>
#import "Unit101.h"
#import "CmdVideoPlayer.h"
#import "CmdPageControl.h"

@interface LoginViewController : CmdCoreViewController <POPAnimationDelegate, UIScrollViewDelegate>

// View Properties
@property CmdVideoPlayer *videoPlayer;
@property (strong, nonatomic) IBOutlet UIView *videoPlayerContainer;
@property (strong, nonatomic) IBOutlet UIImageView *cmdMeIcon;
@property (strong, nonatomic) IBOutlet FBSDKLoginButton *facebookLoginBtn;
@property (strong, nonatomic) IBOutlet CmdPageControl *loginPageControl;
@property (strong, nonatomic) IBOutlet UIImageView *tutImg;
@property (strong, nonatomic) IBOutlet UIScrollView *tutScroll;
@property (strong, nonatomic) IBOutlet UILabel *tutLbl;
@property NSTimer *bounceLogo;

// Top Secret
@property Unit101 *unit101;

// Notification Listeners
-(void)moviePreloadDidFinish:(MPMoviePlayerController *)video;
-(void)moviePlayBackDidFinish:(MPMoviePlayerController *)video;
-(void)movieNowPlaying:(MPMoviePlayerController *)video;
-(void)moviePlayBackChanged:(MPMoviePlayerController *)video;

// View Actions
- (IBAction)goHome:(id)sender;

@end
