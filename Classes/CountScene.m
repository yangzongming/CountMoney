//
//  CountScene.m
//  CountMoney
//
//  Created by leo on 11-1-19.
//  Copyright 2011 aiside. All rights reserved.
//

#import "CountScene.h"
#import "GameMenu.h"
#import "CountMoneyAppDelegate.h"
#import "SelectSecne.h"

@implementation CountScene
@synthesize moneyImageView;
@synthesize firstLocation,endLocation;
@synthesize money;
@synthesize time;
@synthesize flagCount;
@synthesize startImage;
@synthesize audioPlayer;
@synthesize timeButton;
@synthesize moneyButton;
@synthesize gameMode; 
@synthesize moneyType;
@synthesize moneyImageView_back;
@synthesize messageAlert;
@synthesize fuckView;

-(CountScene *) initWithFrame:(CGRect)frame andManager:(GameStateManager*)pManager
{
	self = [super initWithFrame:frame andManager:pManager];
	
	if (self) {
		
		[[NSBundle mainBundle] loadNibNamed:@"CountScene" owner:self options:nil];
		
		[self addSubview:subview];
		
		[self addSubview:startImage];
		
		[startImage setAlpha:0];
		
		[startImage setFrame:CGRectMake(0,190,320, 100)];
		
		NSString *paths1 = [[NSBundle mainBundle] pathForResource:@"pageturn" ofType:@"wav"];	
		AudioServicesCreateSystemSoundID((CFURLRef)[NSURL fileURLWithPath:paths1],&mySSID1);
		
		NSString *paths2 = [[NSBundle mainBundle] pathForResource:@"screenNewSound" ofType:@"wav"];	
		AudioServicesCreateSystemSoundID((CFURLRef)[NSURL fileURLWithPath:paths2],&mySSID2);
		
		NSString *paths3 = [[NSBundle mainBundle] pathForResource:@"se07_getmoney" ofType:@"wav"];	
		AudioServicesCreateSystemSoundID((CFURLRef)[NSURL fileURLWithPath:paths3],&mySSID3);
		
		NSString *paths4 = [[NSBundle mainBundle] pathForResource:@"tfclickbb" ofType:@"wav"];	
		AudioServicesCreateSystemSoundID((CFURLRef)[NSURL fileURLWithPath:paths4],&mySSID4);
		
		//se07_getmoney.wav
		gameStop = YES;
		
		CountMoneyAppDelegate *delegate = (CountMoneyAppDelegate *)[[UIApplication sharedApplication] delegate];
		
		moneyType = [[delegate mainGameData] moneyType];
		gameMode = [[delegate mainGameData] gameMode];
		
		if(gameMode == 1)
		{
			time = [[delegate mainGameData] LimitTime];
			orignalMoney = 0;
			orignalTime = time;
			money = 0;
		}else if(gameMode == 2)
		{
			time = 0;
			money = [[delegate mainGameData] LimitBill];
			orignalMoney = money;
			orignalTime = 0;
		}
		
		int minute = time/60;
		int second = time%60;
		
		if(second >= 10)
		{
			[timeButton setTitle:[NSString stringWithFormat:@"Time:0%d:%d",minute,second] forState:UIControlStateNormal];
		}else {
			[timeButton setTitle:[NSString stringWithFormat:@"Time:0%d:0%d",minute,second] forState:UIControlStateNormal];
		}
		[moneyButton setTitle:[NSString stringWithFormat:@"Bill:%d",money] forState:UIControlStateNormal];
		
		switch(moneyType)
		{
			case 1:
			{
				[moneyImageView setImage:[UIImage imageNamed:@"rmb_1.png"]];
				[moneyImageView_back setImage:[UIImage imageNamed:@"rmb_2.png"]];
			}
				break;
			case 2:
			{
				[moneyImageView setImage:[UIImage imageNamed:@"jepan_1.png"]];
				[moneyImageView_back setImage:[UIImage imageNamed:@"jepan_2.png"]];
			}
				break;
			case 3:
			{
				[moneyImageView setImage:[UIImage imageNamed:@"usa_1.png"]];
				[moneyImageView_back setImage:[UIImage imageNamed:@"usa_2.png"]];
			}
				break;
		}
		
	}
	return self;
}

