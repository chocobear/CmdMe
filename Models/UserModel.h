//
//  UserModel.h
//  CmdMe
//
//  Created by Charles on 12/20/15.
//  Copyright (c) 2015 Charles. All rights reserved.
//

#import "MTLModel.h"
#import <Mantle/Mantle.h>

@interface UserModel : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;
//@property (nonatomic, copy) NSDate *updatedAt;
//@property (nonatomic, copy) NSDate *createdAt;
@property (nonatomic) int key;

@end
