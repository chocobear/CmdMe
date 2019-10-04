//
//  ContentModel.m
//  CmdMe
//
//  Created by Charles on 12/20/15.
//  Copyright (c) 2015 Charles. All rights reserved.
//

#import "ContentModel.h"

@implementation ContentModel

#pragma mark - Mantle JSONKeyPathsByPropertyKey

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"title": @"title",
             @"imageUrl": @"image",
             @"body": @"body",
             @"url": @"url",
             @"key": @"id"
             };
}

@end
