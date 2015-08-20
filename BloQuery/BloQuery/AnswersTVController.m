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

@interface AnswersTVController ()

@property (strong, nonatomic) Question *question;
@property (strong, nonatomic) NSMutableArray *questions;

@end

@implementation AnswersTVController

- (void)awakeFromNib {
    [super awakeFromNib];
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewAnswer:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    self.navigationItem.hidesBackButton = NO;

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


- (void)insertNewAnswer:(id)sender {
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
    // Look into register cell bloctagram
    
    NSString *identifier;

    if (indexPath.row == 0) {
        identifier = @"QuestionCellAnswersView";
    } else {
        identifier = @"AnswerCell";
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];

    if (cell == nil) {
        cell = [[QuestionsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    return cell;
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
