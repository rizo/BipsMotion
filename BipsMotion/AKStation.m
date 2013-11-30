//
//  AKStation.m
//  BipsMotion
//
//  Created by Rizo on 11/30/13.
//  Copyright (c) 2013 AroundKnowledge. All rights reserved.
//

#import "AKStation.h"

@implementation AKStation

- (id)initWithID:(NSString *)identifier position:(CGPoint)position
{
    self = [super init];
    if (self != nil)
    {
        self.identifier = identifier;
        self.position = position;
    }
    
    return self;
}

@end
