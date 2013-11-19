//
//  AKAgentView.m
//  BipsMotion
//
//  Created by Rizo on 11/18/13.
//  Copyright (c) 2013 AroundKnowledge. All rights reserved.
//

#import "AKAgentView.h"
#import "AKAgentModel.h"
#import "OGColors.h"


/* The default size of the person's view. */
static CGSize AKAgentViewDefaultSize = (CGSize) { 20.0f, 20.0f };

/* The default z-position of the person's view. */
static NSInteger AKAgentViewDefaultZPosition = 1;


@implementation AKAgentView

- (id)initWithModel:(AKAgentModel *)model
{
    self = [super init];
    if (self != nil)
    {
        // Geomtery
        self.anchorPoint = CGPointMake(0.5f, 0.5f);
        self.position = model.initialPosition;
        self.bounds = CGRectMake(0.0f, 0.0f,
                                 AKAgentViewDefaultSize.width,
                                 AKAgentViewDefaultSize.height);
        self.zPosition = AKAgentViewDefaultZPosition;
        
        // Style
        self.backgroundColor = OG_RGB(74, 144, 226);
        self.borderWidth = 2.0f;
        self.borderColor = OG_WHITE;
        self.cornerRadius = 10.0f;
        
        self.shadowColor = OG_RGB(0, 0, 0);
        self.shadowOpacity = 0.5;
        self.shadowRadius = 1.0;
        self.shadowOffset = (CGSize) { 1.0f, -1.0f };
        
        // Options
        self.name = [NSString stringWithFormat:@"#%@", model.identifer];
        self.doubleSided = NO;
        
        [self setNeedsDisplay];
    }
    
    return self;
}


@end