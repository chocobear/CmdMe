//
//  CmdCoreViewController.h
//  CmdMe
//
//  Created by Charles on 12/22/15.
//  Copyright (c) 2015 Charles. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking/AFNetworking.h>
#import "CmdSpinner.h"
#import <AVFoundation/AVFoundation.h>
#import "CmdAudioPlayer.h"

@interface CmdCoreViewController : UIViewController <UIAlertViewDelegate, AVAudioPlayerDelegate>

// Initialization
-(void)initDefaults;
-(id)initWithStoryBoardId:(NSString *)storyBoardID;

//Networking
- (BOOL)connected;
-(void)showNotConnected;
-(void)showNotConnected:(CmdSpinner *)spinner;

//Sound
@property CmdAudioPlayer *audioPlayer;

//StoryBoard
@property UIStoryboard *cmdStoryBoard;

@end
