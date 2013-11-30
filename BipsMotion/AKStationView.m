//
//  AKStationView.m
//  BipsMotion
//
//  Created by Rizo on 11/30/13.
//  Copyright (c) 2013 AroundKnowledge. All rights reserved.
//

#import "AKStationView.h"
#import "AKStation.h"
#import "OGColors.h"


static CGSize AKStationViewDefaultSize = (CGSize) { 30.0f, 30.0f };


@implementation AKStationView

- (id)initWithMoel:(AKStation *)model
{
    self = [super init];
    if (self != nil)
    {
        self.model = model;
        self.position = model.position;

        // Geomtery
        self.anchorPoint = CGPointMake(0.5f, 0.5f);
        self.bounds = CGRectMake(0.0f, 0.0f,
                                 AKStationViewDefaultSize.width,
                                 AKStationViewDefaultSize.height);
        self.zPosition = 5;
        
        // Style
        self.backgroundColor = OG_RGB(226, 74, 74);
        self.borderWidth = 2.0f;
        self.borderColor = OG_WHITE;
        self.cornerRadius = 15.0f;
        
        self.shadowColor = OG_RGB(0, 0, 0);
        self.shadowOpacity = 0.5;
        self.shadowRadius = 1.0;
        self.shadowOffset = (CGSize) { 1.0f, -1.0f };
        
        // Options
        self.name = [NSString stringWithFormat:@"#%@", self.model.identifier];
        self.doubleSided = NO;
        
        [self setNeedsDisplay];
    }
    
    return self;

}

@end
