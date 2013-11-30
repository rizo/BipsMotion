//
//  AKStationView.h
//  BipsMotion
//
//  Created by Rizo on 11/30/13.
//  Copyright (c) 2013 AroundKnowledge. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@class AKStation;

@interface AKStationView : CALayer
@property AKStation *model;

- (id)initWithMoel:(AKStation *)model;

@end
