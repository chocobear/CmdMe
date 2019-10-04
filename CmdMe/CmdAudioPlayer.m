//
//  CmdAudioPlayer.m
//  CmdMe
//
//  Created by Charles Camp on 1/9/16.
//  Copyright © 2016 Charles. All rights reserved.
//

#import "CmdAudioPlayer.h"
#import "CmdCoreViewController.h"

@implementation CmdAudioPlayer

-(id)initForLogin:(UIViewController *)controller {
    self = [self initDefaultsForLogin];
    if (self) {
        if ([controller isKindOfClass:[CmdCoreViewController class]]) {
            [self setDelegate:(CmdCoreViewController *)controller];
        }
    }
    return self;
}

-(id)initDefaultsForLogin {
    NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:@"Login" ofType:@"mp3"];
    NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];
    CmdAudioPlayer *player = [[CmdAudioPlayer alloc] initWithContentsOfURL:soundFileURL error:nil];
    return player;
}

-(void)prepareAndPlay {
    self.numberOfLoops = -1;
    [self play];
}

@end
