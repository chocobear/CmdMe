//
//  ContentRealm.m
//  CmdMe
//
//  Created by Charles on 12/20/15.
//  Copyright (c) 2015 Charles. All rights reserved.
//

#import "ContentRealm.h"

@implementation ContentRealm

- (id)initWithMantleModel:(ContentModel *)contentModel {
    self = [super init];
    if(!self) return nil;
    
    self.title = contentModel.title;
    self.imageUrl = contentModel.imageUrl;
    self.body = contentModel.body;
    self.url = contentModel.url;
    
    return self;
}

@end
