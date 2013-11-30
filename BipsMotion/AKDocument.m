//
//  AKDocument.m
//  BipsMotion
//
//  Created by Rizo on 11/18/13.
//  Copyright (c) 2013 AroundKnowledge. All rights reserved.
//

#import "AKDocument.h"
#import "AKAgentModel.h"
#import "AKMapView.h"
#import "getMacAddress.h"
#import "AKMosquittoClient.h"
#import "AKApplicationDelegate.h"
#import "AKRadarController.h"


NSString * const AKDocumentDidLoadAgentsNotification = @"AKDocumentDidLoadAgents";


@implementation AKDocument

- (id)init
{
    self = [super init];
    if (self) {
        self.agentsByIdentifier = [NSMutableDictionary dictionary];
    }
    return self;
}

- (NSString *)windowNibName
{
    return @"AKDocument";
}

- (void)windowControllerDidLoadNib:(NSWindowController *)aController
{
    [super windowControllerDidLoadNib:aController];
 
    // Load the document content if loaded.
    if (self.agentsByIdentifier.count > 0)
    {
        [self.mapView document:self didLoadAgents:self.agentsByIdentifier.allValues];
    }
}


+ (BOOL)autosavesInPlace
{
    return YES;
}


- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError
{
    // Insert code here to write your document to data of the specified type. If outError != NULL, ensure that you create and set an appropriate error when returning nil.
    // You can also choose to override -fileWrapperOfType:error:, -writeToURL:ofType:error:, or -writeToURL:ofType:forSaveOperation:originalContentsURL:error: instead.
    NSException *exception = [NSException exceptionWithName:@"UnimplementedMethod" reason:[NSString stringWithFormat:@"%@ is unimplemented", NSStringFromSelector(_cmd)] userInfo:nil];
    @throw exception;
    return nil;
}

- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError
{
    NSLog(@"Reading a document...");
    
    BOOL readSuccess = NO;
    NSArray *contentsArray = [NSJSONSerialization JSONObjectWithData:data
                                                             options:kNilOptions
                                                               error:outError];
    if (! contentsArray && outError)
    {
        *outError = [NSError errorWithDomain:NSCocoaErrorDomain
                                        code:NSFileReadUnknownError
                                    userInfo:nil];
    }
    
    if (*outError)
    {
        NSLog(@"Got an error: %@", *outError);
        readSuccess = NO;
    }
    
    if (contentsArray != nil)
    {
        readSuccess = YES;
        [self loadAgentsFromRawArray:contentsArray];
    }
    
    return readSuccess;
}


- (void)loadAgentsFromRawArray:(NSArray *)rawArray
{
    for (NSArray *q in rawArray)
    {
        NSNumber *identifier = (NSNumber *)q[0];
        NSInteger x  = ((NSNumber *)q[1]).integerValue;
        NSInteger y  = ((NSNumber *)q[2]).integerValue;
        NSUInteger t = ((NSNumber *)q[3]).unsignedIntegerValue;
        CGPoint p = (CGPoint) { x, y };

        AKAgentModel *a;
        if ((a = [self.agentsByIdentifier objectForKey:identifier]) == nil)
        {
            // A new gay! We'll create an object for him!
            a = [[AKAgentModel alloc] initWithInitialPosition:p
                                                    forMoment:t];
            self.agentsByIdentifier[identifier] = a;
        }
        else
        {
            // Just add the next position of the agent.
            [a addPosition:p forMoment:t];
        }
    }
}


@end


