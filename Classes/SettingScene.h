//
//  SettingScene.h
//  CountMoney
//
//  Created by leo on 11-1-19.
//  Copyright 2011 aiside. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameState.h"
#import <AudioToolbox/AudioServices.h>

@interface SettingScene : GameState{

	IBOutlet UIView* subview;
	
	IBOutlet UIView *moneyView;
	IBOutlet UIView *billView;
	IBOutlet UIView *timeView;
	
	IBOutlet UIPickerView *moneyTypePicker;
	IBOutlet UIPickerView *billPicker;
	IBOutlet UIPickerView *timePicker;
	
	IBOutlet UIButton *moneyButton;
	IBOutlet UIButton *billButton;
	IBOutlet UIButton *timeButton;
	
	NSMutableArray *moneyArray;
	NSMutableArray *billArray;
	NSMutableArray *timeArray;
	
	IBOutlet UIView *Mylayer;
	
	int currentM;
	int currentB;
	int currentT;
	
	SystemSoundID mySSID4;
}

@property (nonatomic,retain)IBOutlet UIPickerView *moneyTypePicker;
@property (nonatomic,retain)IBOutlet UIPickerView *billPicker;
@property (nonatomic,retain)IBOutlet UIPickerView *timePicker;

@property (nonatomic,retain)IBOutlet UIView *moneyView;
@property (nonatomic,retain)IBOutlet UIView *billView;
@property (nonatomic,retain)IBOutlet UIView *timeView;

@property (nonatomic,retain)NSMutableArray *moneyArray;
@property (nonatomic,retain)NSMutableArray *billArray;
@property (nonatomic,retain)NSMutableArray *timeArray;

@property (nonatomic,retain)IBOutlet UIButton *moneyButton;
@property (nonatomic,retain)IBOutlet UIButton *billButton;
@property (nonatomic,retain)IBOutlet UIButton *timeButton;

@property (nonatomic,retain)IBOutlet UIView *Mylayer;

-(IBAction)goBack;

-(IBAction)changeMoneyClick;
-(IBAction)changeBillClick;
-(IBAction)changeTimeClick;

-(IBAction)OKClick:(id)sender;
-(IBAction)cancelClick:(id)sender;

@end
