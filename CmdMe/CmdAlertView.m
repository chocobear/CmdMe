//
//  CmdAlertView.m
//  CmdMe
//
//  Created by Charles Camp on 1/9/16.
//  Copyright © 2016 Charles. All rights reserved.
//

#import "CmdAlertView.h"

@implementation CmdAlertView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+(id)sharedAlertWithTitle:(NSString *)title message:(NSString *)message CancelButtonTitle:(NSString *)cancelButtonTitle {
    UIAlertView *sharedAlertView = [CmdAlertView sharedAlertView];
    [sharedAlertView setTitle:title];
    [sharedAlertView setMessage:message];
    [sharedAlertView setCancelButtonIndex:[sharedAlertView addButtonWithTitle:cancelButtonTitle]];
    return sharedAlertView;
}

+ (id)sharedAlertView {
    static UIAlertView *_alertView = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _alertView = [[self alloc] init];
    });
    
    return _alertView;
}

@end
