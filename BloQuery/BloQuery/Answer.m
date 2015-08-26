//
//  Answer.m
//  BloQuery
//
//  Created by Charles Wesley Cho on 8/23/15.
//  Copyright (c) 2015 Charles Wesley Cho. All rights reserved.
//

#import "Answer.h"

@implementation Answer

@synthesize from;
@synthesize answerText;
@synthesize numberOfVotes;

+(NSString *)parseClassName {
    return @"Answer";
}

@end
