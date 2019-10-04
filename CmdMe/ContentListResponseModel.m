//
//  ContentListResponseModel.m
//  CmdMe
//
//  Created by Charles on 12/20/15.
//  Copyright (c) 2015 Charles. All rights reserved.
//

#import "ContentListResponseModel.h"

@class ContentModel;

@implementation ContentListResponseModel

#pragma mark - Mantle JSONKeyPathsByPropertyKey

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"content" : @"Data"
             };
}

#pragma mark - JSON Transformer

+ (NSValueTransformer *)contentJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:ContentModel.class];
}

@end
