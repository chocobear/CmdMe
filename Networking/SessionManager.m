//
//  SessionManager.m
//  CmdMe
//
//  Created by Charles on 12/20/15.
//  Copyright (c) 2015 Charles. All rights reserved.
//

#import "SessionManager.h"
#import "AppDelegate.h"

static NSString *const kBaseURL = @"http://ec2-54-85-110-170.compute-1.amazonaws.com:1338";

@implementation SessionManager

- (id)init {
    self = [super initWithBaseURL:[NSURL URLWithString:((AppDelegate *)[UIApplication sharedApplication].delegate).apiUrl]];
    if(self) {
        self.responseSerializer = [AFJSONResponseSerializer serializer];
        self.requestSerializer = [AFJSONRequestSerializer serializer];
    }
    return self;
}

+ (id)sharedManager {
    static SessionManager *_sessionManager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sessionManager = [[self alloc] init];
    });
    
    return _sessionManager;
}

@end

