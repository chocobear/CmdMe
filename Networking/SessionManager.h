//
//  SessionManager.h
//  CmdMe
//
//  Created by Charles on 12/20/15.
//  Copyright (c) 2015 Charles. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface SessionManager : AFHTTPSessionManager

+ (id)sharedManager;

@end
