//
//  CmdVideoPlayer.m
//  CmdMe
//
//  Created by Charles on 12/24/15.
//  Copyright (c) 2015 Charles. All rights reserved.
//

#import "CmdVideoPlayer.h"
#import "LoginViewController.h"

@implementation CmdVideoPlayer

//NSString *path = [NSString stringWithFormat:@"https://youtu.be/iX0UgVgwKJ8"];
//NSURL *url = [NSURL URLWithString:path];
//NSString *path = [NSString stringWithFormat:@"%@/daftpunk.mp4", [[NSBundle mainBundle] resourcePath]];

#pragma mark - Initialization

-(id)initForLogin:(UIViewController *)controller {
    self = [super initWithContentURL:[NSURL fileURLWithPath:@"/Users/ccamp/Desktop/CmdMe/CmdMe/trim.mp4"]];
    if (self) {
        if ([controller isKindOfClass:[LoginViewController class]]) {
            [self addNotificationListenerForLogin:(LoginViewController *)controller];
        }
    }
    return self;
}

-(void)initDefaultsForLoginWithContainer:(UIView *)container {
    [self prepareToPlay];
    [self setControlStyle:MPMovieControlStyleNone];
    [self.view setFrame:[container frame]];
    [self.view setBackgroundColor:[container backgroundColor]];
    [self setScalingMode:MPMovieScalingModeAspectFill];
    [self setCurrentPlaybackRate:0.1f];
    [container addSubview:[self view]];
}

#pragma mark - Play

-(void)prepareAndPlay {
    [self prepareToPlay];
    [self play];
}

#pragma mark - Listeners

-(void)addNotificationListenerForLogin:(LoginViewController *)loginController {
    [[NSNotificationCenter defaultCenter] addObserver:loginController
                                             selector:@selector(moviePreloadDidFinish:)
                                                 name:MPMoviePlayerLoadStateDidChangeNotification
                                               object:self];
    [[NSNotificationCenter defaultCenter] addObserver:loginController
                                             selector:@selector(moviePlayBackDidFinish:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:self];
    
    [[NSNotificationCenter defaultCenter] addObserver:loginController
                                             selector:@selector(moviePlayBackDidFinish:)
                                                 name:MPMoviePlayerPlaybackStateDidChangeNotification
                                               object:self];
    
    [[NSNotificationCenter defaultCenter] addObserver:loginController
                                             selector:@selector(movieNowPlaying:)
                                                 name:MPMoviePlayerNowPlayingMovieDidChangeNotification
                                               object:self];
}

@end
