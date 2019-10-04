//
//  CmdAudioPlayer.h
//  CmdMe
//
//  Created by Charles Camp on 1/9/16.
//  Copyright © 2016 Charles. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>
#import <UIKit/UIKit.h>

@interface CmdAudioPlayer : AVAudioPlayer

// Custom Inits
-(id)initForLogin:(UIViewController *)controller;

// Set Default Properties
-(id)initDefaultsForLogin;

// Play Sound
-(void)prepareAndPlay;


@end