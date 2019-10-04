//
//  ViewController.m
//  CmdMe
//
//  Created by Charles on 12/20/15.
//  Copyright (c) 2015 Charles. All rights reserved.
//

#import "HomeViewController.h"
#import "ContentListRequestModel.h"
#import "ApiManager.h"
#import <Realm/Realm.h>
#import "ContentRealm.h"
#import "HomeCell.h"
#import "UIView+General.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

//synthesized properties
@synthesize entities;
@synthesize unit101;
@synthesize cmdTableView;
@synthesize subMenuOverlayLeft;
@synthesize subMenuOverlayRight;
@synthesize todayBtn;
@synthesize navigationOverlay;
@synthesize contentDetail;
@synthesize contentNav;
@synthesize myProfile;

// local properties
float lastContentOffset;
CmdSpinner *spinner;

#pragma mark - View Controller State Management

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNeedsStatusBarAppearanceUpdate];
    [self initTopSecret];
    //[self sayHello];
    if ([self connected]) {
        [self showNotConnected];
    } else {
        [self requestUsers];
    }
}

-(void)initDefaults {
    [super initDefaults];
    [self.navigationController setNavigationBarHidden:FALSE];
    [subMenuOverlayLeft addHorizontalGradient:[NSArray arrayWithObjects:(id)[[UIColor orangeColor] CGColor], (id)[[[UIColor whiteColor] colorWithAlphaComponent:0.5] CGColor], nil]];
    [subMenuOverlayRight addHorizontalGradient:[NSArray arrayWithObjects:(id)[[[UIColor whiteColor] colorWithAlphaComponent:0.5] CGColor], (id)[[UIColor orangeColor] CGColor], nil]];
    [todayBtn addRoundedShadow:30.0];
    [[self cmdTableView]  setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [[self cmdTableView] setDelegate:self];
    [[self cmdTableView] setDataSource:self];
    spinner = [[CmdSpinner alloc] initSpinner];
    contentNav = [[CmdNavigationViewController alloc] initWithStoryBoardId:@"detailnav"];
    contentDetail = [[DetailViewController alloc] initWithStoryBoardId:@"detail"];
    myProfile = [[ProfileViewController alloc] initWithStoryBoardId:@"profile"];
}

#pragma mark - Status Bar

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}

#pragma mark - Top Secret

-(void)initTopSecret {
    unit101 = [[Unit101 alloc] init];
    [unit101 setDelegate:self];
}

-(void)sayHello {
    [unit101 speak:@"Hello Charles, My name is Rachel. How can I help you today?"];
}

#pragma mark - View Controller View Management

-(void)requestUsers {
    [spinner animate:[self view]];
    ContentListRequestModel *requestModel = [ContentListRequestModel new];
    [[APIManager sharedManager] getContentWithRequestModel:requestModel
                                                 success:^(ContentListResponseModel *responseModel){
                                                     dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                                                         @autoreleasepool {
                                                             RLMRealm *realm = [RLMRealm defaultRealm];
                                                             [realm beginWriteTransaction];
                                                             [realm deleteAllObjects];
                                                             [realm commitWriteTransaction];
                                                             [realm beginWriteTransaction];
                                                             for(ContentModel *content in responseModel.content) {
                                                                 ContentRealm *contentRealm = [[ContentRealm alloc] initWithMantleModel:content];
                                                                 [realm addObject:contentRealm];
                                                             }
                                                             [realm commitWriteTransaction];
                                                             dispatch_async(dispatch_get_main_queue(), ^{
                                                                 RLMRealm *realmMainThread = [RLMRealm defaultRealm];
                                                                 RLMResults *feeditems = [ContentRealm allObjectsInRealm:realmMainThread];
                                                                 [self setEntities:feeditems];
                                                                 [spinner stopAnimation];
                                                                 [self.cmdTableView reloadData];
                                                             });
                                                         }
                                                     });
                                                 } failure:^(NSError *error) {
                                                     [self setEntities:[ContentRealm allObjects]];
                                                     [spinner stopAnimation];
                                                     [self.cmdTableView reloadData];
                                                 }];
}

#pragma mark - TableView Delegate

