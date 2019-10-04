//
//  Unit101.h
//  CmdMe
//
//  Created by Charles on 12/24/15.
//  Copyright (c) 2015 Charles. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface Unit101 : NSObject

@property AVSpeechUtterance *utterance;
@property AVSpeechSynthesizer *syn;

-(void)speak:(NSString *)text;

// Delegate Management
-(void)setDelegate:(UIViewController *)controller;

@end
