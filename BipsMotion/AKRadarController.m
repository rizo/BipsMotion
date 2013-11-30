//
//  AKRadarController.m
//  BipsMotion
//
//  Created by Rizo on 11/29/13.
//  Copyright (c) 2013 AroundKnowledge. All rights reserved.
//

#import "AKRadarController.h"
#import "AKMapView.h"
#import "AKDocument.h"
#import "AKAgentModel.h"
#import "AKAgentView.h"
#import "AKStation.h"
#import "AKStationView.h"


@implementation AKRadarController

- (id)init
{
    self = [super init];
    if (self != nil)
    {
        self.detectionsByStation = @{}.mutableCopy;
        self.stations = @[].mutableCopy;
    }
    
    return self;
}



- (void)registerDetection:(AKDetectionData *)data
               forStation:(NSString *)stationID
{
    NSMutableArray *detection_list = self.detectionsByStation[stationID];
    
    if (detection_list == nil)
    {
        detection_list = @[].mutableCopy;
        self.detectionsByStation[stationID] = detection_list;
    }

    [detection_list addObject:data];
    
//    [self updateMap];
}


- (void)registerStation:(AKStation *)station
{
    [self.stations addObject:station];
    AKStationView *stationView = [[AKStationView alloc] initWithMoel:station];
    [self.mapView.layer addSublayer:stationView];
}


- (void)updateMap
{
    
}


- (AKMapView *)mapView
{
    if (_mapView == nil)
    {
        AKDocument *doc = [[NSDocumentController sharedDocumentController] currentDocument];
        _mapView = doc.mapView;
    }
    
    return _mapView;
}

@end
