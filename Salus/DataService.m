//
//  DataService.m
//  Salus
//
//  Created by Daniel Bell on 2015-03-26.
//  Copyright (c) 2015 BellTechMedia. All rights reserved.
//

#import "DataService.h"

@implementation DataService

@synthesize mutableData;
@synthesize JSONinfo;

- (void)SendMessage:(NSString *)message POSTto:(NSURL *)url {
    NSData *postData = [message dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
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
    JSONinfo = [NSJSONSerialization JSONObjectWithData:mutableData options:kNilOptions error:&error];
    NSLog(@"dataDict : %@",JSONinfo);
    if (error != nil) {
        NSLog(@"Error parsing JSON.");
    }
    NSLog(@"connectionDidFinishLoading");
}

-(void) connection:(NSURLConnection *) connection didReceiveResponse:(NSURLResponse *)response
{
    mutableData = [NSMutableData data];
}

@end
