//
//  MainGameData.h
//  CountMoney
//
//  Created by leo on 11-1-20.
//  Copyright 2011 aiside. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MainGameData : NSObject {

	int gameMode;
	
	int LimitTime;
	int LimitBill;
	
	int moneyType;
}

@property (nonatomic,assign)int gameMode;
@property (nonatomic,assign)int LimitTime;
@property (nonatomic,assign)int LimitBill;

@property (nonatomic,assign)int moneyType;
@end
