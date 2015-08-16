//
//  AppDelegate.m
//  BloQuery
//
//  Created by Charles Wesley Cho on 8/14/15.
//  Copyright (c) 2015 Charles Wesley Cho. All rights reserved.
//

#import "AppDelegate.h"
#import "LogInViewController.h"
#import "DetailViewController.h"
#import "User.h"
#import "Question.h"
#import <Parse/Parse.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <ParseFacebookUtilsV4/PFFacebookUtils.h>


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[LogInViewController alloc     ] init]];
//    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[UIViewController alloc] init]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    // [Optional] Power your app with Local Datastore. For more info, go to
    // https://parse.com/docs/ios_guide#localdatastore/iOS
    [Parse enableLocalDatastore];
    
    // Initialize Parse.
    [User registerSubclass];
    [Question registerSubclass];
    [Parse setApplicationId:@"Fur1pXrZLPNW7kyavY7otL1SLaBqj0SmauqJ1itw"
                  clientKey:@"rkdFBeT93ehQehZ6eVGNEUn8x2PhNgIrrqhe1RCp"];
    
    // [Optional] Track statistics around application opens.
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    
    
    // Adding Facebook integration
    [[FBSDKApplicationDelegate sharedInstance] application:application
                             didFinishLaunchingWithOptions:launchOptions];
    [PFFacebookUtils initializeFacebookWithApplicationLaunchOptions:launchOptions];

    // Adding Twitter integration
    [PFTwitterUtils initializeWithConsumerKey:@"nC9P952CYwJtwc4wjZeXGiEIL"
                               consumerSecret:@"RRHQCDN6paMTs9VIlGVzL02oQvmKm78TpGVQg3ylRQWAycPYHl"];
    
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
