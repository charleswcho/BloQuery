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

@dynamic profilePic;
@dynamic description;

+ (User* )currentUser
{
    return (User* )[PFUser currentUser];
}


- (instancetype) initWithDictionary:(NSDictionary *)userDictionary {
    self = [super init];
    
    if (self) {
        self.profilePic = userDictionary[@"id"];
        self.description = userDictionary[@"description"];
        
//        NSString *profileURLString = userDictionary[@"profile_picture"];
//        NSURL *profileURL = [NSURL URLWithString:profileURLString];
//        
//        if (profileURL) {
//            self.profilePictureURL = profileURL;
//        }
    }
    
    return self;
}

@end
