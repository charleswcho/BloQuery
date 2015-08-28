//
//  AnswersTVController.m
//  BloQuery
//
//  Created by Charles Wesley Cho on 8/17/15.
//  Copyright (c) 2015 Charles Wesley Cho. All rights reserved.
//

#import "AnswersTVController.h"
#import "Question.h"
#import "QuestionCellAnswerView.h"
#import "AnswerCell.h"
#import "QuestionsTableViewController.h"
#import "Answer.h"
#import "User.h"

@interface AnswersTVController ()

@property (strong, nonatomic) NSMutableArray *answers;
@property (strong, nonatomic) QuestionCellAnswerView *questionCellAnswersView;
@property (strong, nonatomic) AnswerCell *answersCell;
@property (strong, nonatomic) QuestionsTableViewController *questionsTVC;
@property (strong, nonatomic) Question *question;

@end

@implementation AnswersTVController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewAnswer:)];
//    self.navigationItem.rightBarButtonItem = addButton;
    
//    self.navigationItem.hidesBackButton = NO;

}


#pragma mark - Parse setup

- (id)initWithCoder:(NSCoder *)aCoder
{
    self = [super initWithCoder:aCoder];
    if (self) {
        // The className to query on
        self.parseClassName = @"Answer";
        
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
    
    return query;
}

//- (IBAction)createNewAnswer:(UIBarButtonItem *)sender {
//    
//    Answer *answer = [Answer objectWithClassName:@"Answer"];
//    
//    [self.answersCell setAnswer:answer];
//    
//    [answer setObject:[User currentUser] forKey:@"author"];  // Setting the current user as the author of this anwer
//    
//    [answer setObject:self.questionsTVC.question forKey:@"question"]; // Setting the question this answer belongs to
//    
//    [answer saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
//        if (succeeded) {
//            // The object has been saved.
//        } else {
//            // There was a problem, check error.description
//        }
//    }];
//    
//    
//    //------------------------------------------------------------------------------Should I update the local array or refetch then reload the tableView?
////    if (answer.answerText != nil) {
////        [self.answers insertObject:answer atIndex:0];
////        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
////        [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
////    }
//
//}


//------------------------------------------------------------------------------------------------------------------------Need to check if this is right

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // Look into register cell bloctagram
    NSString *identifier;

    if (indexPath.row == 0) {
        identifier = @"QuestionCellAnswersView";
        self.questionCellAnswersView = [tableView dequeueReusableCellWithIdentifier:identifier];
        
        if (self.questionCellAnswersView == nil) {
            self.questionCellAnswersView = [[QuestionCellAnswerView alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        
        return self.questionCellAnswersView;

    } else {
        identifier = @"AnswerCell";
        self.answersCell = [tableView dequeueReusableCellWithIdentifier:identifier];
        
        if (self.answersCell == nil) {
            self.answersCell = [[AnswerCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        
        return self.answersCell;

    }
    
}

// Editing tableView

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

// Allow for autolayout cell height

- (void)configureTableView:(UITableView *)tableView {
    tableView.rowHeight = UITableViewAutomaticDimension;
    tableView.estimatedRowHeight = 100.0;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
