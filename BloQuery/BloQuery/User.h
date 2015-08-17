//
//  User.h
//  BloQuery
//
//  Created by Charles Wesley Cho on 8/16/15.
//  Copyright (c) 2015 Charles Wesley Cho. All rights reserved.
//

#import <Parse/Parse.h>

@interface User : PFUser <PFSubclassing>

@property (strong, nonatomic) UIImage *profilePic;  
@property (strong, nonatomic) NSString *description;

@end