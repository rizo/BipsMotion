//
//  AKDetectionData.h
//  BipsMotion
//
//  Created by Rizo on 11/29/13.
//  Copyright (c) 2013 AroundKnowledge. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AKDetectionData : NSObject

@property NSUInteger time;
@property NSDictionary *rssibyDevice;

- (id)initWithTime:(NSUInteger)time data:(NSArray *)rawData;

@end
