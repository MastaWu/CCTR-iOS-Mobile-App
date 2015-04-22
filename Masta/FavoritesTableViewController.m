//
//  FavoritesTableViewController.m
//  Masta
//
//  Created by Wu on 3/11/15.
//  Copyright (c) 2015 Wu. All rights reserved.
//

#import "FavoritesTableViewController.h"
#import "FavoriteDetailController.h"

@interface FavoritesTableViewController ()
@property (nonatomic, strong) NSArray *jsonArray;
@property (nonatomic, strong) NSDictionary *selected;
@end


@implementation FavoritesTableViewController

- (void)viewDidLoad{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.jsonArray = [defaults objectForKey:@"favorites"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.jsonArray count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%@", [[self.jsonArray objectAtIndex:indexPath.row] objectForKey:@"shortTitle"]];
    
    return cell;
}
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.selected = [self.jsonArray objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"detailFav" sender:self];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"detailFav"])
    {
        // Get reference to the destination view controller
        FavoriteDetailController *vc = [segue destinationViewController];
        
        // Pass any objects to the view controller here, like...
        vc.dict = [[NSDictionary alloc] initWithDictionary:self.selected];
    }
}

@end
