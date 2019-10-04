//
//  ApiManager.h
//  CmdMe
//
//  Created by Charles on 12/20/15.
//  Copyright (c) 2015 Charles. All rights reserved.
//

#import "SessionManager.h"
#import "UserListRequestModel.h"
#import "UserListResponseModel.h"
#import "ContentListRequestModel.h"
#import "ContentListResponseModel.h"

@interface APIManager : SessionManager

- (NSURLSessionDataTask *)getUsersWithRequestModel:(UserListRequestModel *)requestModel success:(void (^)(UserListResponseModel *responseModel))success failure:(void (^)(NSError *error))failure;

- (NSURLSessionDataTask *)getContentWithRequestModel:(ContentListRequestModel *)requestModel success:(void (^)(ContentListResponseModel *responseModel))success failure:(void (^)(NSError *error))failure;

@end

@interface ApiManager : SessionManager

@end
