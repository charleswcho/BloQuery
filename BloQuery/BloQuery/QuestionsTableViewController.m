//
//  PFQTableViewController.m
//  BloQuery
//
//  Created by Charles Wesley Cho on 8/16/15.
//  Copyright (c) 2015 Charles Wesley Cho. All rights reserved.
//

#import "QuestionsTableViewController.h"
#import "QuestionsCell.h"
#import "AnswersTVController.h"
#import "Question.h"
#import "User.h"
#import "Reachability.h"

@interface QuestionsTableViewController () {
    
    Reachability *internetReachable;
}
@property (strong, nonatomic) NSMutableArray *questions;

@end

@implementation QuestionsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Have to reset this back to showing
    self.navigationItem.hidesBackButton = YES;
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
        self.paginationEnabled = NO;
        
//        self.objectsPerPage = 5;

    }
    return self;
}

//------------------------------------------------------------------------------------------------------------------------Need to check if this is right

- (PFQuery *)queryForTable
{
    PFQuery *query = [PFQuery queryWithClassName:self.parseClassName];
    
    [query fromLocalDatastore];
    
//    [query orderByDescending:@"numberOf"];  // How to sort by number of Answers?
//    [query findObjects];
//    [query findObjectsInBackgroundWithBlock:^(NSArray *parseQuestions, NSError *error) { // Fetch from local datastore
//        if (parseQuestions != nil) {
//            NSMutableArray *mutableParseQuestions = [parseQuestions mutableCopy];
//            self.questions = mutableParseQuestions;  // Set local array to fetched Parse questions
//            
//        } else {
//            [query findObjectsInBackgroundWithBlock:^(NSArray *parseQuestions, NSError *error) { // Fetch from Cloud
//                [Question pinAllInBackground:parseQuestions];  // Save query results to local datastore
//                
//            }];
//        }
//    }];
    
    return query;
}

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

-(void)internetConnection {
    internetReachable = [Reachability reachabilityForInternetConnection];
    
    internetReachable.reachableBlock = ^(Reachability*reach) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            // Update UI HERE
        });
    };
    
    internetReachable.unreachableBlock = ^(Reachability*reach) {
        NSLog(@"No internet connection");
    };
    
    [internetReachable startNotifier];
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(Question *)object {

    static NSString *identifier = @"QuestionsCell";
    
    QuestionsCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];

    if (cell == nil) {
        cell = [[QuestionsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    //-----------------------------------------------------------Setup of the # of answers button in the custom cell
    
//    cell.numberOfAnswersButton.tag = indexPath.row;
//    [cell.numberOfAnswersButton addTarget:self action:@selector(numberOfAnswersButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
//    
    [cell setQuestion:self.question];  //
    
//    cell.delegate = self;
    
    return cell;
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

-(void)numberOfAnswersButtonTapped:(id)sender {
    
    AnswersTVController *answersTVC = [[AnswersTVController alloc] init];
    
   [self.navigationController pushViewController:answersTVC animated:YES];
    
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
