//
//  CmdLabel.m
//  CmdMe
//
//  Created by Charles Camp on 1/9/16.
//  Copyright © 2016 Charles. All rights reserved.
//

#import "CmdLabel.h"

@implementation CmdLabel

@synthesize verticalAlignment;

-(void)createContentDetailLabel:(NSString *)contentBody {
    [self setLineBreakMode:NSLineBreakByWordWrapping];
    [self setNumberOfLines:100000];
    [self setText:contentBody];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

#pragma mark - Initialization

-(id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        verticalAlignment = VerticalAlignmentTop;
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        verticalAlignment = VerticalAlignmentTop;
    }
    return self;
}

#pragma mark - Alignment

-(VerticalAlignment) verticalAlignment {
    return verticalAlignment;
}

-(void) setVerticalAlignment:(VerticalAlignment)value {
    verticalAlignment = value;
    [self setNeedsDisplay];
}

// align text block according to vertical alignment settings
-(CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines {
    CGRect rect = [super textRectForBounds:bounds limitedToNumberOfLines:numberOfLines];
    CGRect result;
    switch (verticalAlignment) {
        case VerticalAlignmentTop:
            result = CGRectMake(bounds.origin.x + 15, bounds.origin.y + 15, rect.size.width, rect.size.height);
            break;
        case VerticalAlignmentMiddle:
            result = CGRectMake(bounds.origin.x, bounds.origin.y + (bounds.size.height - rect.size.height) / 2, rect.size.width, rect.size.height);
            break;
        case VerticalAlignmentBottom:
            result = CGRectMake(bounds.origin.x, bounds.origin.y + (bounds.size.height - rect.size.height), rect.size.width, rect.size.height);
            break;
        default:
            result = bounds;
            break;
    }
    return result;
}

-(void)drawTextInRect:(CGRect)rect {
    CGRect r = [self textRectForBounds:rect limitedToNumberOfLines:self.numberOfLines];
    [super drawTextInRect:r];
}

@end
