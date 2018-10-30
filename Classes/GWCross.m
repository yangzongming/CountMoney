//
//  GWCross.m
//  CambridgeIC3
//
//  Created by apple007 on 10-5-12.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "GWCross.h"


@implementation GWCross
@synthesize index;

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
		index = 0;
		[self setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
    // Drawing code
	CGPoint imagePoint = CGPointMake(0, 0);
	UIImage *image = [UIImage imageNamed:@"pro_back.png"];
	[image drawAtPoint:imagePoint];
	UIImage *image2 = [UIImage imageNamed:@"pro.png"];
	UIRectClip(CGRectMake(imagePoint.x, imagePoint.y, 267, 17));
	[image2 drawAtPoint:imagePoint];
}


- (void)dealloc {
    [super dealloc];
}


@end
