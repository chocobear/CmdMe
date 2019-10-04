//
//  ContentRealm.h
//  CmdMe
//
//  Created by Charles on 12/20/15.
//  Copyright (c) 2015 Charles. All rights reserved.
//

#import <Realm/Realm.h>
#import "ContentModel.h"

@interface ContentRealm : RLMObject

@property (nonatomic, copy) NSString *imageUrl;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *body;
@property (nonatomic, copy) NSString *url;

- (id)initWithMantleModel:(ContentModel *)contentModel;

@end
