//
//  AdverseReactionViewController.m
//  Salus
//
//  Created by Daniel Bell on 2015-03-31.
//  Copyright (c) 2015 BellTechMedia. All rights reserved.
//

#import "AdverseReactionViewController.h"
#import "NameConversions.h"
#import "SignatureScreenController.h"

@implementation AdverseReactionViewController


#pragma mark - PlayerDetailsViewControllerDelegate

-(void)vaccineSelectorViewController:(vaccineSelectorViewController *)controller didChooseValue:(NSString *)vaccine
{
    self.VaccineLabel.text = [NameConversions getVaccineNameforcode:vaccine];
    [self.thePatient setObject:vaccine forKey:@"Vaccine_Code"];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)AcceptImmunization:(UIButton *)sender {
    [self performSegueWithIdentifier:@"GoToSign" sender:self];
}
- (IBAction)RejectImmunization:(id)sender {
    NSArray* viewControllersInStack = self.navigationController.viewControllers;
    UIViewController* targetViewController = [viewControllersInStack objectAtIndex:0];
    [self.navigationController popToViewController:targetViewController animated:YES];
//    UINavigationController * navigationController = self.navigationController;
//    NSLog(@"%@", navigationController);
//    NSLog(@"cancel tapped though");
//    [navigationController popToRootViewControllerAnimated:NO];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"selectVaccine"]) {
        
        UINavigationController *navigationController = segue.destinationViewController;
        vaccineSelectorViewController *vaccineSelector = [navigationController viewControllers][0];
        vaccineSelector.delegate = self;
    }
    
    if ([segue.identifier isEqualToString:@"GoToSign"]) {
        SignatureScreenController *controller = [segue destinationViewController];
        controller.thePatient = self.thePatient;
    }
    
}


@end
