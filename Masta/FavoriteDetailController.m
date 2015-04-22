//
//  FavoriteDetailController.m
//  Masta
//
//  Created by Wu on 3/11/15.
//  Copyright (c) 2015 Wu. All rights reserved.
//

#import "FavoriteDetailController.h"

@interface FavoriteDetailController ()
@property (weak, nonatomic) IBOutlet UILabel *idLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *protocolNo;
@property (weak, nonatomic) IBOutlet UILabel *shortTitle;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (weak, nonatomic) IBOutlet UITextView *titleTextView;

@end

@implementation FavoriteDetailController

- (void) viewDidLoad{
    [super viewDidLoad];
    
    [self updateLabels];
}
- (void)updateLabels{
    [self.idLabel setText:[NSString stringWithFormat:@"%@", [self.dict objectForKey:@"id"]]];
    [self.nameLabel setText:[NSString stringWithFormat:@"%@",[self.dict objectForKey:@"name"]]];
    [self.protocolNo setText:[NSString stringWithFormat:@"%@",[self.dict objectForKey:@"protocolNo"]]];
    [self.shortTitle setText:[NSString stringWithFormat:@"%@",[self.dict objectForKey:@"shortTitle"]]];
    [self.statusLabel setText:[NSString stringWithFormat:@"%@",[self.dict objectForKey:@"status"]]];
    [self.titleTextView setText:[NSString stringWithFormat:@"%@",[self.dict objectForKey:@"title"]]];
}

@end
