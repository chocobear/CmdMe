//
//  CmdSpinner.h
//  CmdMe
//
//  Created by Charles Camp on 1/9/16.
//  Copyright © 2016 Charles. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CmdSpinner : UIImageView

-(id)initSpinner;
-(void)animate:(UIView *)parentView;
-(void)stopAnimation;

@end
