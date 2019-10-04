//
//  CmdNavigationViewController.h
//  CmdMe
//
//  Created by Charles Camp on 1/9/16.
//  Copyright © 2016 Charles. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CmdNavigationViewController : UINavigationController

//Initialization
-(id)initWithStoryBoardId:(NSString *)storyBoardID;

//StoryBoard
@property UIStoryboard *cmdStoryBoard;

@end
