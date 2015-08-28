//
//  PFQTableViewController.m
//  BloQuery
//
//  Created by Charles Wesley Cho on 8/16/15.
//  Copyright (c) 2015 Charles Wesley Cho. All rights reserved.
//
#import "QuestionsTableViewController.h"
#import "AnswersTVController.h"
#import "Question.h"
#import "User.h"
#import "DataSource.h"
#import "Reachability.h"
#import "InternetReachabilityManager.h"

@interface QuestionsTableViewController () {
    
    Reachability *internetReachable;
}

@end

@implementation QuestionsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Have to reset this back to showing
    self.navigationItem.hidesBackButton = YES;
    
//    // Reachability did change
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(reachabilityDidChange:)
//                                                 name:kReachabilityChangedNotification
//                                               object:nil];

}
            



#pragma mark - Parse setup

- (id)initWithCoder:(NSCoder *)aCoder
{
    self = [super initWithCoder:aCoder];
    if (self) {
        // The className to query on
        self.parseClassName = @"Question";
        
        // The key of the PFObject to display in the label of the default cell style
        self.textKey = @"name";
        self.pullToRefreshEnabled = YES;
        self.paginationEnabled = YES;
        
        self.objectsPerPage = 10;

    }
    return self;
}

//------------------------------------------------------------------------------------------------------------------------Need to check if this is right

- (PFQuery *)queryForTable  // I'm having issues with using the method "findObjectInBackgroundWithBlock" in this method.
{
    PFQuery *query = [PFQuery queryWithClassName:self.parseClassName];

    return query;
}


//    if ([InternetReachabilityManager isReachable]) {
//
//        [query findObjectsInBackgroundWithBlock:^(NSArray *parseQuestions, NSError *error) { // Fetch from Cloud
//            [Question pinAllInBackground:parseQuestions];  // Save query results to local datastore
//
//        }];

//- (void)reachabilityDidChange:(NSNotification *)notification {
//    Reachability *reachability = (Reachability *)[notification object];
//    if ([reachability isReachable]) {
//        NSLog(@"Reachable");
//        //if before there was no internet - now you can do whatever user wants when there was no internet
//    } else {
//        NSLog(@"Unreachable");
//        //alert retry
//    }
//}

//- (IBAction)createNewQuestion:(UIBarButtonItem *)sender { // Creating a new question here
//
//    Question *newQuestion = [Question objectWithClassName:@"Question"];
//
//    self.question = newQuestion;  // Store the new question to the local variable
//
//    // TODO ---------------------------------------------Need to save the questionText from the new view controller
//
//    self.question.user = [User currentUser];  // Save the curret user as the author
//
//    [self.question pinInBackground]; // Save new question to local datastore
//
//    [self.tableView reloadData]; // refresh table to show new question
//}

#pragma mark - Table View


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(Question *)object {
    
    static NSString *identifier = @"QuestionsCell";
    
    QuestionsCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];

    if (cell == nil) {
        cell = [[QuestionsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    //-----------------------------------------------------------Setup of the # of answers button in the custom cell

    cell.questionItem = [DataSource sharedInstance].questionItems[indexPath.row];
        
    return cell;
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}

//------------------------------------------------------------------------------------------------------------------------Need to check if this is right


// Allow for autolayout cell height

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    tableView.estimatedRowHeight = 140.0;
    
    return UITableViewAutomaticDimension;
}


#pragma mark - Segues

// # of answers button clicked
- (IBAction)numberOfAnswersButtonTapped {
    AnswersTVController *answersTVC = [[AnswersTVController alloc] init];
    
    [self.navigationController pushViewController:answersTVC animated:YES];
    [self.navigationController segueForUnwindingToViewController:self
                                              fromViewController:answersTVC
                                                      identifier:@"showAnswers"];
}


// --------------------------------------------------------------Instead of using a Delegate method should I use a IBAction?
//
//- (void)cell:(QuestionsCell *)cell didPressAnswersButton:(UIButton *)numberOfAnswersButton {
//
//    AnswersTVController *answersTVC = [[AnswersTVController alloc] init];
//    
//    [self.navigationController pushViewController:answersTVC animated:YES];
//    
//    
//}

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    if ([[segue identifier] isEqualToString:@"showAnswers"]) {
//        
//    }
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
