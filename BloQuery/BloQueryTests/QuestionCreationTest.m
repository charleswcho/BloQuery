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
    Question *question = [Question object];
    question.questionText = @"I am a cute bunny";
    [question setObject:@"I am a cute bunny" forKey:@"questionText"];

    [question save];
       
}

@end
