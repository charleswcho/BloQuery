//
//  User.m
//  BloQuery
//
//  Created by Charles Wesley Cho on 8/16/15.
//  Copyright (c) 2015 Charles Wesley Cho. All rights reserved.
//

#import <Parse/PFObject+Subclass.h>
#import "User.h"

@implementation User

@dynamic objectId;
@dynamic profilePic;
@dynamic description;

+ (User* )currentUser
{
    return (User* )[PFUser currentUser];
}

@end
