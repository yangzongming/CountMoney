//
//  MyAlertView.m
//  CountMoney
//
//  Created by leo on 11-1-23.
//  Copyright 2011 aiside. All rights reserved.
//

#import "MyAlertView.h"


@implementation MyAlertView
@synthesize _MyAlertViewController;

-(void) initUI{
	
	if(_MyAlertViewController == nil)
	{
		_MyAlertViewController = [[MyAlertViewController alloc] initWithNibName:@"MyAlertViewController"
																		 bundle:nil];
	}
	_MyAlertViewController.view.backgroundColor = [UIColor clearColor];
	[self addSubview:_MyAlertViewController.view];
}


-(void)dealloc{
	[_MyAlertViewController release];
	[super dealloc];	
}

@end
