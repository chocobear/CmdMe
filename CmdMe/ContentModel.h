//
//  ContentModel.h
//  CmdMe
//
//  Created by Charles on 12/20/15.
//  Copyright (c) 2015 Charles. All rights reserved.
//

#import "MTLModel.h"
#import <Mantle/Mantle.h>

@interface ContentModel : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy) NSString *imageUrl;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *body;
@property (nonatomic, copy) NSString *url;
//@property (nonatomic, copy) NSDate *updatedAt;
//@property (nonatomic, copy) NSDate *createdAt;
@property (nonatomic) int key;

@end
