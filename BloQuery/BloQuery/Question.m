//
//  Question.m
//  BloQuery
//
//  Created by Charles Wesley Cho on 8/16/15.
//  Copyright (c) 2015 Charles Wesley Cho. All rights reserved.
//

#import <Parse/PFObject+Subclass.h>
#import "Question.h"
#import "User.h"

@implementation Question

@dynamic user;
@dynamic questionText;
//@dynamic answersToQuestion;  // In progress

+(NSString *)parseClassName {
    return @"Question";
}

@end
