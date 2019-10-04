//
//  ApiManager.m
//  CmdMe
//
//  Created by Charles on 12/20/15.
//  Copyright (c) 2015 Charles. All rights reserved.
//

#import "APIManager.h"
#import "Mantle.h"

static NSString *const kUsersListPath = @"/user";
static NSString *const kApiKey = @"cmd_internal_key";

@implementation APIManager

- (NSURLSessionDataTask *)getUsersWithRequestModel:(UserListRequestModel *)requestModel
                                              success:(void (^)(UserListResponseModel *responseModel))success
                                              failure:(void (^)(NSError *error))failure{
    
    NSDictionary *parameters = [MTLJSONAdapter JSONDictionaryFromModel:requestModel error:nil];
    NSMutableDictionary *parametersWithKey = [[NSMutableDictionary alloc] initWithDictionary:parameters];
    // uncomment for api key
    //[parametersWithKey setObject:kApiKey forKey:@"api_key"];
    
    return [self GET:kUsersListPath parameters:parametersWithKey
             success:^(NSURLSessionDataTask *task, id responseObject) {
                 NSDictionary *responseDictionary = (NSDictionary *)responseObject;
                 NSError *error;
                 UserListResponseModel *list = [MTLJSONAdapter modelOfClass:UserListResponseModel.class fromJSONDictionary:responseDictionary error:&error];
                 success(list);
             } failure:^(NSURLSessionDataTask *task, NSError *error) {
                 failure(error);
             }];
}

@end
