//
//  User.h
//  BloQuery
//
//  Created by Charles Wesley Cho on 8/16/15.
//  Copyright (c) 2015 Charles Wesley Cho. All rights reserved.
//

#import <Parse/Parse.h>

typedef NS_ENUM(NSInteger, interestLevel) {
    interestLevelLow                    = 0,
    interestLevelMedium                 = 1,
    interestLevelHigh                   = 2,
    interestLevelVeryHigh               = 3
};

@interface User : PFUser <PFSubclassing>

@property (nonatomic, assign) interestLevel *interestLevel;
@property (retain) UIImage *profilePic;

@end