-(IBAction)goBack{
	AudioServicesPlaySystemSound(mySSID4);
	[m_pManager doStateChange:[SelectSecne class]];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{	
	
	UITouch *touch = [touches anyObject];
	self.firstLocation = [touch locationInView:self];
	
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
	
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
	
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
	
	if(gameStop == YES)
		return;
	UITouch *touch = [touches anyObject];
	self.endLocation = [touch locationInView:self];
	if((self.endLocation.y - self.firstLocation.y) > 30 && (self.endLocation.x - self.firstLocation.x) > 10)
	{
		[self animationStart];	//执行动画
		if(gameMode == 1)
		{
			money++;
		}else if(gameMode == 2)
		{
			money--;
			if(money == 0)
			{
				gameStop = 0;
				[self gameDidStop];
			}
		}
		[self.moneyButton setTitle:[NSString stringWithFormat:@"Bill:%d$",money] forState:UIControlStateNormal];
	}
	
}

-(void)gameDidStop{	
	//0.02  0.007
	float flag = 0;
	NSString *result = @"Result";
	if(gameMode == 1)
	{
		flag = money*0.1/orignalTime*0.1;
		
	}else if(gameMode == 2)
	{
		flag = orignalMoney*0.1/time*0.1;
	}
	
	if(flag <= 0.07)
	{
		result = @"Oh Very Bad!";
	}else if(flag > 0.07 && flag <= 0.011)
	{
		result = @"Bad!";
	}else if(flag > 0.011 && flag <= 0.016)
	{
		result = @"Nice!";
	}else if(flag > 0.016 && flag <= 0.02)
	{
		result = @"Good!";
	}else if(flag > 0.02)
	{
		result = @"Oh Very Good!";
	}
	
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:result
													message:[NSString stringWithFormat:@"You score is %d$.",money]
												   delegate:self
										  cancelButtonTitle:@"Cancel"
										  otherButtonTitles:nil];
	[alert show];
	[alert release];
	
}

- (void) Update 
{
	
	flagCount ++;
	fuckCount++;
	if(flagCount == 1)
	{
		[startImage setAlpha:1];
		AudioServicesPlaySystemSound(mySSID2);
	}
	if(flagCount == 2)
	{
		AudioServicesPlaySystemSound(mySSID2);
		[UIView beginAnimations:@"flipPage" context:nil];
		[UIView setAnimationDuration:0.5];
		[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
		[startImage setImage:[UIImage imageNamed:@"2.png"]];	
		[UIView commitAnimations];
	}
	if(flagCount == 3)
	{
		AudioServicesPlaySystemSound(mySSID2);
		[startImage setImage:[UIImage imageNamed:@"1.png"]];
	}
	if(flagCount == 4)
	{
		AudioServicesPlaySystemSound(mySSID2);
		[startImage setImage:[UIImage imageNamed:@"start.png"]];
		
	}
	if(flagCount == 5)
	{
		AudioServicesPlaySystemSound(mySSID3);
		[startImage setAlpha:0];
		gameStop = NO;
	}
	
	if(gameStop == YES)
		return;
	
	if(gameMode == 1)
	{
		time --;
		if(time == 0)
		{
			gameStop = YES;
			[self gameDidStop];
		}
	}else if(gameMode == 2)
	{
		time ++;
	}
	
	int minute = time/60;
	int second = time%60;
	
	if(second >= 10)
	{
		[timeButton setTitle:[NSString stringWithFormat:@"Time:0%d:%d",minute,second] forState:UIControlStateNormal];
	}else {
		[timeButton setTitle:[NSString stringWithFormat:@"Time:0%d:0%d",minute,second] forState:UIControlStateNormal];
	}
	
}

- (void) Render
{
	
}

-(void)animationStart
{
	NSString *path = [[NSBundle mainBundle] pathForResource:@"pageturn" ofType:@"wav"];
	AudioServicesCreateSystemSoundID((CFURLRef)[NSURL fileURLWithPath:path], &mySSID1);
	AudioServicesPlaySystemSound(mySSID1);
	
	[UIView beginAnimations:@"flipPage" context:nil];
	[UIView setAnimationDuration:0.5];
	[UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.moneyImageView cache:YES];
	[UIView commitAnimations];
}

-(void)dealloc{
	[fuckView release];
	[messageAlert release];
	[moneyImageView_back release];
	[timeButton release];
	[moneyButton release];
	[audioPlayer release];
	[startImage release];
	[moneyImageView release];
	[super dealloc];	
}

#pragma mark alertViewDelegate

- (void)willPresentAlertView:(UIAlertView *) alertView{
	
	//alertView.frame = CGRectMake(10, 100, 300, 300);
	
}

@end
