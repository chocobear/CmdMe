//
//  DetailViewController.m
//  CmdMe
//
//  Created by Charles Camp on 1/9/16.
//  Copyright © 2016 Charles. All rights reserved.
//

#import "DetailViewController.h"
#import "UIImageView+AFNetworking.h"
#import "UIImageView+General.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize body;
@synthesize defaultImage;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - Initialization

-(id)initWithStoryBoardId:(NSString *)storyBoardID {
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(void)initDefaults {
    [super initDefaults];
    [self hideNavigation];
}

-(void)hideNavigation {
     self.edgesForExtendedLayout = UIRectEdgeAll;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)createDetailForContent:(ContentRealm *)content {
    [[self navigationItem] setTitle:[content title]];
    [[self body] createContentDetailLabel:[content body]];
    if (content.imageUrl != nil) {
        [[self defaultImage] addGradient];
        [[self defaultImage] setImageWithURL:[NSURL URLWithString:content.imageUrl] placeholderImage:nil];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)close:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
