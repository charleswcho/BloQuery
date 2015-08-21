//
//  logInViewControllerConfigure.m
//  BlocQuery
//
//  Created by Charles Wesley Cho on 8/13/15.
//  Copyright (c) 2015 Charles Wesley Cho. All rights reserved.
//

#import "logInViewControllerConfigure.h"

@interface logInViewControllerConfigure ()

@end

@implementation logInViewControllerConfigure

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"1"]];
    
    self.logInView.usernameField.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.2];
    self.logInView.passwordField.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.2];
    self.logInView.logo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Hontoni!?"]];
    

}

@end
