//
//  WelcomeScene.m
//  CountMoney
//
//  Created by leo on 11-1-23.
//  Copyright 2011 aiside. All rights reserved.
//

#import "WelcomeScene.h"


@implementation WelcomeScene

-(WelcomeScene *) initWithFrame:(CGRect)frame andManager:(GameStateManager*)pManager
{
	self = [super initWithFrame:frame andManager:pManager];
	
	if (self) {
		
		[[NSBundle mainBundle] loadNibNamed:@"WelcomeScene" owner:self options:nil];
		
		[self addSubview:subview];
		
		NSString *paths4 = [[NSBundle mainBundle] pathForResource:@"tfclickbb" ofType:@"wav"];	
		
		AudioServicesCreateSystemSoundID((CFURLRef)[NSURL fileURLWithPath:paths4],&mySSID4);
	}
	return self;
}

-(void)dealloc{
	[super dealloc];	
}

@end
