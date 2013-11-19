//
//  AKMapView.m
//  BipsMotion
//
//  Created by Rizo on 11/18/13.
//  Copyright (c) 2013 AroundKnowledge. All rights reserved.
//

#import "AKMapView.h"
#import "OGColors.h"
#import "AKDocument.h"
#import "AKAgentModel.h"
#import "AKAgentView.h"


@implementation AKMapView


-(id)initWithCoder:(NSCoder*)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        // Create the root layer.
        CALayer *rootLayer = [CALayer layer];
        rootLayer.backgroundColor = OG_WHITE;
        
        // Configure the view to use the layer.
        self.wantsLayer = YES;
        self.layer = rootLayer;
        self.needsDisplay = YES;
    }
    
    return self;
}


- (void)document:(NSDocument *)document
   didLoadAgents:(NSArray *)agents
{
    AKAgentView *view;
    NSUInteger index = 0;
    for (AKAgentModel *model in agents)
    {
        view = [[AKAgentView alloc] initWithModel:model];
        [self.layer addSublayer:view];
        
        // Agent animation.
        CAKeyframeAnimation *agentAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
        agentAnimation.duration = 10;
        agentAnimation.path = model.trajectory;
        agentAnimation.repeatCount = HUGE_VALF;
        agentAnimation.calculationMode = kCAAnimationPaced;
        [view addAnimation:agentAnimation forKey:@"agentAnimation"];
        
        // Trajectory animation.
        CAShapeLayer *trajectoryLayer = [CAShapeLayer layer];
        trajectoryLayer.path = model.trajectory;
        trajectoryLayer.strokeColor = OG_RGB(100, 100, 100);
        trajectoryLayer.lineWidth = 1.0;
        trajectoryLayer.fillColor = OG_TRANSPARENT;
        trajectoryLayer.lineDashPattern = @[@6, @3];
        [self.layer addSublayer:trajectoryLayer];
        
        CABasicAnimation *trajectoryAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        trajectoryAnimation.duration = 10;
        trajectoryAnimation.repeatCount = HUGE_VALF;
        trajectoryAnimation.fromValue = @0.0f;
        trajectoryAnimation.toValue = @1.0f;
        [trajectoryLayer addAnimation:trajectoryAnimation forKey:@"strokeEndAnimation"];

        ++index;
    }
}



- (void)drawRect:(NSRect)dirtyRect
{
    
}


@end





















