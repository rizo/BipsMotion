//
//  AKMapView.h
//  BipsMotion
//
//  Created by Rizo on 11/18/13.
//  Copyright (c) 2013 AroundKnowledge. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AKMapView : NSView

/*! The delegate method to notify the view about new agent objects.
 * \param document The document that sent the notification.
 * \param agents The array of new agent objects..
 */
- (void)document:(NSDocument *)document
   didLoadAgents:(NSArray *)agents;

@end
