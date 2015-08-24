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

@interface QuestionsTableViewController ()

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
        
        // Whether the built-in pull-to-refresh is enabled
        self.pullToRefreshEnabled = YES;
        
        // Whether the built-in pagination is enabled
        self.paginationEnabled = NO;
        
//        self.objectsPerPage = 5;

    }
    return self;
}

//------------------------------------------------------------------------------------------------------------------------Need to check if this is right

- (PFQuery *)queryForTable
{
    PFQuery *query = [PFQuery queryWithClassName:self.parseClassName];
    
    [query orderByDescending:@"createdAt"];
//    [query orderByDescending:@"numberOf"];  // How to sort by number of Answers?
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *parseQuestions, NSError *error) { // Fetch an array of Questions from the Question class
        if (!error) {
//            NSMutableArray *mutableParseQuestions = [parseQuestions mutableCopy];
//            self.questions = mutableParseQuestions;  // Set local array to fetched Parse questions
            
            [Question saveAllInBackground:parseQuestions];
        } else {
            NSLog(@"error, %@", error);
        }
    }];
    
    

    return query;
}

- (IBAction)createNewQuestion:(UIBarButtonItem *)sender { // Creating a new question here
    
    Question *newQuestion = [Question objectWithClassName:@"Question"];
    
    self.question = newQuestion;  // Store the new question to the local variable
    
    // TODO ---------------------------------------------Need to save the questionText from the new view controller
    
    [self.question setObject:[User currentUser] forKey:@"author"];  // Save the curret user as the author
    
    //------------------------------------------------------------------------------Should I update the local array or refetch then reload the tableView?
//    if (self.question != nil) {  // Insert new question into the local array 
//        [self.questions insertObject:self.question atIndex:0];
//        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
//        [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
//    }
    
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    PFQuery *query = [PFQuery queryWithClassName:self.parseClassName];
    [query fromLocalDatastore];
    [query findObjectsInBackgroundWithBlock:^(NSArray *parseQuestions, NSError *error) { // Fetch an array of Questions from the Question class
        if (!error) {
            
            self.question = [parseQuestions objectAtIndex:indexPath.row]; // Save one question from row
            
        } else {
            NSLog(@"error, %@", error);
        }
    }];

//    self.question = [self.questions objectAtIndex:indexPath.row]; // Save one question from row

    static NSString *identifier = @"QuestionsCell";
    
    QuestionsCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];

    if (cell == nil) {
        cell = [[QuestionsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    //-----------------------------------------------------------Setup of the # of answers button in the custom cell
    
    cell.numberOfAnswersButton.tag = indexPath.row;
    [cell.numberOfAnswersButton addTarget:self action:@selector(numberOfAnswersButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    [cell setQuestion:self.question];  //
    
//    cell.delegate = self;
    
    return cell;
}

//------------------------------------------------------------------------------------------------------------------------Need to check if this is right

// Editing tableView

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

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
