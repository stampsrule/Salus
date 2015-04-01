//
//  AdverseReactionViewController.m
//  Salus
//
//  Created by Daniel Bell on 2015-03-31.
//  Copyright (c) 2015 BellTechMedia. All rights reserved.
//

#import "AdverseReactionViewController.h"

@implementation AdverseReactionViewController


#pragma mark - PlayerDetailsViewControllerDelegate

-(void)vaccineSelectorViewController:(vaccineSelectorViewController *)controller didChooseValue:(NSString *)vaccine
{
    self.VaccineLabel.text = vaccine;
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"selectVaccine"]) {
        
        UINavigationController *navigationController = segue.destinationViewController;
        vaccineSelectorViewController *vaccineSelector = [navigationController viewControllers][0];
        vaccineSelector.delegate = self;
    }
}


@end
