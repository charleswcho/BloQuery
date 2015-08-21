//
//  AnswersTVController.h
//  BloQuery
//
//  Created by Charles Wesley Cho on 8/17/15.
//  Copyright (c) 2015 Charles Wesley Cho. All rights reserved.
//

#import <ParseUI/ParseUI.h>
#import <Parse/Parse.h>
#import "QuestionsCell.h"

@interface AnswersTVController : PFQueryTableViewController

-(void)setQuestion:(Question *)question;

@end
