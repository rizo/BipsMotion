//
//  MosquittoClient.h
//
//  Copyright 2012 Nicholas Humfrey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AKMosquittoMessage.h"

@protocol AKMosquittoClientDelegate

- (void) didConnect: (NSUInteger)code;
- (void) didDisconnect;
- (void) didPublish: (NSUInteger)messageId;

- (void) didReceiveMessage: (AKMosquittoMessage*)mosq_msg;
- (void) didSubscribe: (NSUInteger)messageId grantedQos:(NSArray*)qos;
- (void) didUnsubscribe: (NSUInteger)messageId;

@end


@interface AKMosquittoClient : NSObject {
    struct mosquitto *mosq;
    NSTimer *timer;
}

@property (readwrite,retain) NSString *host;
@property (readwrite,assign) unsigned short port;
@property (readwrite,retain) NSString *username;
@property (readwrite,retain) NSString *password;
@property (readwrite,assign) unsigned short keepAlive;
@property (readwrite,assign) BOOL cleanSession;
@property (readwrite,assign) id<AKMosquittoClientDelegate> delegate;

+ (void) initialize;
+ (NSString*) version;


- (AKMosquittoClient*) initWithClientId: (NSString *)clientId;
- (void) setMessageRetry: (NSUInteger)seconds;
- (void) connect;
- (void) connectToHost: (NSString*)host;
- (void) reconnect;
- (void) disconnect;

- (void)setWill: (NSString *)payload toTopic:(NSString *)willTopic withQos:(NSUInteger)willQos retain:(BOOL)retain;
- (void)clearWill;

- (void)publishString: (NSString *)payload toTopic:(NSString *)topic withQos:(NSUInteger)qos retain:(BOOL)retain;

- (void)subscribe: (NSString *)topic;
- (void)subscribe: (NSString *)topic withQos:(NSUInteger)qos;
- (void)unsubscribe: (NSString *)topic;


// This is called automatically when connected
- (void) loop: (NSTimer *)timer;

@end
