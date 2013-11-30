//
//  AKApplicationDelegate.h
//  BipsMotion
//
//  Created by Rizo on 11/29/13.
//  Copyright (c) 2013 AroundKnowledge. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AKMosquittoClient.h"

@class AKMosquittoClient, AKMosquittoMessage, AKRadarController;

@interface AKApplicationDelegate : NSObject <NSApplicationDelegate, AKMosquittoClientDelegate>

@property AKMosquittoClient *mosquittoClient;
@property AKRadarController *radarController;

#pragma mark -
#pragma mark Mosquitto Delegate Methods

- (void)didConnect:(NSUInteger)code;
- (void)didDisconnect;
- (void)didPublish:(NSUInteger)messageId;

- (void)didReceiveMessage:(AKMosquittoMessage*)mosq_msg;
- (void)didSubscribe:(NSUInteger)messageId grantedQos:(NSArray*)qos;
- (void)didUnsubscribe:(NSUInteger)messageId;


@end
