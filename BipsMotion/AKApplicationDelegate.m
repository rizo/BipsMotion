//
//  AKApplicationDelegate.m
//  BipsMotion
//
//  Created by Rizo on 11/29/13.
//  Copyright (c) 2013 AroundKnowledge. All rights reserved.
//

#import "AKApplicationDelegate.h"
#import "AKRadarController.h"
#import "AKDetectionData.h"
#import "AKStation.h"
#import "getMacAddress.h"



static NSString * const AKMosquittoHandShake = @"handshake";
static NSString * const AKMosquittoControlTopic = @"control/circus";
static NSString * const AKMosquittoStationsTopic = @"stations/circus";
static NSString * const AKMosquittoDataTopic = @"tri_data/circus/#";
static NSString * const AKMosquittoDataTopicPrefix = @"tri_data/circus/";


@implementation AKApplicationDelegate


- (void)applicationDidFinishLaunching:(NSNotification *)notification
{
    self.radarController = [[AKRadarController alloc] init];
    
    [self setupMosquitto];
	[self.mosquittoClient connect];

    // Subscribe to listen for stations data.
    [self.mosquittoClient subscribe:AKMosquittoStationsTopic];

    // Send the hand-shake reqest to get the stations data.
    [self.mosquittoClient publishString:AKMosquittoHandShake
                                toTopic:AKMosquittoControlTopic
                                withQos:2 // 4way hand shake.
                                 retain:NO];
}


- (void)setupMosquitto
{
    NSString *clientId = [NSString stringWithFormat:@"BipsMotion/%@", getMacAddress()];
    self.mosquittoClient = [[AKMosquittoClient alloc] initWithClientId:clientId];
    self.mosquittoClient.delegate = self;
    
    self.mosquittoClient.host = @"85.25.204.60";
    self.mosquittoClient.port = 1111;

}

- (void)processDetectionMessage:(NSString *)msg
{
    NSDictionary *detectionDictionary = \
        [NSJSONSerialization JSONObjectWithData:[msg dataUsingEncoding:NSUTF8StringEncoding]
                                        options:NSJSONReadingMutableContainers
                                          error:nil];

    NSAssert(detectionDictionary != nil, @"Cound not parse the detection message.");
    
    NSNumber *timeValue = (NSNumber *)detectionDictionary[@"ts"];
    NSUInteger time = timeValue.unsignedIntegerValue;
    NSString *stationID = detectionDictionary[@"id"];
    NSArray *rawData = detectionDictionary[@"data"];
    
    NSAssert(timeValue != nil, @"No time value found in the message!");
    NSAssert(stationID != nil, @"No station ID found in the message!");
    NSAssert(rawData != nil, @"There is no captured data in the message!");
    
    AKDetectionData *detection = [[AKDetectionData alloc] initWithTime:time data:rawData];
    [self.radarController registerDetection:detection forStation:stationID];
}


- (void)processStationsMessage:(NSString *)msg
{
    NSLog(@"stations: %@", msg);
    NSError *error;
    NSArray *stationsArray = \
        [NSJSONSerialization JSONObjectWithData:[msg dataUsingEncoding:NSUTF8StringEncoding]
                                        options:0
                                          error:&error];
    
    NSAssert(stationsArray != nil, @"Cound not parse the stations data.");
    
    for (NSDictionary *sd in stationsArray)
    {
        NSString *stationID = sd[@"id"];
        
        NSNumber *xValue = sd[@"x"],
                 *yValue = sd[@"y"];
        NSAssert(xValue != nil, @"No x coordinate.");
        NSAssert(yValue != nil, @"No y coordinate.");
        CGPoint position = CGPointMake(xValue.floatValue * 100.0 + 50.0,
                                       yValue.floatValue * 100.0 + 50.0);
        
        AKStation *station = [[AKStation alloc] initWithID:stationID position:position];
        [self.radarController registerStation:station];
    }
}


- (void)applicationWillTerminate:(NSApplication *)application
{
	[self.mosquittoClient disconnect];
}


- (void)didConnect:(NSUInteger)code
{
	NSLog(@"Did connect!");
}


- (void)didDisconnect
{
	NSLog(@"Did disconnect!");
}


- (void)didPublish:(NSUInteger)messageId
{
	NSLog(@"Did publish!");
}


- (void)didReceiveMessage:(AKMosquittoMessage*)mosq_msg
{
    NSString *topic = mosq_msg.topic;
    NSString *payload = mosq_msg.payload;
    
    // Stations Data Topic
    if ([topic isEqualToString:AKMosquittoStationsTopic])
    {
        NSLog(@"Recived stations data!");

        [self processStationsMessage:payload];
        [self.mosquittoClient subscribe:AKMosquittoDataTopic];
    }
    
    // Detections Topic
    else if ([topic hasPrefix:AKMosquittoDataTopicPrefix])
    {
        NSLog(@".");

        [self processDetectionMessage:payload];
    }
    
    else // Impossible?
    {
        NSLog(@"Sorry, I'm not interessted in this topic, Sir.");
        NSLog(@"- Topic: %@", topic);
    }
}


- (void)didSubscribe:(NSUInteger)messageId grantedQos:(NSArray*)qos
{
	NSLog(@"Did subscribe!");
}


- (void)didUnsubscribe:(NSUInteger)messageId
{
	NSLog(@"Did unsubscribe!");
}


@end
