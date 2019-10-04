//
//  AWSManager.h
//  CmdMe
//
//  Created by Charles Camp on 1/9/16.
//  Copyright © 2016 Charles. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AWSManager : NSObject

-(void)uploadImage:(UIImage *)image;
-(UIImage *) getImageFromPath:(NSString *)filePath;

@end
