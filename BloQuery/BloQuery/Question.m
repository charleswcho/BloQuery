//  Question.m
//  BloQuery
//
//  Created by Charles Wesley Cho on 8/16/15.
//  Copyright (c) 2015 Charles Wesley Cho. All rights reserved.

#import <Parse/PFObject+Subclass.h>
#import "Question.h"

@implementation Question

@dynamic objectId;
@dynamic user;
@dynamic answers;
@dynamic questionText;
//@dynamic answersToQuestion;  // In progress

+(NSString *)parseClassName {
    return @"Question";
}



@end
