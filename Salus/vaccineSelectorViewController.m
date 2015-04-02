//
//  vaccineSelectorViewController.m
//  Salus
//
//  Created by Daniel Bell on 2015-04-01.
//  Copyright (c) 2015 BellTechMedia. All rights reserved.
//

#import "vaccineSelectorViewController.h"
#import "NameConversions.h"

@implementation vaccineSelectorViewController


- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)Save:(id)sender
{
    [self.delegate vaccineSelectorViewController:self didChooseValue:vaccine];
}


#pragma mark - Picker View Data source
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [NameConversions getKeyArray].count;
}

#pragma mark- Picker View Delegate

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    vaccine = [NSString stringWithFormat:@"%@",[[NameConversions getKeyArray] objectAtIndex:row]];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [NameConversions getObjectArray][row];
}
@end
