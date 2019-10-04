//
//  CmdCoreTableViewController.m
//  CmdMe
//
//  Created by Charles on 12/24/15.
//  Copyright (c) 2015 Charles. All rights reserved.
//

#import "CmdCoreTableViewController.h"

@implementation CmdCoreTableViewController

@synthesize entities;

#pragma mark - View Controller State Management

-(void)viewDidLoad {
    [self initDefaults];
}

#pragma mark - Initialization

-(void)initDefaults {
    [self.navigationController setNavigationBarHidden:FALSE];
}

@end
