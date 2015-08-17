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

@property (strong, nonatomic) Question *question;
@property (strong, nonatomic) NSMutableArray *questions;

@end

@implementation QuestionsTableViewController

- (void)awakeFromNib {
    [super awakeFromNib];
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewQuestion:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    
    [self.tableView registerClass:[QuestionsCell class] forCellReuseIdentifier:@"QuestionCell"];
}

//---------------------------------Which one to use?
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    
//}

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


- (void)insertNewQuestion:(id)sender {
    if (self.question != nil) {
        [self.questions insertObject:self.question atIndex:0];
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(PFObject *)object
{
    static NSString *simpleTableIdentifier = @"QuestionCell";
    
    // Look into register cell bloctagram
    QuestionsCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        cell = [[QuestionsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    cell.delegate = self;
    
    return cell;
}

// Editing tableView

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

// Allow for autolayout cell height

- (void)configureTableView:(UITableView *)tableView {
    tableView.rowHeight = UITableViewAutomaticDimension;
    tableView.estimatedRowHeight = 100.0;
}

#pragma mark - Segues

// --------------------------------------------------------------Need to set up creating a new Question
- (void)didPressAnswersButton:(UIButton *)answersButton {

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
