//
//  AKDocument.h
//  BipsMotion
//
//  Created by Rizo on 11/18/13.
//  Copyright (c) 2013 AroundKnowledge. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@class AKMapView, AKMosquittoClient;

@interface AKDocument : NSDocument

/*! The outlet for the map view. */
@property (weak) IBOutlet AKMapView *mapView;

/*! The container for all the agents, by identifer. */
@property NSMutableDictionary *agentsByIdentifier;

@end
