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
@property (nonatomic, strong) Question *question;
@property (nonatomic, strong) Answer *answer;

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

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addQuestionData];
    }
    return self;
}

- (void) addQuestionData {
    
    NSMutableArray *questionItems = [NSMutableArray array];
    
    PFQuery *query = [PFQuery queryWithClassName:@"Question"];
    
    [query orderByDescending:@"createdAt"];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *parseQuestions, NSError *error) {
        if (!error) {
            for (Question *q in parseQuestions) {  // Set local question's values from fetched data
                self.question.objectId = q.objectId;
                self.question.user = [self loadQuestionUser];  // Set local question's user to the user it belongs to
                self.question.answers = [self loadAnswers];  // Set the local questions's answers array to the answers that belong to it
                self.question.questionText = q.questionText;
                
                [questionItems addObject:self.question];  // Adding local question to DataSource readonly property after setting it's values
            }
        }
    }];
}


- (User *) loadQuestionUser {
    
    User *user = [self.question objectForKey:@"User"];  // Getting the User this question belongs to

    [user fetchInBackgroundWithBlock:^(PFObject *object, NSError *error) {
        if (object != nil) {
                user.objectId = object.objectId;
                user.profilePic = [object objectForKey:@"profilePic"];
                user.description = [object objectForKey:@"description"];
        }
    }];
    
    return user;
}

- (User *) loadAnswerUser {
    
    User *user = [self.answer objectForKey:@"from"];  // Getting the User this answer belongs to
    
    [user fetchInBackgroundWithBlock:^(PFObject *object, NSError *error) {
        if (object != nil) {
            user.objectId = object.objectId;
            user.profilePic = [object objectForKey:@"profilePic"];
            user.description = [object objectForKey:@"description"];
        }
    }];
    
    return user;
}

- (NSMutableArray *) loadAnswers {
    PFQuery *query = [PFQuery queryWithClassName:@"Answer"];
    [query whereKey:@"from" equalTo:self.question];  // Getting the Answers that belong to this question that's in a loop
    
    NSMutableArray *answers = [[NSMutableArray alloc] init];

    [query findObjectsInBackgroundWithBlock:^(NSArray *parseAnswers, NSError *error) {
        if (parseAnswers != nil) {
            for (Answer *a in parseAnswers) {
                self.answer.from = [self loadAnswerUser];
                self.answer.answerText = a.answerText;
                self.answer.numberOfVotes = a.numberOfVotes;
                
                [answers addObject:self.answer];
            }
            
        }
    }];
    
    return answers;
    
}

@end
