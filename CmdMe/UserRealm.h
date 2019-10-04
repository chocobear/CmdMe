//
//  UserRealm.h
//  CmdMe
//
//  Created by Charles on 12/20/15.
//  Copyright (c) 2015 Charles. All rights reserved.
//

#import "RLMObject.h"
#import "UserModel.h"

@interface UserRealm : RLMObject

@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;

- (id)initWithMantleModel:(UserModel *)userModel;

@end
