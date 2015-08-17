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

@property (retain) User *user;
@property (retain) UIImage *profilePic;
@property (strong, nonatomic) NSString *questionText;
@property (strong, nonatomic) NSNumber *numberOfAnswers;  // ???????? Link to number of answers
@property (nonatomic, assign) interestLevel *interestLevel;  // Link to number of answers too

@end
