//
//  LoginViewController.m
//  Salus
//
//  Created by Daniel Bell on 2015-03-26.
//  Copyright (c) 2015 BellTechMedia. All rights reserved.
//

#import "LoginViewController.h"

@implementation LoginViewController

@synthesize mutableData;
@synthesize username;
@synthesize passowrd;
@synthesize WrongPasswordLabel;

-(void)viewDidLoad{
    username.text=@"Callum.Potter";
    passowrd.text=@"SDK01";
    WrongPasswordLabel.hidden=true;
}

- (IBAction)Login:(UIButton *)sender {
    WrongPasswordLabel.hidden=true;
    NSString *SendMessage = [NSString stringWithFormat:@"user=%@&password=%@",username.text,passowrd.text];
    NSURL *POSTto = [NSURL URLWithString:@"http://52.11.148.71:3000/api/login"];
    
    NSData *postData = [SendMessage dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
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
    NSDictionary *JSONinfo = [NSJSONSerialization JSONObjectWithData:mutableData options:kNilOptions error:&error];
    if (error != nil) {
        NSLog(@"Error parsing JSON.");
    }
    NSLog(@"connectionDidFinishLoading");
    if (JSONinfo) {
        NSLog(@"%@", [JSONinfo objectForKey:@"Message"][0]);
        BOOL loginCredentialsAccepted = [[[JSONinfo objectForKey:@"Message"][0] objectForKey:@"pass"] boolValue];
        NSLog(@"%@", [[JSONinfo objectForKey:@"Message"][0] objectForKey:@"pass"]);
        NSLog(@"You got: %@", loginCredentialsAccepted ? @"YES" : @"NO");
        //NSLog(@"%@", loginCredentialsAccepted);
        if (loginCredentialsAccepted) {
            
            NSNumber *providerID = [[JSONinfo objectForKey:@"Message"][0] objectForKey:@"providerID"];
            NSNumber *registrationID  = [[JSONinfo objectForKey:@"Message"][0] objectForKey:@"registrationID"];
            NSNumber *personalNameNumber = [[JSONinfo objectForKey:@"Message"][0] objectForKey:@"Personal_Name_Namenumber"];
            
            
            
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            
            [defaults setInteger:[providerID integerValue] forKey:@"providerID"];
            [defaults setInteger:[registrationID integerValue] forKey:@"registrationID"];
            [defaults setInteger:[personalNameNumber integerValue] forKey:@"personalNameNumber"];
            
            [defaults synchronize];
            [self performSegueWithIdentifier:@"LoginToApp" sender:self];
        } else {
            WrongPasswordLabel.hidden=false;
        }
    }
    
}

-(void) connection:(NSURLConnection *) connection didReceiveResponse:(NSURLResponse *)response
{
    mutableData = [NSMutableData data];
}

@end

