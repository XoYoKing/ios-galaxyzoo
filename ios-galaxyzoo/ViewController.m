//
//  ViewController.m
//  ios-galaxyzoo
//
//  Created by Murray Cumming on 01/05/2015.
//  Copyright (c) 2015 Murray Cumming. All rights reserved.
//

#import "ViewController.h"
#import "client/ZooniverseClient.h"

@interface ViewController ()

@end

@implementation ViewController
- (IBAction)buttonAction:(id)sender {
    ZooniverseClient *client = [[ZooniverseClient alloc] init];
    [client querySubjects];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end