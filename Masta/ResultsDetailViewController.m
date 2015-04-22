//
//  ResultsViewController.m
//  Masta
//
//  Created by Wu on 3/11/15.
//  Copyright (c) 2015 Wu. All rights reserved.
//

#import "ResultsDetailViewController.h"

@interface ResultsDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *idLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *protocolNo;
@property (weak, nonatomic) IBOutlet UILabel *shortTitleLabel;
@property (weak, nonatomic) IBOutlet UITextView *titleTextView;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;

@end

@implementation ResultsDetailViewController

- (void) viewDidLoad{
    [super viewDidLoad];
    
    [self updateLabels];
}
- (void)updateLabels{
    [self.idLabel setText:[NSString stringWithFormat:@"%@", [self.dict objectForKey:@"id"]]];
    [self.nameLabel setText:[NSString stringWithFormat:@"%@",[self.dict objectForKey:@"name"]]];
    [self.protocolNo setText:[NSString stringWithFormat:@"%@",[self.dict objectForKey:@"protocolNo"]]];
    //have to do this for each one in the future
    NSLog(@"%@", [self.dict objectForKey:@"shortTitle"]);
    if ([[NSString stringWithFormat:@"%@", [self.dict objectForKey:@"shortTitle"]] isEqualToString:@"<null>"]) {
        [self.dict setValue:@" " forKey:@"shortTitle"];
    }
    [self.shortTitleLabel setText:[NSString stringWithFormat:@"%@",[self.dict objectForKey:@"shortTitle"]]];
    
    [self.statusLabel setText:[NSString stringWithFormat:@"%@",[self.dict objectForKey:@"status"]]];
    [self.titleTextView setText:[NSString stringWithFormat:@"%@",[self.dict objectForKey:@"title"]]];
}
- (IBAction)favoritePressed:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray *temp = [[NSMutableArray alloc] initWithArray:[defaults objectForKey:@"favorites"]];
    
    if(temp==NULL){
        temp = [[NSMutableArray alloc] init];
    }
    //NSLog(@"%@", self.dict);
    //NSLog(@"%@", temp);
    [temp addObject:self.dict];
    [defaults setObject:temp forKey:@"favorites"];
    [defaults synchronize];
    
}
@end
