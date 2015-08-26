//
//  Answer.h
//  BloQuery
//
//  Created by Charles Wesley Cho on 8/23/15.
//  Copyright (c) 2015 Charles Wesley Cho. All rights reserved.
//

#import <Parse/Parse.h>

@class User;

@interface Answer : PFObject <PFSubclassing>

+(NSString *)parseClassName;

@property (retain, nonatomic) User *from;
@property (retain, nonatomic) NSString *answerText;
@property (retain, nonatomic) NSNumber *numberOfVotes;

// Add the likeState?

@end
