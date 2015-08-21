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

@interface QuestionsTableViewController ()

@property (strong, nonatomic) NSMutableArray *questions;

@end

@implementation QuestionsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//------------------------------------------------------TODO : Create a new Question HERE
//    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewQuestion:)];
//    self.navigationItem.rightBarButtonItem = addButton;
    
    PFQuery *query = [PFQuery queryWithClassName:self.parseClassName];
    [query orderByDescending:@"createdAt"];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *parseQuestions, NSError *error) { // Fetch an array of Questions from the Question class
        if (!error) {
            NSMutableArray *mutableParseQuestions = [parseQuestions mutableCopy];
            self.questions = mutableParseQuestions;  // Set local array to fetched Parse questions
        }
    }];
    
    
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

- (PFQuery *)queryForTable
{
    PFQuery *query = [PFQuery queryWithClassName:self.parseClassName];
    [query orderByDescending:@"createdAt"];
    
    return query;
}

//------------------------------------------------------TODO : Create a new Question HERE
//- (void)insertNewQuestion:(id)sender {
//    if (self.question != nil) {
//        [self.questions insertObject:self.question atIndex:0];
//        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
//        [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
//    }
//}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.questions.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    self.question = [self.questions objectAtIndex:indexPath.row]; // Save one question from row

    static NSString *identifier = @"QuestionsCell";
    
    QuestionsCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];

    if (cell == nil) {
        cell = [[QuestionsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    [cell setQuestion:self.question];  //
    
    cell.delegate = self;

    
    return cell;
}

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

// --------------------------------------------------------------Need to set up creating a new Question
// --------------------------------------------------------------Instead of using a Delegate method should I use a IBAction?

- (void)cell:(QuestionsCell *)cell didPressAnswersButton:(UIButton *)numberOfAnswersButton {

    QuestionsTableViewController *QuestionTVC = [[QuestionsTableViewController alloc] init];
    
    UIStoryboardSegue *showAnswers = [UIStoryboardSegue segueWithIdentifier:@"showAnswers"
                                                                 source:self
                                                            destination:QuestionTVC
                                                         performHandler:nil];
    [showAnswers perform];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showAnswers"]) {
        
//        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
//        NSDate *object = self.objects[indexPath.row];
//        [[segue destinationViewController] setDetailItem:object];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
