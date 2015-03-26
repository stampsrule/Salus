//
//  DataService.h
//  Salus
//
//  Created by Daniel Bell on 2015-03-26.
//  Copyright (c) 2015 BellTechMedia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataService : NSObject <NSURLConnectionDelegate, NSURLConnectionDataDelegate>

@property (nonatomic, strong) NSMutableData* mutableData;
@property (nonatomic, strong) NSDictionary* JSONinfo;

- (void)SendMessage:(NSString *)message POSTto:(NSURL *)url;

@end
