//
//  GameMenu.m
//  CountMoney
//
//  Created by leo on 11-1-19.
//  Copyright 2011 aiside. All rights reserved.
//

#import "GameMenu.h"
#import "CountScene.h"
#import "SettingScene.h"
#import "SelectSecne.h"

@implementation GameMenu

-(GameMenu *) initWithFrame:(CGRect)frame andManager:(GameStateManager*)pManager
{
	self = [super initWithFrame:frame andManager:pManager];
	
	if (self) {

		[[NSBundle mainBundle] loadNibNamed:@"MainMenu" owner:self options:nil];
		
		[self addSubview:subview];
		
		NSString *paths4 = [[NSBundle mainBundle] pathForResource:@"tfclickbb" ofType:@"wav"];	
		AudioServicesCreateSystemSoundID((CFURLRef)[NSURL fileURLWithPath:paths4],&mySSID4);
	}
	return self;
}
-(IBAction)doPlayScreen{
	AudioServicesPlaySystemSound(mySSID4);
	[m_pManager doStateChange:[SelectSecne class]];
}
-(IBAction)doSettingScreen{
	AudioServicesPlaySystemSound(mySSID4);
	[m_pManager doStateChange:[SettingScene class]];
}

@end
