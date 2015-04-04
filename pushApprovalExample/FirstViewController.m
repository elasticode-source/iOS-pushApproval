//
//  FirstViewController.m
//  pushApprovalExample
//
//  Created by Tomer Shkolnik on 4/3/15.
//  Copyright (c) 2015 elasticode. All rights reserved.
//

#import "FirstViewController.h"
#import "AppDelegate.h"
@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    AppDelegate* appDelegate = (AppDelegate*) [[UIApplication sharedApplication] delegate];
    [appDelegate askForPushForScreen:1];
}
@end
