//
//  ViewController.m
//  Masta
//
//  Created by Wu on 3/11/15.
//  Copyright (c) 2015 Wu. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)homeButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
