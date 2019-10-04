//
//  AWSManager.m
//  CmdMe
//
//  Created by Charles Camp on 1/9/16.
//  Copyright © 2016 Charles. All rights reserved.
//

#import "AWSManager.h"
#import <AWSS3/AWSS3.h>

#define kAWSS3Bucket @"cmdme"
#define kAWSS3Url @"http://cmdme.s3-website-us-west-2.amazonaws.com"

@implementation AWSManager

-(void)uploadImage:(UIImage *)image {
    AWSS3TransferManager *transferManager = [AWSS3TransferManager defaultS3TransferManager];
    UIImage* imageToUpload = image;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    //create unique date string
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
    
    NSString *filePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.png", [dateFormatter stringFromDate:[NSDate date]]]];
    [UIImagePNGRepresentation(imageToUpload) writeToFile:filePath atomically:YES];
    NSURL* fileUrl = [NSURL fileURLWithPath:filePath];
    //upload the image
    AWSS3TransferManagerUploadRequest *uploadRequest = [AWSS3TransferManagerUploadRequest new];
    uploadRequest.body = fileUrl;
    uploadRequest.bucket = kAWSS3Bucket;
    uploadRequest.key = [dateFormatter stringFromDate:[NSDate date]];
    uploadRequest.contentType = @"image/png";
    [[transferManager upload:uploadRequest] continueWithExecutor:[AWSExecutor mainThreadExecutor] withBlock:^id(AWSTask *task) {
        if(task.error == nil) {
            NSLog(@"error uploading image ");
        }
        return nil;
    }];
}

-(UIImage *) getImageFromPath:(NSString *)filePath {
    UIImage * result;
    NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@", kAWSS3Url, filePath]]];
    result = [UIImage imageWithData:data];
    return result;
}

@end
