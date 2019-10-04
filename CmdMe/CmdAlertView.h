//
//  CmdAlertView.h
//  CmdMe
//
//  Created by Charles Camp on 1/9/16.
//  Copyright © 2016 Charles. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CmdAlertView : UIAlertView

+(id)sharedAlertWithTitle:(NSString *)title message:(NSString *)message CancelButtonTitle:(NSString *)cancelButtonTitle;

@end
