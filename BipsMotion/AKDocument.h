//
//  AKDocument.h
//  BipsMotion
//
//  Created by Rizo on 11/18/13.
//  Copyright (c) 2013 AroundKnowledge. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class AKMapView;

@interface AKDocument : NSDocument
@property (weak) IBOutlet AKMapView *mapView;
@property NSMutableDictionary *agentsByIdentifier;
@end
