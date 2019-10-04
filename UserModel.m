//
//  UserModel.m
//  CmdMe
//
//  Created by Charles on 12/20/15.
//  Copyright (c) 2015 Charles. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel

#pragma mark - Mantle JSONKeyPathsByPropertyKey

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
        @"firstName": @"firstName",
        @"lastName": @"lastName",
        //@"updatedAt": @"updatedAt",
        //@"createdAt": @"createdAt",
        @"key": @"id"
    };
}

@end
