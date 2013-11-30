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

/*! The unique identifer of the person. */
@property NSNumber *identifer;

/*! The current trajectory of the agent. */
@property (readonly) CGPathRef trajectory;

/*! The initial position of the agent. */
@property CGPoint initialPosition;

/*! The moment the agent appears. */
@property NSUInteger initialMoment;

/*! Creates a new agent model with the initial options.
 * \param position The initial position.
 * \param second The initial moment.
 * \return A new instance of the model.
 */
- (id)initWithInitialPosition:(CGPoint)position
                    forMoment:(NSUInteger)second;

/*! Creates a new agent model with the grouped parameters.
 * \param positions The array of all positions.
 * \param second The array of time values.
 * \return A new instance of the model.
 */
- (id)initWithPositions:(NSArray *)positions
                moments:(NSArray *)seconds;

/*! Adds an array of positions and seconds to the model.
 * \param positions The array of positions.
 * \param second The array of time values.
 */
- (void)addPositions:(NSArray *)positions
          forMoments:(NSArray *)seconds;

/*! Adds an a position for a given moment.
 * \param position The positions to add.
 * \param second The time value of the positon.
 */
- (void)addPosition:(CGPoint)position
          forMoment:(NSUInteger)second;

/*! Returns the agent's position for a given moment.
 * \param second The second for which the position will be returned.
 */
- (CGPoint)positionForMoment:(NSUInteger)second;

@end
