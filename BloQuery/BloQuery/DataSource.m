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

- (void) addQuestionData {
    NSMutableArray *questionItems = [NSMutableArray array];
    
    Question *question1 = [[Question alloc] init];
    
    PFQuery *query = [PFQuery queryWithClassName:@"Questions"];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *parseQuestions, NSError *error) {
        if (parseQuestions != nil) {
            for (Question *question in parseQuestions) {
                question1.objectId = question.objectId;
                question1.user = [self loadUser];
                question1.answers = [self loadAnswers];
                question1.questionText = question.questionText;
                
                [questionItems addObject:question1];
            }
        }
    }];
}


- (User *) loadUser {
    PFQuery *query = [PFQuery queryWithClassName:@"User"];
    
    User *user1 = [[User alloc] init];

    [query findObjectsInBackgroundWithBlock:^(NSArray *parseUsers, NSError *error) {
        if (parseUsers != nil) {
            for (User *user in parseUsers) {
                user1.objectId = user.objectId;
                user1.profilePic = user.profilePic;
                user1.description = user.description;
            }
        }
    }];
    
    return user1;
}

- (NSMutableArray *) loadAnswers {
    PFQuery *query = [PFQuery queryWithClassName:@"Answer"];
    
    Answer *answer1 = [[Answer alloc] init];
    NSMutableArray *answers = [[NSMutableArray alloc] init];

    [query findObjectsInBackgroundWithBlock:^(NSArray *parseAnswers, NSError *error) {
        if (parseAnswers != nil) {
            for (Answer *answer in parseAnswers) {
                answer1.from = answer.from;
                answer1.answerText = answer.answerText;
                answer1.numberOfVotes = answer.numberOfVotes;
                
                [answers addObject:answer];
            }
            
        }
    }];
    
    return answers;
    
}

@end
