//
//  InternetReachability.h
//  BloQuery
//
//  Created by Charles Wesley Cho on 8/25/15.
//  Copyright (c) 2015 Charles Wesley Cho. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Reachability;

@interface InternetReachabilityManager : NSObject

@property (strong, nonatomic) Reachability *reachability;

#pragma mark -
#pragma mark Shared Manager
+ (InternetReachabilityManager *)sharedManager;

#pragma mark -
#pragma mark Class Methods
+ (BOOL)isReachable;
+ (BOOL)isUnreachable;
+ (BOOL)isReachableViaWWAN;
+ (BOOL)isReachableViaWiFi;

@end
