//
//  ProfileViewController.m
//  CmdMe
//
//  Created by Charles Camp on 1/9/16.
//  Copyright © 2016 Charles. All rights reserved.
//

#import "ProfileViewController.h"
#import "UIView+General.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController
@synthesize profilePic;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)initDefaults {
    [super initDefaults];
    [profilePic addBorder:20 withColor:[UIColor orangeColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
