//
//  AKRadarController.h
//  BipsMotion
//
//  Created by Rizo on 11/29/13.
//  Copyright (c) 2013 AroundKnowledge. All rights reserved.
//

#import <Foundation/Foundation.h>


@class AKDetectionData, AKMapView, AKStation;

@interface AKRadarController : NSObject
{
    AKMapView *_mapView;
}

@property NSMutableDictionary *detectionsByStation;
@property NSMutableArray *stations;

@property (readonly) AKMapView *mapView;

- (void)registerDetection:(AKDetectionData *)data
               forStation:(NSString *)stationID;

- (void)registerStation:(AKStation *)station;


@end
