//
//  MyAlertViewController.h
//  CountMoney
//
//  Created by leo on 11-1-23.
//  Copyright 2011 aiside. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MyAlertViewControllerDelegate

-(void)AlertButtonClick;

@end



@interface MyAlertViewController : UIViewController {

	id <MyAlertViewControllerDelegate> delegate;
}
@property (nonatomic,assign)id <MyAlertViewControllerDelegate> delegate;
@end
