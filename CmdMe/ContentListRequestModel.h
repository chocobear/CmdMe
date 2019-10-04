//
//  ContentListRequestModel.h
//  CmdMe
//
//  Created by Charles on 12/20/15.
//  Copyright (c) 2015 Charles. All rights reserved.
//

#import "MTLModel.h"
#import "Mantle.h"
#import "ContentModel.h"

@interface ContentListRequestModel : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy) NSString *query;

+ (NSDateFormatter *)dateFormatter;

@end
