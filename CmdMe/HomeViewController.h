//
//  ViewController.h
//  CmdMe
//
//  Created by Charles on 12/20/15.
//  Copyright (c) 2015 Charles. All rights reserved.
//

#import "CmdCoreViewController.h"
#import "Unit101.h"
#import <Realm/Realm.h>
#import "NavigationView.h"
#import "DetailViewController.h"
#import "CmdNavigationViewController.h"
#import "ProfileViewController.h"

@interface HomeViewController : CmdCoreViewController <UITableViewDelegate, UITableViewDataSource, AVSpeechSynthesizerDelegate, UIScrollViewDelegate>

// Top Secret
@property Unit101 *unit101;

// Data Properties
@property RLMResults *entities;

// View Properties
@property (strong, nonatomic) IBOutlet UITableView *cmdTableView;
@property (strong, nonatomic) IBOutlet UIView *subMenuOverlayLeft;
@property (strong, nonatomic) IBOutlet UIView *subMenuOverlayRight;
@property (strong, nonatomic) IBOutlet UIButton *todayBtn;
@property (weak, nonatomic) IBOutlet NavigationView *navigationOverlay;

//IBActions
- (IBAction)toggleNavigation:(id)sender;
- (IBAction)viewProfile:(id)sender;

//View Controllers
@property CmdNavigationViewController *contentNav;
@property DetailViewController *contentDetail;
@property ProfileViewController *myProfile;

@end