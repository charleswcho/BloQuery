//
//  NewAnswerTVC.m
//  BloQuery
//
//  Created by Charles Wesley Cho on 8/23/15.
//  Copyright (c) 2015 Charles Wesley Cho. All rights reserved.
//

#import "NewAnswerTVC.h"
#import "QuestionsCell.h"

@interface NewAnswerTVC ()

@end

@implementation NewAnswerTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 2;
}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    // Look into register cell bloctagram
//    NSString *identifier;
//    
//    if (indexPath.row == 0) {
//        identifier = @"QuestionCellAnswersView";
//        self.questionCellAnswersView = [tableView dequeueReusableCellWithIdentifier:identifier];
//        
//        [self.questionCellAnswersView setQuestion:self.questionsTVC.question];
//        
//        if (self.questionCellAnswersView == nil) {
//            self.questionCellAnswersView = [[QuestionCellAnswerView alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
//        }
//        
//        return self.questionCellAnswersView;
//        
//    } else {
//        identifier = @"AnswerCell";
//        self.answersCell = [tableView dequeueReusableCellWithIdentifier:identifier];
//        
//        if (self.answersCell == nil) {
//            self.answersCell = [[AnswerCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
//        }
//        
//        return self.answersCell;
//        
//    }
//    
//}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
