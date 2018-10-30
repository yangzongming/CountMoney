//
//  SettingScene.m
//  CountMoney
//
//  Created by leo on 11-1-19.
//  Copyright 2011 aiside. All rights reserved.
//

#import "SettingScene.h"
#import "GameMenu.h"
#import "CountMoneyAppDelegate.h"

@implementation SettingScene
@synthesize moneyTypePicker;
@synthesize billPicker;
@synthesize timePicker;
@synthesize moneyView;
@synthesize billView;
@synthesize timeView;
@synthesize moneyArray;
@synthesize billArray;
@synthesize timeArray;
@synthesize Mylayer;
@synthesize moneyButton;
@synthesize billButton;
@synthesize timeButton;
-(SettingScene *) initWithFrame:(CGRect)frame andManager:(GameStateManager*)pManager
{
	self = [super initWithFrame:frame andManager:pManager];
	
	if (self) {
		
		[[NSBundle mainBundle] loadNibNamed:@"SettingScene" owner:self options:nil];
		[self addSubview:subview];
		
		[self addSubview:Mylayer];
		[Mylayer setBackgroundColor:[UIColor clearColor]];

		
		[moneyView setFrame:CGRectMake(0, 480, 320, 250)];
		[moneyView setBackgroundColor:[UIColor clearColor]];
		
		[billView setFrame:CGRectMake(0, 480, 320, 250)];
		[billView setBackgroundColor:[UIColor clearColor]];
		
		[timeView setFrame:CGRectMake(0, 480, 320, 250)];
		[timeView setBackgroundColor:[UIColor clearColor]];
		
		[self addSubview:moneyView];
		[self addSubview:billView];
		[self addSubview:timeView];
		
		moneyArray = [[NSMutableArray alloc] init];
		[moneyArray addObject:@"RMB"];
		[moneyArray addObject:@"JEPAN"];
		[moneyArray addObject:@"USA"];
		
		billArray = [[NSMutableArray alloc] init];
		
		for(int i=0;i<5;++i)
		{
			NSMutableArray *array = [[NSMutableArray alloc] init];
			[billArray addObject:array];
			for(int j=0;j<10;++j)
			{
				[array addObject:[NSString stringWithFormat:@"%d",j]];
			}
			[array release];
		}
		
		timeArray = [[NSMutableArray alloc] init];
		
		
		
		
		NSMutableArray *array = [[NSMutableArray alloc] init];
		[timeArray addObject:array];
		for(int j=0;j<4;++j)
		{
			[array addObject:[NSString stringWithFormat:@"%d",j]];
		}
		[array release];
		
		
		for(int i=0;i<2;++i)
		{
			NSMutableArray *array = [[NSMutableArray alloc] init];
			[timeArray addObject:array];
			for(int j=0;j<10;++j)
			{
				[array addObject:[NSString stringWithFormat:@"%d",j]];
			}
			[array release];
		}
		
		
		currentM = -1;
		currentB = -1;
		currentT = -1;
		
		
		
		NSString *paths4 = [[NSBundle mainBundle] pathForResource:@"tfclickbb" ofType:@"wav"];	
		AudioServicesCreateSystemSoundID((CFURLRef)[NSURL fileURLWithPath:paths4],&mySSID4);
	}
	return self;
}


-(IBAction)goBack{
	AudioServicesPlaySystemSound(mySSID4);
	[m_pManager doStateChange:[GameMenu class]];
}

-(void)dealloc{
	[moneyButton release];
	[billButton release];
	[timeButton release];
	[Mylayer release];
	[moneyArray release];
	[billArray release];
	[timeArray release];
	[timeView release];
	[billView release];
	[moneyView release];
	[billPicker release];
	[moneyTypePicker release];
	[timePicker release];
	[super dealloc];
}
#pragma mark UIPickerViewDelegate
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSUInteger)row forComponent:(NSUInteger)component{
	if(pickerView.tag ==1)
	{
		return [moneyArray objectAtIndex:row];
	}else if(pickerView.tag == 2)
	{
		return [[timeArray objectAtIndex:component] objectAtIndex:row];
	}else {
		return [[billArray objectAtIndex:component] objectAtIndex:row];
	}
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSUInteger)row inComponent:(NSUInteger)component {
	
	if(pickerView.tag == 1)
	{
		currentM = row+1;
	}else if(pickerView.tag ==2)
	{
		if(currentT == -1)
			currentT = 0;
		
		int a = (currentT/100); 
		int b = ((currentT%100)/10);
		int c = ((currentT%100)%10);
		
		switch(component)
		{
			case 0:
			{
				a = row;
			}
				break;
			case 1:
			{
				b = row;
			}
				break;
			case 2:
			{
				c = row;
			}
				break;
		}
		currentT = a*100+b*10+c;
	}else {
		if(currentB == -1)
			currentB = 0;
		
		int a = (currentB/10000); 
		int b = ((currentB%10000)/1000); 
		int c = (((currentB%10000)%1000)/100);
		int d = ((((currentB%10000)%1000)%100)/10);
		int e = ((((currentB%10000)%1000)%100)%10);
		
		switch(component)
		{
			case 0:
			{
				a = row;
			}
				break;
			case 1:
			{
				b = row;
			}
				break;
			case 2:
			{
				c = row;
			}
				break;
			case 3:
			{
				d = row;
			}
				break;
			case 4:
			{
				e = row;
			}
				break;
		}
		currentB = a*10000+b*1000+c*100+d*10+e;
	}

}

