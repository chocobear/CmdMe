//
//  CmdCoreTableViewController.h
//  CmdMe
//
//  Created by Charles on 12/24/15.
//  Copyright (c) 2015 Charles. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Realm/Realm.h>
#import <AFNetworking/AFNetworking.h>
#import "CmdSpinner.h"
#import <AVFoundation/AVFoundation.h>
#import "CmdAudioPlayer.h"

@interface CmdCoreTableViewController : UITableViewController <AVAudioPlayerDelegate>

// Data Properties
@property RLMResults *entities;

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
