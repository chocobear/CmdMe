//
//  CmdLabel.h
//  CmdMe
//
//  Created by Charles Camp on 1/9/16.
//  Copyright © 2016 Charles. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
    VerticalAlignmentTop = 0, // default
    VerticalAlignmentMiddle,
    VerticalAlignmentBottom,
} VerticalAlignment;

@interface CmdLabel : UILabel

//Alignment

@property (nonatomic, readwrite) VerticalAlignment verticalAlignment;

//View Setup
-(void)createContentDetailLabel:(NSString *)contentBody;

@end
