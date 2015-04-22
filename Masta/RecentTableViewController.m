//
//  RecentTableViewController.m
//  Masta
//
//  Created by Wu on 4/20/15.
//  Copyright (c) 2015 Wu. All rights reserved.
//

#import "RecentTableViewController.h"
#import "ResultsDetailViewController.h"

@interface RecentTableViewController ()

@property (nonatomic, strong) NSDictionary *selected;

@end

@implementation RecentTableViewController

- (void)viewDidLoad{
    self.json = [[NSUserDefaults standardUserDefaults] objectForKey:@"RecentJson"];
    NSLog(@"%lu", (unsigned long)[self.json count]);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.json count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [UITableViewCell new];
    cell.textLabel.text = [NSString stringWithFormat:@"%@", [[self.json objectAtIndex:indexPath.row] objectForKey:@"shortTitle"]];
    
    return cell;
}
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.selected = [self.json objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"detailRecent" sender:self];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"detailRecent"])
    {
        // Get reference to the destination view controller
        ResultsDetailViewController *vc = [segue destinationViewController];
        
        // Pass any objects to the view controller here, like...
        vc.dict = [[NSMutableDictionary alloc] initWithDictionary:self.selected];
    }
}

@end
