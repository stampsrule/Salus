//
//  ViewController.m
//  Salus
//
//  Created by Daniel Bell on 2015-03-15.
//  Copyright (c) 2015 BellTechMedia. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;


@end

@implementation ViewController
@synthesize mutableData;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)vaccinatorLogin:(UIButton *)sender {
    NSString *post = [NSString stringWithFormat:@"user=%@&password=%@",@"Callum.Potter",@"SDK01"];
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://52.11.148.71:3000/api/login"]];
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
    NSError *error = nil;
    NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    
    if (error != nil) {
        NSLog(@"Error parsing JSON.");
    }
    else {
        NSLog(@"Array: %@", jsonData);
        NSLog(@"Array: %@", [jsonData objectForKey:@"Message"]);
        NSLog(@"Array: %@", [jsonData objectForKey:@"Message"][0]);
        NSLog(@"Array: %@", [[jsonData objectForKey:@"Message"][0] objectForKey:@"login"]);
        //message = array
    }
    [mutableData appendData:data];
}

// This method receives the error report in case of connection is not made to server.
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    // If we get any connection error we can manage it here…
    NSLog(@"%@", error);
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"No Network Connection" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK",nil];
    [alertView show];
    
    return;

}

// This method is used to process the data after connection has made successfully.
- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    NSString *responseStringWithEncoded = [[NSString alloc] initWithData: mutableData encoding:NSUTF8StringEncoding];
    //NSLog(@"Response Json : %@", jsonString);
    
    // You can do your functions here. If your repines is in XML you have to parse the response using NSXMLParser. If your response in JSON you have use SBJSON.
}

-(void) connection:(NSURLConnection *) connection didReceiveResponse:(NSURLResponse *)response
{
    [mutableData setLength:0];
}

@end
