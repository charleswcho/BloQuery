//
//  signUpViewControllerConfigure.m
//  BlocQuery
//
//  Created by Charles Wesley Cho on 8/13/15.
//  Copyright (c) 2015 Charles Wesley Cho. All rights reserved.
//

#import "signUpViewControllerConfigure.h"

@interface signUpViewControllerConfigure ()

@end

@implementation signUpViewControllerConfigure

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"1"]];
    
    self.signUpView.usernameField.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.2];
    self.signUpView.passwordField.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.2];
    self.signUpView.emailField.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.2];
    
    self.signUpView.logo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Hontoni!?"]];
}

@end
