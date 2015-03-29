//
//  NameConversions.m
//  Salus
//
//  Created by Daniel Bell on 2015-03-29.
//  Copyright (c) 2015 BellTechMedia. All rights reserved.
//

#import "NameConversions.h"

@implementation NameConversions

@synthesize nameTable;

+(NSString *)convert: (NSString *)name{
    NSMutableDictionary *mutableNameTable = [[NSMutableDictionary alloc] init];
    [mutableNameTable setObject:@"AB" forKey:@"Alberta"];
    [mutableNameTable setObject:@"BC" forKey:@"British Columbia"];
    [mutableNameTable setObject:@"SK" forKey:@"Saskatchewan"];
    [mutableNameTable setObject:@"MB" forKey:@"Manitoba"];
    [mutableNameTable setObject:@"NB" forKey:@"New Brunswick"];
    [mutableNameTable setObject:@"NL" forKey:@"Newfoundland and Labrador"];
    [mutableNameTable setObject:@"NS" forKey:@"Nova Scotia"];
    [mutableNameTable setObject:@"ON" forKey:@"Ontario"];
    [mutableNameTable setObject:@"PE" forKey:@"Prince Edward Island"];
    [mutableNameTable setObject:@"QC" forKey:@"Quebec"];
    
    NSString *shortName = [mutableNameTable objectForKey:name];
    
    return shortName;
}
@end
