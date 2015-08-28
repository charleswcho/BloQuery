//
//  DataSource.h
//  BloQuery
//
//  Created by Charles Wesley Cho on 8/26/15.
//  Copyright (c) 2015 Charles Wesley Cho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@class User;

@interface DataSource : NSObject

+(instancetype) sharedInstance;
@property (nonatomic, strong, readonly) NSArray *questionItems;

@property (nonatomic, strong) User *currentUser;

@end
