//
//  UIImage+General.m
//  CmdMe
//
//  Created by Charles Camp on 1/9/16.
//  Copyright © 2016 Charles. All rights reserved.
//

#import "UIImage+Button.h"

@implementation UIImage (Button)

+(UIImage *)customBackButtonImage {
    return [[UIImage imageNamed:@"Icon-Back-Button"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 13, 0, 7)];
}

@end
