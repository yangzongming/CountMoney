//
//  GameState.m
//  Test_Framework
//
//  Created by Paul Zirkle on 2/12/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "GameState.h"


@implementation GameState


-(id) initWithFrame:(CGRect)frame andManager:(GameStateManager*)pManager;
{
	self = [super initWithFrame:frame];
	
    if (self) {
        // Initialization code
		m_pManager = pManager;
		self.userInteractionEnabled = YES;
    }	
    return self;
}

- (void)dealloc {
    [super dealloc];
}

- (void)drawRect:(CGRect)rect {
}

-(bool) HandleEvent: (void*)event
{
	return false;
}

-(void)touchesEnded:(NSSet*) touches withEvent:(UIEvent*) event
{
	
}


- (void) Update 
{
	
}

- (void) Render
{
	
}

@end
