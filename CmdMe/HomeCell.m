//
//  HomeCell.m
//  CmdMe
//
//  Created by Charles Camp on 1/8/16.
//  Copyright © 2016 Charles. All rights reserved.
//

#import "HomeCell.h"
#import "ContentRealm.h"
#import "UIImageView+AFNetworking.h"

@implementation HomeCell

@synthesize image;
@synthesize body;
@synthesize title;
@synthesize cellContainer;
@synthesize lineGraph;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)createPlaceholderCell:(ContentRealm *)content {
    [self deallocCell];
    [self initContentCell];
    [self updateCellWithContentData:content];
}

-(void)updateCellWithContentData:(ContentRealm *)content {
    if (content.imageUrl != nil) {
        [[self image] setImageWithURL:[NSURL URLWithString:content.imageUrl] placeholderImage:nil];
    }
    [[self title] setText:content.title];
    [[self body] setText:content.body];
}

-(void)initContentCell {
    [self setBackgroundColor:[UIColor clearColor]];
    [self setImage:(UIImageView *)[self.contentView viewWithTag:4]];
    [self setTitle:(UILabel *)[self.contentView viewWithTag:2]];
    [self setBody:(UILabel *)[self.contentView viewWithTag:3]];
    [self setCellContainer:(UIView *)[self.contentView viewWithTag:1]];
    [self setLineGraph:(BEMSimpleLineGraphView *)[self.contentView viewWithTag:6]];
    [[self lineGraph] setEnableBezierCurve:YES];
    [[self lineGraph] setDataSource:self];
    [[self lineGraph] setDelegate:self];
    [[self lineGraph] reloadGraph];
}

-(void)deallocCell {
    [self setImage:[[UIImageView alloc] init]];
    [self setBody:[[UILabel alloc] init]];
    [self setTitle:[[UILabel alloc] init]];
    [self setCellContainer:[[UIView alloc] init]];
    [self setLineGraph:[[BEMSimpleLineGraphView alloc] init]];
}

#pragma mark - Graph

-(CGFloat)lineGraph:(BEMSimpleLineGraphView *)graph valueForPointAtIndex:(NSInteger)index {
    CGFloat value = 0;
    switch (index) {
        case 0:
            value = 4;
            break;
        case 1:
            value = 3;
            break;
        case 2:
            value = 0;
            break;
        case 3:
            value = 1;
            break;
        case 4:
            value = 7;
            break;
        case 5:
            value = 10;
            break;
        case 6:
            value = 2;
            break;
        default:
            break;
    }
    return value;
}

-(NSInteger)numberOfPointsInLineGraph:(BEMSimpleLineGraphView *)graph {
    return 5;
}

@end
