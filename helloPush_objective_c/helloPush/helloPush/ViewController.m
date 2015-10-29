//
//  ViewController.m
//  helloPush
//
//  Created by Joshua Alger on 10/22/15.
//  Copyright © 2015 IBM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *pushRegister;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)registerForPush:(id) sender{
    //initialize Push
    [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge) categories:nil]];
    //call function to register Push
    [[UIApplication sharedApplication] registerForRemoteNotifications];
    
    

}


@end
