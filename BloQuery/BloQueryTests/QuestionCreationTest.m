//
//  QuestionCreationTest.m
//  BloQuery
//
//  Created by Charles Wesley Cho on 8/18/15.
//  Copyright (c) 2015 Charles Wesley Cho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Question.h"


@interface QuestionCreationTest : XCTestCase

@end

@implementation QuestionCreationTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)questionCreationTest {
//    Question *question = [Question object];
    Question *question2 = [Question objectWithClassName:@"Question"];
    question2.questionText = @"I am a cute bunny";
    [question2 setObject:@"I am a cute bunny" forKey:@"questionText"];

    [question2 save];
    
    
    //------------------------------------------------------------------// TEST
//    Question *question = [Question objectWithClassName:@"Question"];
//    question.questionText = @"I am a cute bunny";
//    
//    [question saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
//        if (succeeded) {
//            // The object has been saved.
//        } else {
//            // There was a problem, check error.description
//        }
//    }];
    //------------------------------------------------------------------// TEST
}

@end
