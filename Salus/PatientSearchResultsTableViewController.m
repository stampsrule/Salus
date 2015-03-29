//
//  PatientSearchResultsTableViewController.m
//  Salus
//
//  Created by Daniel Bell on 2015-03-28.
//  Copyright (c) 2015 BellTechMedia. All rights reserved.
//

#import "PatientSearchResultsTableViewController.h"
#import "NameConversions.h"

@implementation PatientSearchResultsTableViewController

@synthesize JSONinfo;

-(void)viewDidLoad{
    NSLog(@"results did load with: %@", JSONinfo);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return JSONinfo.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"patientInfoCell"];
    if (JSONinfo.count>0) {
        NSMutableDictionary *patient = JSONinfo[indexPath.row];
        
        UILabel *nameLabel = (UILabel *)[cell viewWithTag:100];
        nameLabel.text = [NSString stringWithFormat:@"%@ %@",[patient objectForKey:@"first_name"], [patient objectForKey:@"last_name"]];
        UILabel *addressLabel = (UILabel *)[cell viewWithTag:101];
        addressLabel.text = [NSString stringWithFormat:@"%@ %@ %@ %@",[patient objectForKey:@"address"], [patient objectForKey:@"city"], [NameConversions convert:[patient objectForKey:@"province"]], [patient objectForKey:@"postal_code"]];
        //
        //    UILabel *gameLabel = (UILabel *)[cell viewWithTag:102];
        //    gameLabel.text = player.game;

    }
    
    return cell;
}

-(NSString *)convertProvince:(NSString*)name{
    NSString *shortName = @"";
    
    return shortName;
}

@end
