//
//  MainGameData.m
//  CountMoney
//
//  Created by leo on 11-1-20.
//  Copyright 2011 aiside. All rights reserved.
//

#import "MainGameData.h"


@implementation MainGameData
@synthesize gameMode;
@synthesize  LimitTime;
@synthesize LimitBill;
@synthesize moneyType;
-(id)init{

	self = [super init];
	if(self)
	{
		
		LimitTime = 300;
		LimitBill = 10000;
		moneyType = 1;
	}
	return self;
}


-(void)dealloc{

	[super dealloc];
}

@end
