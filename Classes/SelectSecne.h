//
//  SelectSecne.h
//  CountMoney
//
//  Created by leo on 11-1-20.
//  Copyright 2011 aiside. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameState.h"
#import <AudioToolbox/AudioServices.h>

@interface SelectSecne : GameState {

	IBOutlet UIView* subview;
	SystemSoundID mySSID3;
}

-(IBAction)timeBtnCLick;
-(IBAction)billBtnClick;

-(IBAction)back;
@end
