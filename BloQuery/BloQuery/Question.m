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
@dynamic profilePic;
@dynamic questionText;
@dynamic numberOfAnswers;  // Need to link this property to the an
@dynamic interestLevel;  // Link to number of answers too

+(NSString *)parseClassName {
    return @"Question";
}

@end
