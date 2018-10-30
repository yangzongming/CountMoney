//
//  CountScene.h
//  CountMoney
//
//  Created by leo on 11-1-19.
//  Copyright 2011 aiside. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameState.h"
#import <AudioToolbox/AudioServices.h>
#import <AVFoundation/AVFoundation.h>
#import "MyAlertView.h"


@interface CountScene : GameState <UIAlertViewDelegate>{

	IBOutlet UIView* subview;
	
	IBOutlet UIImageView *moneyImageView;
	IBOutlet UIImageView *moneyImageView_back;
	
	
	
	AVAudioPlayer *audioPlayer;
	
	SystemSoundID mySSID1;
	SystemSoundID mySSID2;
	SystemSoundID mySSID3;
	SystemSoundID mySSID4;
	
	CGPoint firstLocation;
	//end touch point
	CGPoint endLocation;
	
	BOOL gameStop;
	
	int money;
	int orignalMoney;
	
	int time;
	int orignalTime;
	
	int gameMode;
	int moneyType;
	
	
	IBOutlet UIButton *timeButton;
	IBOutlet UIButton *moneyButton;
	
	int flagCount;
	IBOutlet UIImageView *startImage;
	
	MyAlertView *messageAlert;
	
	IBOutlet UIImageView *fuckView;
	int fuckCount;
}
@property  CGPoint firstLocation;
@property  CGPoint endLocation;
@property (nonatomic,retain)IBOutlet UIImageView *moneyImageView;
@property (nonatomic,assign)int money;
@property (nonatomic,assign)int time;
@property (nonatomic,assign)int gameMode;
@property (nonatomic,assign)int moneyType;

@property (nonatomic,retain)AVAudioPlayer *audioPlayer;

@property (nonatomic,assign)int flagCount;
@property (nonatomic,retain)IBOutlet UIImageView *startImage;

@property (nonatomic,retain)IBOutlet UIButton *timeButton;
@property (nonatomic,retain)IBOutlet UIButton *moneyButton;
@property (nonatomic,retain)IBOutlet UIImageView *moneyImageView_back;

@property (nonatomic,retain)MyAlertView *messageAlert;
@property (nonatomic,retain)IBOutlet UIImageView *fuckView;

-(IBAction)goBack;
-(void)animationStart;

-(void)gameDidStop;
@end
