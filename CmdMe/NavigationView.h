//
//  NavigationView.h
//  CmdMe
//
//  Created by Charles Camp on 1/9/16.
//  Copyright © 2016 Charles. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NavigationView : UIView

@property BOOL isShown;

-(void)animateUp;
-(void)animateDown;
-(id)initNaviagation;

@end
