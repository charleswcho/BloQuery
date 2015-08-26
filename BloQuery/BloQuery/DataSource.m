//
//  DataSource.m
//  BloQuery
//
//  Created by Charles Wesley Cho on 8/26/15.
//  Copyright (c) 2015 Charles Wesley Cho. All rights reserved.
//

#import "DataSource.h"
#import "User.h"
#import "Question.h"
#import "Answer.h"

@interface DataSource ()

@property (nonatomic, strong) NSArray *questionItems;

@end

@implementation DataSource

+ (instancetype) sharedInstance {
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

@end
