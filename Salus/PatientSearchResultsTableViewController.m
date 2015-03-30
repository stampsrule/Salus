//
//  PatientSearchResultsTableViewController.m
//  Salus
//
//  Created by Daniel Bell on 2015-03-28.
//  Copyright (c) 2015 BellTechMedia. All rights reserved.
//

#import "PatientSearchResultsTableViewController.h"
#import "NameConversions.h"
#import "PatientCell.h"

@implementation PatientSearchResultsTableViewController

@synthesize JSONinfo;

-(void)viewDidLoad{
    NSLog(@"results did load with: %@", JSONinfo);
    NSLog(@"size of array: %lu", JSONinfo.count);
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
    PatientCell *cell = (PatientCell *)[tableView dequeueReusableCellWithIdentifier:@"patientInfoCell"];
    NSMutableDictionary *patient = JSONinfo[indexPath.row];
    cell.nameLabel.text =  [NSString stringWithFormat:@"%@ %@",[patient objectForKey:@"first_name"], [patient objectForKey:@"last_name"]];
    cell.addressLabel.text = [NSString stringWithFormat:@"%@ %@ %@ %@",[patient objectForKey:@"address"], [patient objectForKey:@"city"], [NameConversions convert:[patient objectForKey:@"province"]], [patient objectForKey:@"postal_code"]];
    cell.AHSIDLabel.text = [NSString stringWithFormat:@"%@",[patient objectForKey:@"idpatient"]];
    
    return cell;
}


@end
