//
//  UrlListResponseModel.m
//  CmdMe
//
//  Created by Charles on 12/20/15.
//  Copyright (c) 2015 Charles. All rights reserved.
//

#import "UserListResponseModel.h"

@class UserModel;

@implementation UserListResponseModel

#pragma mark - Mantle JSONKeyPathsByPropertyKey

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
        @"users" : @"Data"
    };
}

#pragma mark - JSON Transformer

+ (NSValueTransformer *)usersJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:UserModel.class];
}

@end
