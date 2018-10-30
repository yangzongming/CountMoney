//
//  CountMoneyAppDelegate.h
//  CountMoney
//
//  Created by leo on 11-1-19.
//  Copyright 2011 aiside. All rights reserved.
//

#import <UIKit/UIKit.h>

#include "GameStateManager.h"

#define ProgressionSavefile @"progression"
#import "MainGameData.h"

@class CountMoneyViewController;

@interface CountMoneyAppDelegate : GameStateManager <UIApplicationDelegate> {
    UIWindow *window;
    CountMoneyViewController *countMoneyViewController;
	
	CFTimeInterval m_FPS_lastSecondStart;
	int m_FPS_framesThisSecond;
	
	CFTimeInterval m_lastUpdateTime;
	float m_estFramesPerSecond;	
	
	MainGameData *mainGameData;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic,retain) CountMoneyViewController *countMoneyViewController;

@property (nonatomic,retain)MainGameData *mainGameData;

- (void) gameLoop: (id) sender;

- (float) getFramesPerSecond;

@end

