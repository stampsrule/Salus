//
//  DispensingTableViewController.m
//  Salus
//
//  Created by Daniel Bell on 2015-03-31.
//  Copyright (c) 2015 BellTechMedia. All rights reserved.
//

#import "DispensingTableViewController.h"

@implementation DispensingTableViewController

//`date`,
//`Grade_code`,
//`submitter_prefix`,
//`Reason_code`,
//`Vaccine_site`,
//`admin_method`,
//`Lot_number`,
//`comment`


-(void)viewDidLoad{
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    
    long providerID = [defaults integerForKey:@"providerID"];
    [self.thePatient setObject:[NSString stringWithFormat:@"%ld",providerID] forKey:@"providerID"];
    
    long registrationID = [defaults integerForKey:@"registrationID"];
    [self.thePatient setObject:[NSString stringWithFormat:@"%ld",registrationID] forKey:@"registrationID"];

    
    
    for (NSString *key in self.thePatient)
    {
        NSString *value = [self.thePatient objectForKey:key];
        NSLog(@"%@ : %@", key, value);
    }
    
}
@end
