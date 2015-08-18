//
//  User.h
//  BloQuery
//
//  Created by Charles Wesley Cho on 8/16/15.
//  Copyright (c) 2015 Charles Wesley Cho. All rights reserved.
//

#import <Parse/Parse.h>

@interface User : PFUser <PFSubclassing>

@property (retain, nonatomic) UIImage *profilePic;
@property (retain, nonatomic) NSString *description;

+ (User *)currentUser;

@end