//
//  AppDelegate.m
//  pushApprovalExample
//
//  Created by Tomer Shkolnik on 4/3/15.
//  Copyright (c) 2015 elasticode. All rights reserved.
//

#import "AppDelegate.h"
#import <ElastiCode/ElastiCode.h>
#import "ECSplashScreen.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // Creating a window in order to show a splash screen and not the regular Stroyboard
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    ECSplashScreen* splashScreen = [[ECSplashScreen alloc] init];
    self.window.rootViewController = splashScreen;
    [self.window makeKeyAndVisible];
    
    // Let's add an observer to get notified when the session has started
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(sessionStarted) name:ELASTICODE_SESSION_STARTED object:nil];
    
    // Activate development mode to see the logs
    [ElastiCode devModeWithLogging:elastiCodeLogLevelDetailed];

#warning Add your app key here
    // Start elasticode session
    [ElastiCode startSession:@"<#Add your app key here#>"];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(void) sessionStarted
{
    [ElastiCode defineCase:@"When to ask for push" withNumOfStates:4];
    
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main"bundle: nil];
    UIViewController *mainViewController = (UIViewController*)[mainStoryboard instantiateViewControllerWithIdentifier:@"firstVC"];
    self.window.rootViewController = mainViewController;
}


-(void) askForPushForScreen:(NSInteger) screenIndex
{
    if([ElastiCode stateIndexWithoutVisitForCase:@"When to ask for push"] == screenIndex){
        [ElastiCode visitCase:@"When to ask for push"];
        
        // Ping to elasticode we already asked the user for permissions
        [ElastiCode event:@"user asked for push"];
        
        // showing example of alert, we can add logic here to ask the user for permissions before apple "real" request
        UIAlertView* av = [[UIAlertView alloc]initWithTitle:@"Approve push notifications"
                                                    message:@"Please approve push notifications"
                                                   delegate:nil
                                          cancelButtonTitle:@"Ok"
                                          otherButtonTitles:@"No, Thanks", nil];
        [av show];
    }
}

@end