- (NSUInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSUInteger)component {
	
	if(pickerView.tag ==1)
	{
		
		return [moneyArray count];
		
	}else if(pickerView.tag == 2)
	{
		
		return [[timeArray objectAtIndex:component] count];
		
	}else {
		
		return [[billArray objectAtIndex:component] count];
		
	}
}

- (NSUInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
	
	if(pickerView.tag ==1)
	{
		return 1;
	}else if(pickerView.tag == 2)
	{
		return 3;
	}else {
		return 5;
	}
	
}

-(IBAction)changeMoneyClick{
	AudioServicesPlaySystemSound(mySSID4);
	[moneyView setAlpha:1];
	[UIView beginAnimations:@"" context:nil];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	[UIView setAnimationDuration:0.5];
	[Mylayer setAlpha:1];
	[moneyView setFrame:CGRectMake(0, 480-250, 320, 250)];
	[UIView commitAnimations];
}
-(IBAction)changeBillClick{
	AudioServicesPlaySystemSound(mySSID4);
	[billView setAlpha:1];
	[UIView beginAnimations:@"" context:nil];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	[UIView setAnimationDuration:0.5];
	[Mylayer setAlpha:1];
	[billView setFrame:CGRectMake(0, 480-250, 320, 250)];
	[UIView commitAnimations];
}
-(IBAction)changeTimeClick{
	AudioServicesPlaySystemSound(mySSID4);
	[timeView setAlpha:1];
	[UIView beginAnimations:@"" context:nil];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	[UIView setAnimationDuration:0.5];
	[Mylayer setAlpha:1];
	[timeView setFrame:CGRectMake(0, 480-250, 320, 250)];
	[UIView commitAnimations];
}

-(IBAction)OKClick:(id)sender{
	UIButton *button = (UIButton *)sender;
	AudioServicesPlaySystemSound(mySSID4);
	switch(button.tag)
	{
	
		case 1:
		{
			if(currentM!=-1)
			{
				[moneyButton setTitle:[moneyArray objectAtIndex:currentM-1] forState:UIControlStateNormal];
				CountMoneyAppDelegate *app = (CountMoneyAppDelegate *)[[UIApplication sharedApplication] delegate];
				[[app mainGameData] setMoneyType:currentM];
			}
			[UIView beginAnimations:@"" context:nil];
			[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
			[UIView setAnimationDuration:0.5];
			[Mylayer setAlpha:0];
			[moneyView setFrame:CGRectMake(0, 480, 320, 250)];
			[UIView commitAnimations];
		}
			break;
		case 2:
		{
			if(currentT!=-1)
			{
				[timeButton setTitle:[NSString stringWithFormat:@"%dS",currentT] forState:UIControlStateNormal];
				CountMoneyAppDelegate *app = (CountMoneyAppDelegate *)[[UIApplication sharedApplication] delegate];
				[[app mainGameData] setLimitTime:currentT];
			}
			[UIView beginAnimations:@"" context:nil];
			[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
			[UIView setAnimationDuration:0.5];
			[Mylayer setAlpha:0];
			[timeView setFrame:CGRectMake(0, 480, 320, 250)];
			[UIView commitAnimations];
		}
			break;
		case 3:
		{
			if(currentB!=-1)
			{
				[billButton setTitle:[NSString stringWithFormat:@"%d$",currentB] forState:UIControlStateNormal];
				CountMoneyAppDelegate *app = (CountMoneyAppDelegate *)[[UIApplication sharedApplication] delegate];
				[[app mainGameData] setLimitBill:currentB];
			}
			
			[UIView beginAnimations:@"" context:nil];
			[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
			[UIView setAnimationDuration:0.5];
			[Mylayer setAlpha:0];
			[billView setFrame:CGRectMake(0, 480, 320, 250)];
			[UIView commitAnimations];
		}
			break;
	}
}
-(IBAction)cancelClick:(id)sender{
	UIButton *button = (UIButton *)sender;
	AudioServicesPlaySystemSound(mySSID4);
	switch(button.tag)
	{
			
		case 1:
		{
			[UIView beginAnimations:@"" context:nil];
			[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
			[UIView setAnimationDuration:0.5];
			[Mylayer setAlpha:0];
			[moneyView setFrame:CGRectMake(0, 480, 320, 250)];
			[UIView commitAnimations];	
		}
			break;
		case 2:
		{
			[UIView beginAnimations:@"" context:nil];
			[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
			[UIView setAnimationDuration:0.5];
			[Mylayer setAlpha:0];
			[timeView setFrame:CGRectMake(0, 480, 320, 250)];
			[UIView commitAnimations];	
		}
			break;
		case 3:
		{
			[UIView beginAnimations:@"" context:nil];
			[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
			[UIView setAnimationDuration:0.5];
			[Mylayer setAlpha:0];
			[billView setFrame:CGRectMake(0, 480, 320, 250)];
			[UIView commitAnimations];	
		}
			break;
	}
}

@end
