//
//  HomeCell.h
//  CmdMe
//
//  Created by Charles Camp on 1/8/16.
//  Copyright © 2016 Charles. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContentRealm.h"
#import "BEMSimpleLineGraphView.h"

@interface HomeCell : UITableViewCell <BEMSimpleLineGraphDelegate, BEMSimpleLineGraphDataSource>

-(void)createPlaceholderCell:(ContentRealm *)content;

//View Properties
@property UIImageView *image;
@property UILabel *body;
@property UILabel *title;
@property UIView *cellContainer;
@property BEMSimpleLineGraphView *lineGraph;

@end
