//
//  AKStation.h
//  BipsMotion
//
//  Created by Rizo on 11/30/13.
//  Copyright (c) 2013 AroundKnowledge. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AKStation : NSObject
@property NSString *identifier;
@property CGPoint position;
- (id)initWithID:(NSString *)identifier position:(CGPoint)position;
@end
