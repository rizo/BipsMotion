//
//  AKMapView.h
//  BipsMotion
//
//  Created by Rizo on 11/18/13.
//  Copyright (c) 2013 AroundKnowledge. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AKMapView : NSView

- (void)document:(NSDocument *)document
   didLoadAgents:(NSArray *)agents;

@end
