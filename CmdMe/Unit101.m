//
//  Unit101.m
//  CmdMe
//
//  Created by Charles on 12/24/15.
//  Copyright (c) 2015 Charles. All rights reserved.
//

#import "Unit101.h"
#import "HomeViewController.h"

@implementation Unit101

@synthesize syn;
@synthesize utterance;

-(id)init {
    self = [super init];
    if (self) {
        [utterance setPitchMultiplier:1.3];
        syn = [[AVSpeechSynthesizer alloc] init];
    }
    return self;
}

-(void)speak:(NSString *)text {
    utterance = [AVSpeechUtterance speechUtteranceWithString:text];
    [utterance setRate:0.2];
    [syn speakUtterance:utterance];
}

-(void)setDelegate:(UIViewController *)controller {
    if ([controller isKindOfClass:[HomeViewController class]]) {
        [syn setDelegate:(HomeViewController *)controller];
    }
}

@end
