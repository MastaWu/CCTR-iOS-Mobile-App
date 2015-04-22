//
//  SearchViewController.m
//  Masta
//
//  Created by Wu on 3/11/15.
//  Copyright (c) 2015 Wu. All rights reserved.
//

#import "SearchViewController.h"
#import "ResultsTableViewController.h"

@interface SearchViewController()

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *phaseTextField;
@property (weak, nonatomic) IBOutlet UITextField *locationTextField;
@property (strong, nonatomic) NSArray *json;

@end


@implementation SearchViewController
- (void)viewDidLoad {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
}

- (IBAction)searchPressed:(id)sender {
   NSLog(@"Title - %@ \nPhase - %@ \nLocation - %@", self.titleTextField.text, self.phaseTextField.text ,self.locationTextField.text);
    
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ResultsTableViewController *vc = [segue destinationViewController];
    
    
    NSString *shortTitle = @"";
    NSString *phase = @"";
    NSString *location = @"";
    if (![self.titleTextField.text isEqualToString:@""]) {
        shortTitle = [NSString stringWithFormat:@"/?title=%@", self.titleTextField.text];
    }
    if(![self.phaseTextField.text isEqualToString:@""]){
        phase = [NSString stringWithFormat:@"&protocolNo=%@", self.phaseTextField.text];
        if([shortTitle isEqualToString:@""])
            phase = [NSString stringWithFormat:@"?protocolNo=%@", self.phaseTextField.text];
    }
    if(![self.locationTextField.text isEqualToString:@""]){
        location = [NSString stringWithFormat:@"&shortTitle=%@", self.phaseTextField.text];
        if([shortTitle isEqualToString:@""] & [location isEqualToString:@""])
            phase = [NSString stringWithFormat:@"?shortTitle=%@", self.phaseTextField.text];
    }
    
    NSString *urlString = [NSString stringWithFormat:@"http://oncoretest.mcvh-vcu.edu/protocols%@%@%@", shortTitle, phase, location];
    NSLog(@"%@", urlString);
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSData *jsonData = [NSData dataWithContentsOfURL:url];
    NSMutableDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:nil];
    NSEnumerator *jsonEnum = [jsonDict objectEnumerator];
    
    
    self.json = [[NSArray alloc] initWithArray:[jsonEnum allObjects]];
    
    [vc setJson:self.json];
}

- (void)dismissKeyboard {
    [self.view endEditing:YES];
}
@end
