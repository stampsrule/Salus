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
#import "DispensingTableViewController.h"
#import "AdverseReactionViewController.h"


@implementation PatientSearchResultsTableViewController
NSMutableDictionary *mydictionary;
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    mydictionary = [[NSMutableDictionary alloc] initWithDictionary:[JSONinfo objectAtIndex:indexPath.row]];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Adverse Side Effects" message:@"Has the patient been advised of the adverse side effectst?" delegate:self cancelButtonTitle:@"Yes" otherButtonTitles:nil];
    [alert addButtonWithTitle:@"No"];
    [alert show];
}

// based off button do segue
// pass data through segue

//

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {     // and they clicked OK.
        [self performSegueWithIdentifier:@"GoStraightToDispense" sender:self];
    }
    if (buttonIndex == 1) {     // and they clicked OK.
        [self performSegueWithIdentifier:@"GivePatientReactionInfo" sender:self];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"GoStraightToDispense"])
    {
        DispensingTableViewController *controller = [segue destinationViewController];
        controller.thePatient = mydictionary;
    }
    
    if ([[segue identifier] isEqualToString:@"GivePatientReactionInfo"])
    {
        AdverseReactionViewController *controller = [segue destinationViewController];
        controller.thePatient = mydictionary;
    }
}
@end
