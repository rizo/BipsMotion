//
//  AKAgentModel.m
//  BipsMotion
//
//  Created by Rizo on 11/18/13.
//  Copyright (c) 2013 AroundKnowledge. All rights reserved.
//

#import "AKAgentModel.h"

@implementation AKAgentModel

- (id)initWithInitialPosition:(CGPoint)position
                    forMoment:(NSUInteger)second
{
    self = [super init];
    if (self)
    {
        positionsByTime = [NSMutableDictionary dictionary];
        self.initialPosition = position;
        self.initialMoment = second;

        self->mutableTajectory = CGPathCreateMutable();
        CGPathMoveToPoint(self->mutableTajectory, NULL, position.x, position.y);
        
        [self addPosition:position forMoment:0];
    }
    
    return self;
}


- (id)initWithPositions:(NSArray *)positions
                moments:(NSArray *)seconds
{
    self = [super init];
    if (self)
    {
        positionsByTime = [NSMutableDictionary dictionary];
        self.initialPosition = ((NSValue *)positions[1]).pointValue;
        self.initialMoment = ((NSNumber *)seconds[1]).unsignedIntegerValue;
        
        self->mutableTajectory = CGPathCreateMutable();
        CGPathMoveToPoint(self->mutableTajectory,
                          NULL,
                          self.initialPosition.x,
                          self.initialPosition.y);
        
        [self addPositions:positions forMoments:seconds];
    }
    
    return self;
}


- (CGPathRef)trajectory
{
    return (CGPathRef)self->mutableTajectory;
}


- (void)addPositions:(NSArray *)positions
          forMoments:(NSArray *)seconds
{
    NSAssert(positions.count == seconds.count,
             @"The number of positions does not match the number of momends!");
    
    for (NSUInteger i = 0; i < positions.count; ++i)
    {
        CGPoint position = ((NSValue *)positions[i]).pointValue;
        NSUInteger second = ((NSNumber *)seconds[i]).integerValue;

        [self addPosition:position forMoment:second];
    }
}


- (void)addPosition:(CGPoint)position
          forMoment:(NSUInteger)second
{
    NSNumber *secondValue = [NSNumber numberWithUnsignedInteger:second];
    NSValue *positionValue = [NSValue valueWithPoint:position];
    
    self->positionsByTime[secondValue] = positionValue;
    
    CGPathAddLineToPoint(self->mutableTajectory, NULL, position.x, position.y);
}


- (CGPoint)positionAtMoment:(NSUInteger)second
{
    NSNumber *secondValue = [NSNumber numberWithUnsignedInteger:second];
    NSValue *positionValue = self->positionsByTime[secondValue];
    
    CGPoint p;
    if (positionValue != nil) {
        p = positionValue.pointValue;
    }
    else {
        NSLog(@"Warning: The position value was not found. Returning zero point.");
        p = CGPointZero;
    }
    
    return p;
}

@end

