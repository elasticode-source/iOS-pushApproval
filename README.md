# iOS-pushApproval
Elasticode push approval example.


## Synopsis
Elasticode push approval example allows you to learn more,
about how you can integrate the elasticode SDK,
and asked the user for push notification permission, 
In the right time defined from the dashboard.

## Code Example
Setting up the environment is easy, you can follow the docs 
[here](http://docs.elasticode.com/docs/sdk-intro)

Don't forget to sign up to our service, so you can start hacking with our SDK (it's free ...) 
https://mc.elasticode.com/signUp.php

Connecting the app key to the SDK is VIA the appDelegate : 
```objective-c
// i.e. in the  didFinishLaunchingWithOptions: in the appDelegate 

- (BOOL)application:(UIApplication *)application
  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
  {
    // Override point for customization after application launch.
    [ElastiCode devModeWithLogging:elastiCodeLogLevelErrors];
    [ElastiCode startSession:@"YOUR_ELASTICODE_KEY"];
    return YES;
  }
```

## Motivation

pushApproval is an app that enables you to learn the  
1. How to integrate the SDK  
2. How to manage and control your experiences VIA the dashboard  
3. How to correlate relevant experiences to relevant segments ( audiences )  

## Installation

Using our SDK,  here is a [step by step guide](http://docs.elasticode.com/docs/sdk-intro)
