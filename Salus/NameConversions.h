//
//  NameConversions.h
//  Salus
//
//  Created by Daniel Bell on 2015-03-29.
//  Copyright (c) 2015 BellTechMedia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NameConversions : NSObject

@property (nonatomic, strong) NSDictionary* nameTable;

+(NSString *)convert: (NSString *)name;
+(NSArray *)getKeyArray;
+(NSArray *)getObjectArray;
+(NSString *)getVaccineNameforcode:(NSString *)key;

@end
