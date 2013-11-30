//
//  AKAgentView.h
//  BipsMotion
//
//  Created by Rizo on 11/18/13.
//  Copyright (c) 2013 AroundKnowledge. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>


@class AKAgentModel;


@interface AKAgentView : CALayer

/*! The reference to the model for the agent. */
@property AKAgentModel *model;

/*! The current position of the agent view. */
@property (readonly) CGPoint *currentPosition;

/*! The current time value of the agent's view (in seconds). */
@property (readonly) NSUInteger *currentSecond;

/*!
 * Initializes a view for the given agent's model.
 * \param model The model of the agent.
 * \return The new agent view object.
 */
- (id)initWithModel:(AKAgentModel *)model;


@end
