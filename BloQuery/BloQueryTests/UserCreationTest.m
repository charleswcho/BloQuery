//
//  UserCreationTest.m
//  BloQuery
//
//  Created by Charles Wesley Cho on 8/18/15.
//  Copyright (c) 2015 Charles Wesley Cho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "User.h"

@interface UserCreationTest : XCTestCase

@end

@implementation UserCreationTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)userCreationTest {
    User *newUser = [User object];
    newUser.username = @"Lelouch";
    newUser.password = @"geass";
    newUser.email = @"Zero@TheBlackKnights.com";
    newUser.description = @"Vi brititania";
    
    [newUser save];
    
    PFQuery *query = [PFQuery queryWithClassName:@"Question"];
    [query orderByDescending:@"createdAt"];
    
    
    XCTAssertEqual(newUser.description, @"Vi brititania");
    
}

@end
