//
//  SearchParametersViewController.h
//  Salus
//
//  Created by Daniel Bell on 2015-03-27.
//  Copyright (c) 2015 BellTechMedia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchParametersViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *FirsNameTextBox;
@property (weak, nonatomic) IBOutlet UITextField *MiddleNameTextBox;
@property (weak, nonatomic) IBOutlet UITextField *LastNameTextBox;
@property (weak, nonatomic) IBOutlet UITextField *AddressTextBox;
@property (weak, nonatomic) IBOutlet UITextField *CityTextBox;
@property (weak, nonatomic) IBOutlet UITextField *ProvinceTextBox;
@property (weak, nonatomic) IBOutlet UITextField *PostalCodeTextBox;
@property (weak, nonatomic) IBOutlet UITextField *CompanyTextBox;
@property (weak, nonatomic) IBOutlet UITextField *AHSIDTextBox;
@property (weak, nonatomic) IBOutlet UIButton *SearchButton;
@property (nonatomic, strong) NSMutableData* mutableData;
@property (nonatomic, strong) NSMutableDictionary* JSONinfo;
@property (nonatomic, strong) NSMutableDictionary* patientInfo;


- (IBAction)CheckIfCanSearch:(UITextField *)sender;
- (IBAction)SearchForPatient:(UIButton *)sender;
- (IBAction)ScanDL:(UIButton *)sender;


@end
