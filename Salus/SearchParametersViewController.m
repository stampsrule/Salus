//
//  SearchParametersViewController.m
//  Salus
//
//  Created by Daniel Bell on 2015-03-27.
//  Copyright (c) 2015 BellTechMedia. All rights reserved.
//

#import "SearchParametersViewController.h"
#import "PatientSearchResultsTableViewController.h"

@implementation SearchParametersViewController

#pragma mark –
#pragma mark instance variables
@synthesize FirsNameTextBox;
@synthesize MiddleNameTextBox;
@synthesize LastNameTextBox;
@synthesize AddressTextBox;
@synthesize CityTextBox;
@synthesize ProvinceTextBox;
@synthesize PostalCodeTextBox;
@synthesize CompanyTextBox;
@synthesize AHSIDTextBox;
@synthesize SearchButton;
@synthesize mutableData;
@synthesize JSONinfo;
@synthesize patientInfo;


#pragma mark –
#pragma mark methods
-(void)viewDidLoad{
    SearchButton.enabled=false;
    FirsNameTextBox.text = @"Harlan";
    LastNameTextBox.text = @"Case";
    
}

- (IBAction)CheckIfCanSearch:(UITextField *)sender {
    if (!(([FirsNameTextBox.text isEqualToString:@"First Name"] || [FirsNameTextBox.text isEqualToString:@""]) || ([LastNameTextBox.text isEqual: @"Last Name"] || [LastNameTextBox.text isEqualToString:@""]))) {
        SearchButton.enabled=true;
    } else if (!(([AddressTextBox.text isEqualToString:@"Address"]||[AddressTextBox.text isEqualToString:@""]) || ([CityTextBox.text isEqualToString:@"City"]||[CityTextBox.text isEqualToString:@""]) || ([ProvinceTextBox.text isEqualToString:@"Province"]||[ProvinceTextBox.text isEqualToString:@""]) || ([PostalCodeTextBox.text isEqualToString:@"Postal Code"]||[PostalCodeTextBox.text isEqualToString:@""]))){
        SearchButton.enabled=true;
    } else if (!([AHSIDTextBox.text isEqualToString:@""] || [AHSIDTextBox.text isEqualToString:@"AHS ID"])){
        SearchButton.enabled=true;
    }
}

- (IBAction)SearchForPatient:(UIButton *)sender {

    
//    @synthesize FirsNameTextBox;
//    @synthesize MiddleNameTextBox;
//    @synthesize LastNameTextBox;
//    @synthesize AddressTextBox;
//    @synthesize CityTextBox;
//    @synthesize ProvinceTextBox;
//    @synthesize PostalCodeTextBox;
//    @synthesize CompanyTextBox;
//    @synthesize AHSIDTextBox;

    patientInfo  = [[NSMutableDictionary alloc] init];
    
    if (![FirsNameTextBox.text isEqualToString:@"First Name"] || ![FirsNameTextBox.text isEqualToString:@""]) {
        [patientInfo setObject:[NSString stringWithFormat:@"%%%@%%", FirsNameTextBox.text] forKey:@"FirstName"];
    } else {
        [patientInfo setObject:@"%" forKey:@"FirstName"];
    }
    
    if (!(([LastNameTextBox.text isEqual: @"Last Name"] || [LastNameTextBox.text isEqualToString:@""]))) {
        [patientInfo setObject:[NSString stringWithFormat:@"%%%@%%", LastNameTextBox.text] forKey:@"LastName"];
    }else {
        [patientInfo setObject:@"%" forKey:@"LastName"];
    }
    
    if (!([AddressTextBox.text isEqualToString:@"Address"] || [AddressTextBox.text isEqualToString:@""])) {
        [patientInfo setObject:[NSString stringWithFormat:@"%%%@%%", AddressTextBox.text] forKey:@"Address"];
    }else {
        [patientInfo setObject:@"%" forKey:@"Address"];
    }
    
    if (!([CityTextBox.text isEqualToString:@"City"]||[CityTextBox.text isEqualToString:@""])) {
        [patientInfo setObject:[NSString stringWithFormat:@"%%%@%%", CityTextBox.text] forKey:@"City"];
    }else {
        [patientInfo setObject:@"%" forKey:@"City"];
    }
    
    if (!([ProvinceTextBox.text isEqualToString:@"Province"]||[ProvinceTextBox.text isEqualToString:@""])) {
        [patientInfo setObject:[NSString stringWithFormat:@"%%%@%%", ProvinceTextBox.text] forKey:@"Province"];
    }else {
        [patientInfo setObject:@"%" forKey:@"Province"];
    }
    
    if (!([PostalCodeTextBox.text isEqualToString:@"Postal Code"]||[PostalCodeTextBox.text isEqualToString:@""])) {
        [patientInfo setObject:[NSString stringWithFormat:@"%%%@%%", PostalCodeTextBox.text] forKey:@"PostalCode"];
    }else {
        [patientInfo setObject:@"%" forKey:@"PostalCode"];
    }
    
    if (!([AHSIDTextBox.text isEqualToString:@""] || [AHSIDTextBox.text isEqualToString:@"AHS ID"])){
        [patientInfo setObject:[NSString stringWithFormat:@"%%%@%%", AHSIDTextBox.text] forKey:@"AHSID"];
    }else {
        [patientInfo setObject:@"%" forKey:@"AHSID"];
    }
    
    NSString *sendMessage = @"";
    BOOL firstElement = true;
    
    for (NSString *key in patientInfo)
    {
        NSString *value = [patientInfo objectForKey:key];
        if (firstElement) {
            sendMessage = [sendMessage stringByAppendingString:[NSString stringWithFormat:@"%@=%@", key, value]];
            firstElement = false;
        } else {
            sendMessage = [sendMessage stringByAppendingString:[NSString stringWithFormat:@"&%@=%@", key, value]];
        }
    }
    
    //NSString *SendMessage = [NSString stringWithFormat:@"user=%@&password=%@",username.text,passowrd.text];
    NSURL *POSTto = [NSURL URLWithString:@"http://52.11.148.71:3000/api/patientInfo"];
    
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

//TODO: implement
- (IBAction)ScanDL:(UIButton *)sender {
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

//TODO: fix up
// This method is used to process the data after connection has made successfully.
- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    NSError *error = nil;
    JSONinfo = [NSJSONSerialization JSONObjectWithData:mutableData options:kNilOptions error:&error];
    if (error != nil) {
        NSLog(@"Error parsing JSON.");
    }
    NSLog(@"connectionDidFinishLoading");
    if (JSONinfo) {
        NSLog(@"%@", JSONinfo);
        [self performSegueWithIdentifier:@"ShowSearchResults" sender:self];
    }
      
}
// code for no results
// if no results pass parameter dictionary
// if(!JSONinfo) pass parameter dictionary

-(void) connection:(NSURLConnection *) connection didReceiveResponse:(NSURLResponse *)response
{
    mutableData = [NSMutableData data];
}

#pragma mark –
#pragma mark segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ShowSearchResults"])
    {
        PatientSearchResultsTableViewController *controller = [segue destinationViewController];
        NSMutableArray *messageArray = [JSONinfo objectForKey:@"Message"];
        controller.JSONinfo = messageArray;
    }
}
@end