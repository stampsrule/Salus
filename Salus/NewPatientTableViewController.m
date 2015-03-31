//
//  NewPatientTableViewController.m
//  Salus
//
//  Created by Daniel Bell on 2015-03-30.
//  Copyright (c) 2015 BellTechMedia. All rights reserved.
//

#import "NewPatientTableViewController.h"

@implementation NewPatientTableViewController

@synthesize mutableData;

- (IBAction)cancel:(id)sender
{
    [self.delegate NewPatientViewControllerDidCancel:self];
}


- (IBAction)done:(id)sender
{
    NSUInteger r = arc4random_uniform(2000) + 2000;

    NSString *sendMessage = [NSString stringWithFormat:@"first_name=%@&last_name=%@&address=%@&city=%@&province=%@&postal_code=%@&idpatient=%d",self.firstNameTextField.text, self.lastNameTextField.text, self.addressTextField.text, self.cityTextField.text, self.provinceTextField.text, self.postalCodeTextField.text, (int)r];
    NSURL *POSTto = [NSURL URLWithString:@"http://52.11.148.71:3000/api/newPatient"];
    
    NSData *postData = [sendMessage dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:POSTto];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    if(conn) {
        NSLog(@"Connection Successful");
        mutableData = [[NSMutableData alloc] init];
    } else {
        NSLog(@"Connection could not be made");
    }
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        [self.firstNameTextField becomeFirstResponder];
    }
    if (indexPath.section == 1) {
        [self.lastNameTextField becomeFirstResponder];
    }
    if (indexPath.section == 2) {
        [self.addressTextField becomeFirstResponder];
    }
    if (indexPath.section == 3) {
        [self.cityTextField becomeFirstResponder];
    }
    if (indexPath.section == 4) {
        [self.provinceTextField becomeFirstResponder];
    }
    if (indexPath.section == 5) {
        [self.postalCodeTextField becomeFirstResponder];
    }
    if (indexPath.section == 6) {
        [self.AHSIDTextField becomeFirstResponder];
    }
    
}

#pragma mark –
#pragma mark NSURLConnection delegates
// This method is used to receive the data which we get using post method.
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData*)data{
    [mutableData appendData:data];
}

// This method receives the error report in case of connection is not made to server.
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    // If we get any connection error we can manage it here…
    NSLog(@"%@", error);
    return;
    
}

// This method is used to process the data after connection has made successfully.
- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    NSError *error = nil;
    NSMutableDictionary *JSONinfo = [NSJSONSerialization JSONObjectWithData:mutableData options:kNilOptions error:&error];
    if (error != nil) {
        NSLog(@"Error parsing JSON.");
    }
    NSLog(@"connectionDidFinishLoading");
    if (JSONinfo) {
        NSArray *tempPatientArray = [JSONinfo objectForKey:@"Message"];
        if (tempPatientArray.count==0) {
        } else if (tempPatientArray.count>0){
            NSLog(@"%@", JSONinfo);
            NSMutableDictionary *patientInfo  = [[NSMutableDictionary alloc] init];
            [patientInfo setObject:[NSString stringWithFormat:@"%@", self.firstNameTextField.text] forKey:@"FirstName"];
            [patientInfo setObject:[NSString stringWithFormat:@"%@", self.lastNameTextField.text] forKey:@"LastName"];
            [patientInfo setObject:[NSString stringWithFormat:@"%@", self.addressTextField.text] forKey:@"Address"];
            [patientInfo setObject:[NSString stringWithFormat:@"%@", self.cityTextField.text] forKey:@"City"];
            [patientInfo setObject:[NSString stringWithFormat:@"%@", self.provinceTextField.text] forKey:@"Province"];
            [patientInfo setObject:[NSString stringWithFormat:@"%@", self.postalCodeTextField.text] forKey:@"PostalCode"];
            [patientInfo setObject:[NSString stringWithFormat:@"%@", self.AHSIDTextField.text] forKey:@"AHSID"];
            [self.delegate NewPatientViewController:self didAddPatient:patientInfo];
        }
    }

}


-(void) connection:(NSURLConnection *) connection didReceiveResponse:(NSURLResponse *)response
{
    mutableData = [NSMutableData data];
}
@end
