//
//  CmdVideoPlayer.h
//  CmdMe
//
//  Created by Charles on 12/24/15.
//  Copyright (c) 2015 Charles. All rights reserved.
//

#import <MediaPlayer/MediaPlayer.h>

@interface CmdVideoPlayer : MPMoviePlayerController

// Custom Inits
-(id)initForLogin:(UIViewController *)controller;

// Set Default Properties
-(void)initDefaultsForLoginWithContainer:(UIView *)container;

// Play Video
-(void)prepareAndPlay;

@end
