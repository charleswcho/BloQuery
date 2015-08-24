//
//  AppDelegate.m
//  BloQuery
//
//  Created by Charles Wesley Cho on 8/14/15.
//  Copyright (c) 2015 Charles Wesley Cho. All rights reserved.
//

#import "AppDelegate.h"
#import "LogInViewController.h"
#import "User.h"
#import "Question.h"
#import "Answer.h"
#import <Parse/Parse.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <ParseFacebookUtilsV4/PFFacebookUtils.h>
#import "QuestionsTableViewController.h"
#import <ParseTwitterUtils/ParseTwitterUtils.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window.backgroundColor = [UIColor whiteColor];
    UINavigationController *navVC = (UINavigationController *) self.window.rootViewController;
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];

    // [Optional] Power your app with Local Datastore. For more info, go to
    // https://parse.com/docs/ios_guide#localdatastore/iOS
    [Parse enableLocalDatastore];
    
    #pragma mark Initialize Parse.
    
    // Register subclasses
    [User registerSubclass];
    [Question registerSubclass];
    [Answer registerSubclass];
    
    [Parse enableLocalDatastore];
    
    [Parse setApplicationId:@"Fur1pXrZLPNW7kyavY7otL1SLaBqj0SmauqJ1itw"
                  clientKey:@"rkdFBeT93ehQehZ6eVGNEUn8x2PhNgIrrqhe1RCp"];
    
    // [Optional] Track statistics around application opens.
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    
    // Determine whether or not to show the login screen
    if (![User currentUser]) {
        LogInViewController *loginVC = [[LogInViewController alloc] init];
        [navVC setViewControllers:@[loginVC] animated:YES];
    } else {
      [navVC pushViewController:[storyboard instantiateViewControllerWithIdentifier:@"QuestionsView"] animated:NO];
    }
    
    
    // Adding Facebook integration
    [[FBSDKApplicationDelegate sharedInstance] application:application
                             didFinishLaunchingWithOptions:launchOptions];
    [PFFacebookUtils initializeFacebookWithApplicationLaunchOptions:launchOptions];

    // Adding Twitter integration
    [PFTwitterUtils initializeWithConsumerKey:@"nC9P952CYwJtwc4wjZeXGiEIL"
                               consumerSecret:@"RRHQCDN6paMTs9VIlGVzL02oQvmKm78TpGVQg3ylRQWAycPYHl"];
    
    
    self.window.rootViewController = navVC;
    [self.window makeKeyAndVisible];

    return YES;
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [FBSDKAppEvents activateApp];
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    return [[FBSDKApplicationDelegate sharedInstance] application:application
                                                          openURL:url
                                                sourceApplication:sourceApplication
                                                       annotation:annotation];
}

@end
