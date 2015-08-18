//
//  Question.h
//  BloQuery
//
//  Created by Charles Wesley Cho on 8/16/15.
//  Copyright (c) 2015 Charles Wesley Cho. All rights reserved.
//
#import <Parse/Parse.h>
#import "InterestLevelIcon.h"

@class User, Question;

@interface Question : PFObject <PFSubclassing>

+(NSString *)parseClassName;

@property (retain, nonatomic) User *user;
@property (retain, nonatomic) NSString *questionText;
//@property (retain, nonatomic) NSMutableArray *answersToQuestion;

@end
