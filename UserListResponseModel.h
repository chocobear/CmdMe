//
//  UserListResponseModel.h
//  CmdMe
//
//  Created by Charles on 12/20/15.
//  Copyright (c) 2015 Charles. All rights reserved.
//

#import "MTLModel.h"
#import <Mantle/Mantle.h>
#import "UserModel.h"


@interface UserListResponseModel : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy) NSArray *users;

@end
