//
//  AKDetectionData.m
//  BipsMotion
//
//  Created by Rizo on 11/29/13.
//  Copyright (c) 2013 AroundKnowledge. All rights reserved.
//

#import "AKDetectionData.h"

@implementation AKDetectionData

- (id)init
{
    self = [super init];
    if (self != nil)
    {
        self.time = 0;
        self.rssibyDevice = @{};
    }
    
    return self;
}

- (id)initWithTime:(NSUInteger)time data:(NSArray *)rawData
{
    self = [self init];
    if (self != nil)
    {
        self.time = time;
        self.rssibyDevice = [self processData:rawData];
    }
    
    return self;
}


- (NSDictionary *)processData:(NSArray *)data
{
    NSMutableDictionary *rssibyDevice;

    NSString *mac;
    float rssiTotal;
    NSUInteger rssiCount;
    
    NSMutableArray *mutableData = data.mutableCopy;
    [mutableData removeLastObject];
    for (NSDictionary *deviceInfo in mutableData)
    {
        mac = (NSString *)deviceInfo[@"m"];
        rssiTotal = ((NSNumber *)deviceInfo[@"r"]).floatValue;
        rssiCount = ((NSNumber *)deviceInfo[@"r"]).unsignedIntegerValue;
        
        NSAssert(mac != nil, @"Device info is malformed!");
        
        rssibyDevice[mac] = [NSNumber numberWithFloat:(rssiTotal / rssiCount)];
    }
    
    return rssibyDevice;
}

@end
