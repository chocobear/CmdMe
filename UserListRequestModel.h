//
//  UserListRequestModel.h
//  CmdMe
//
//  Created by Charles on 12/20/15.
//  Copyright (c) 2015 Charles. All rights reserved.
//

#import "MTLModel.h"
#import "Mantle.h"
#import "UserModel.h"

@interface UserListRequestModel : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy) NSString *query;
@property (nonatomic, copy) NSDate *birthDate;
@property (nonatomic, copy) NSString *email;

+ (NSDateFormatter *)dateFormatter;

@end
