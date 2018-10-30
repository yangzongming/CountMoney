//
//  MyAlertView.h
//  CountMoney
//
//  Created by leo on 11-1-23.
//  Copyright 2011 aiside. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyAlertViewController.h"

@interface MyAlertView : UIAlertView {

	MyAlertViewController *_MyAlertViewController;
	
}
@property (nonatomic,retain)MyAlertViewController *_MyAlertViewController;

-(void) initUI;
@end
