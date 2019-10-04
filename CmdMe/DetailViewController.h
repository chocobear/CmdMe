//
//  DetailViewController.h
//  CmdMe
//
//  Created by Charles Camp on 1/9/16.
//  Copyright © 2016 Charles. All rights reserved.
//

#import "CmdCoreViewController.h"
#import "ContentRealm.h"
#import "CmdLabel.h"

@interface DetailViewController : CmdCoreViewController

-(void)createDetailForContent:(ContentRealm *)content;

//Close View Controller
- (IBAction)close:(id)sender;

//View Properties
@property (weak, nonatomic) IBOutlet CmdLabel *body;
@property (weak, nonatomic) IBOutlet UIImageView *defaultImage;

@end
