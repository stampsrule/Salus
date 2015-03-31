//
//  NewPatientTableViewController.h
//  Salus
//
//  Created by Daniel Bell on 2015-03-30.
//  Copyright (c) 2015 BellTechMedia. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NewPatientTableViewController;

@protocol NewPatientTableViewControllerDelegate <NSObject>
- (void)NewPatientViewControllerDidCancel:(NewPatientTableViewController *)controller;
- (void)NewPatientViewController:(NewPatientTableViewController *)controller didAddPatient:(NSDictionary *)patient;
@end

@interface NewPatientTableViewController : UITableViewController

@property (nonatomic, weak) id <NewPatientTableViewControllerDelegate> delegate;

@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *addressTextField;
@property (weak, nonatomic) IBOutlet UITextField *cityTextField;
@property (weak, nonatomic) IBOutlet UITextField *provinceTextField;
@property (weak, nonatomic) IBOutlet UITextField *postalCodeTextField;
@property (weak, nonatomic) IBOutlet UITextField *AHSIDTextField;

@property (nonatomic, strong) NSMutableData* mutableData;
@property (nonatomic, strong) NSMutableDictionary* JSONinfo;
@property (nonatomic, strong) NSMutableDictionary* patientInfo;


- (IBAction)cancel:(id)sender;
- (IBAction)done:(id)sender;
@end
