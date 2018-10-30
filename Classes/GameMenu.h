//
//  GameMenu.h
//  CountMoney
//
//  Created by leo on 11-1-19.
//  Copyright 2011 aiside. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameState.h"
#import <AudioToolbox/AudioServices.h>

@interface GameMenu : GameState {
	
	IBOutlet UIView* subview;
	SystemSoundID mySSID4;
}

-(IBAction)doPlayScreen;
-(IBAction)doSettingScreen;

@end