-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 250;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (entities != nil && [entities objectAtIndex:indexPath.row]) {
        contentNav.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        contentDetail = (DetailViewController *)[contentNav.viewControllers objectAtIndex:0];
        [contentDetail createDetailForContent:[entities objectAtIndex:indexPath.row]];
        [self presentViewController:contentNav animated:YES completion:nil];
    }
}

#pragma mark - TableView DataSource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *placeHolderCellIdentifier = @"placeHolderIdentifier";
    HomeCell *cell = [tableView dequeueReusableCellWithIdentifier:placeHolderCellIdentifier];
    if (entities != nil && [entities objectAtIndex:indexPath.row]) {
        [cell createPlaceholderCell:[entities objectAtIndex:indexPath.row]];
    }
    return cell;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (entities != nil && [entities count] > 0) {
        return [entities count];
    } else {
        return 0;
    }
}

#pragma mark - Unit 101 Delegate

- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer willSpeakRangeOfSpeechString:(NSRange)characterRange utterance:(AVSpeechUtterance *)utterance {
    float titleAlpha = [[self.navigationItem titleView] alpha];
    if (titleAlpha <= 0) {
        [UIView animateWithDuration:0.1 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            [[self.navigationItem titleView] setAlpha:1.0];
        } completion:nil];
        
    } else if (titleAlpha == 1) {
        [UIView animateWithDuration:0.1 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            [[self.navigationItem titleView] setAlpha:0.0];
        } completion:nil];
    }
}

-(void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didFinishSpeechUtterance:(AVSpeechUtterance *)utterance {
    [UIView animateWithDuration:0.1 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [[self.navigationItem titleView] setAlpha:1.0];
    } completion:nil];
}

#pragma mark - Scroll View Delegate

/*
 -(void)scrollViewDidScroll:(UIScrollView *)scrollView {
 UIView *navigationBar = self.navigationController.navigationBar;
 CGRect navigationBarFrame = navigationBar.frame;
 CGFloat currentOffset = scrollView.contentOffset.y;
 CGFloat offsetDifference = abs(lastContentOffset - currentOffset);
 float navOriginY = [navigationBar frame].origin.y;
 float maxAnimateUp = -[navigationBar frame].size.height;
 float maxAnimateDown = 20;
 if (!(navOriginY < maxAnimateUp) || !(navOriginY > maxAnimateDown)) {
 ScrollDirection scrollDirection;
 if (self.lastContentOffset > scrollView.contentOffset.y)
 scrollDirection = ScrollDirectionUp;
 else if (self.lastContentOffset < scrollView.contentOffset.y)
 scrollDirection = ScrollDirectionDown;
 if (scrollDirection == ScrollDirectionUp && !(CGRectGetMinY(navigationBarFrame) + offsetDifference > maxAnimateDown)) {
 [navigationBar setFrame:CGRectMake(CGRectGetMinX(navigationBarFrame), CGRectGetMinY(navigationBarFrame) + offsetDifference, CGRectGetWidth(navigationBarFrame), CGRectGetHeight(navigationBarFrame))];
 } else if (scrollDirection == ScrollDirectionDown && !(CGRectGetMinY(navigationBarFrame) - offsetDifference < maxAnimateUp)) {
 [navigationBar setFrame:CGRectMake(CGRectGetMinX(navigationBarFrame), CGRectGetMinY(navigationBarFrame) - offsetDifference, CGRectGetWidth(navigationBarFrame), CGRectGetHeight(navigationBarFrame))];
 }
 }
 lastContentOffset = scrollView.contentOffset.y;
 }
 
 -(void)scrollViewDidScrollToTop:(UIScrollView *)scrollView {
 UIView *navigationBar = self.navigationController.navigationBar;
 CGRect navigationBarFrame = navigationBar.frame;
 [navigationBar setFrame:CGRectMake(CGRectGetMaxX(navigationBarFrame), 0, CGRectGetWidth(navigationBarFrame), CGRectGetHeight(navigationBarFrame))];
 }
 */

#pragma mark - Memory Management

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Today Navigation

- (IBAction)toggleNavigation:(id)sender {
    if (![navigationOverlay isShown]) {
        [navigationOverlay animateUp];
    } else {
        [navigationOverlay animateDown];
    }
}

- (IBAction)viewProfile:(id)sender {
    [[self navigationController] pushViewController:[self myProfile] animated:YES];
}

@end
