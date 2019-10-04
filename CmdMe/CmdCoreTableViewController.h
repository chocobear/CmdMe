//
//  CmdCoreTableViewController.h
//  CmdMe
//
//  Created by Charles on 12/24/15.
//  Copyright (c) 2015 Charles. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RLMObject.h"

@interface CmdCoreTableViewController : UITableViewController

// Data Properties
@property RLMResults *entities;

// Initialization
-(void)initDefaults;

@end
