//
//  UserRealm.m
//  CmdMe
//
//  Created by Charles on 12/20/15.
//  Copyright (c) 2015 Charles. All rights reserved.
//

#import "UserRealm.h"

@implementation UserRealm

- (id)initWithMantleModel:(UserModel *)userModel {
    self = [super init];
    if(!self) return nil;
    self.firstName = userModel.firstName;
    self.lastName = userModel.lastName;
    return self;
}

@end
