//
//  CountMoneyAppDelegate.m
//  CountMoney
//
//  Created by leo on 11-1-19.
//  Copyright 2011 aiside. All rights reserved.
//

#import "CountMoneyAppDelegate.h"
#import "CountMoneyViewController.h"
#import "GameState.h"
#import "WelcomeScene.h"

#define LOOP_TIMER_MINIMUM 1.0f
#define IPHONE_HEIGHT 480
#define IPHONE_WIDTH 320

#import "GameMenu.h"

@implementation CountMoneyAppDelegate

@synthesize window;
@synthesize countMoneyViewController;
@synthesize mainGameData;

#pragma mark -
#pragma mark Application lifecycle

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after application launch.

    // Add the view controller's view to the window and display
	self.countMoneyViewController = [[CountMoneyViewController alloc] init];
	
	//set up main loop
	[NSTimer scheduledTimerWithTimeInterval:LOOP_TIMER_MINIMUM target:self selector:@selector(gameLoop:) userInfo:nil repeats:NO];
	
	m_lastUpdateTime = [[NSDate date] timeIntervalSince1970];
	
	m_FPS_lastSecondStart = m_lastUpdateTime;
	m_FPS_framesThisSecond = 0;	
	
	//PDZ - we have removed this default code because we create the view ourselves as a GameState class
    //[window addSubview:viewController.view];
    //[window makeKeyAndVisible];
	
	//seed random number generator.
	srandom([[NSDate date] timeIntervalSince1970]);
	
	//setup default save data.
	
	//set up our first state
	mainGameData = [[MainGameData alloc] init];
	[self doStateChange:[GameMenu class]];	
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
	[mainGameData release];
	[countMoneyViewController release];
    [window release];
    [super dealloc];
}

- (void) gameLoop: (id) sender
{
	double currTime = [[NSDate date] timeIntervalSince1970];
	//float dt = currTime - m_lastUpdateTime;  //can store this as double or float
	
	//	printf("main loop");
	
	[((GameState*)countMoneyViewController.view) Update];
	[((GameState*)countMoneyViewController.view) Render];
	
	m_FPS_framesThisSecond++;
	float timeThisSecond = currTime - m_FPS_lastSecondStart;
	if( timeThisSecond > 1.0f ) {
		m_estFramesPerSecond = m_FPS_framesThisSecond;
		m_FPS_framesThisSecond = 0;
		m_FPS_lastSecondStart = currTime;
	}
	
	float sleepPeriod = LOOP_TIMER_MINIMUM;	
	[NSTimer scheduledTimerWithTimeInterval:sleepPeriod target:self selector:@selector(gameLoop:) userInfo:nil repeats:NO];
	//[self performSelector: @selector(gameLoop:) withObject:self afterDelay:  sleepPeriod];
	
	m_lastUpdateTime = currTime;
}

- (float) getFramesPerSecond
{
	return m_estFramesPerSecond;
}

- (void) doStateChange: (Class) state
{
	BOOL animateTransition = YES;
	
	
	countMoneyViewController.view = [[state alloc]  initWithFrame:CGRectMake(0, 0, IPHONE_WIDTH, IPHONE_HEIGHT) andManager:self];
	
	[countMoneyViewController.view setAlpha:0];
	
	if(animateTransition){
		[UIView beginAnimations:nil context:NULL];
		[UIView setAnimationDuration:0.3];
		//[UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:window cache:YES]; //does nothing without this line.
		[UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
	}
	
	if( countMoneyViewController.view != nil ) {
		[countMoneyViewController.view removeFromSuperview]; //remove view from window's subviews.
		[countMoneyViewController.view release]; //release gamestate 
	}
	//now set our view as visible
	
	[countMoneyViewController.view setAlpha:1];
	
    [window addSubview:countMoneyViewController.view];
	
	[window makeKeyAndVisible];
	
	if(animateTransition){
		[UIView commitAnimations];
	}
}


@end
