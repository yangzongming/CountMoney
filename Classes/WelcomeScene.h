//
//  WelcomeScene.h
//  CountMoney
//
//  Created by leo on 11-1-23.
//  Copyright 2011 aiside. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameState.h"
#import <AudioToolbox/AudioServices.h>

@interface WelcomeScene : GameState {
	IBOutlet UIView* subview;
	SystemSoundID mySSID4;
}

@end
