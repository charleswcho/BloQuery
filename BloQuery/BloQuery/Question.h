//
//  Question.h
//  BloQuery
//
//  Created by Charles Wesley Cho on 8/16/15.
//  Copyright (c) 2015 Charles Wesley Cho. All rights reserved.
//
#import <Parse/Parse.h>

@class User, Question, Answer;

@interface Question : PFObject <PFSubclassing>

+(NSString *)parseClassName;

@property (nonatomic, strong) NSString *objectId;
@property (retain, nonatomic) User *user;
@property (retain, nonatomic) NSMutableArray *answers;  // We're not using arrays to store
//@property (retain, nonatomic) NSNumber *numberOfAnswers;

@property (retain, nonatomic) NSString *questionText;

@end
