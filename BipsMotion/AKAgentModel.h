//
//  AKAgentModel.h
//  BipsMotion
//
//  Created by Rizo on 11/18/13.
//  Copyright (c) 2013 AroundKnowledge. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AKAgentModel : NSObject
{
@private
    
    NSMutableDictionary *positionsByTime;
    CGMutablePathRef mutableTajectory;
}

/* The unique identifer of the person. */
@property NSNumber *identifer;

@property (readonly) CGPathRef trajectory;

@property CGPoint initialPosition;
@property NSUInteger initialMoment;

- (id)initWithInitialPosition:(CGPoint)position
                    forMoment:(NSUInteger)second;

- (id)initWithPositions:(NSArray *)positions
                moments:(NSArray *)seconds;

- (void)addPositions:(NSArray *)positions
          forMoments:(NSArray *)seconds;

- (void)addPosition:(CGPoint)position
          forMoment:(NSUInteger)second;

- (CGPoint)positionAtMoment:(NSUInteger)second;

@end
