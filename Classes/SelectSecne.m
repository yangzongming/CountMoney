//
//  SelectSecne.m
//  CountMoney
//
//  Created by leo on 11-1-20.
//  Copyright 2011 aiside. All rights reserved.
//

#import "SelectSecne.h"
#import "CountScene.h"
#import "CountMoneyAppDelegate.h"
#import "GameMenu.h"

@implementation SelectSecne

-(SelectSecne *) initWithFrame:(CGRect)frame andManager:(GameStateManager*)pManager
{
	self = [super initWithFrame:frame andManager:pManager];
	
	if (self) {
		
		[[NSBundle mainBundle] loadNibNamed:@"SelectSecne" owner:self options:nil];
		[self addSubview:subview];
		
		NSString *paths3 = [[NSBundle mainBundle] pathForResource:@"tfclickbb" ofType:@"wav"];	
		AudioServicesCreateSystemSoundID((CFURLRef)[NSURL fileURLWithPath:paths3],&mySSID3);
	}
	return self;
}


-(void)dealloc{
	[super dealloc];	
}

-(IBAction)back{
	AudioServicesPlaySystemSound(mySSID3);
	[m_pManager doStateChange:[GameMenu class]];
}

-(IBAction)billBtnClick{
	
	AudioServicesPlaySystemSound(mySSID3);
	CountMoneyAppDelegate *delegate = (CountMoneyAppDelegate *)[[UIApplication sharedApplication] delegate];
	[[delegate mainGameData] setGameMode:2];
	[m_pManager doStateChange:[CountScene class]];
}

-(IBAction)timeBtnCLick{
	
	AudioServicesPlaySystemSound(mySSID3);
	CountMoneyAppDelegate *delegate = (CountMoneyAppDelegate *)[[UIApplication sharedApplication] delegate];
	[[delegate mainGameData] setGameMode:1];
	[m_pManager doStateChange:[CountScene class]];
}
@end
