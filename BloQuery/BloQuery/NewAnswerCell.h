//
//  NewAnswerCell.h
//  BloQuery
//
//  Created by Charles Wesley Cho on 8/23/15.
//  Copyright (c) 2015 Charles Wesley Cho. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Answer;

@interface NewAnswerCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UITextView *answerText;

-(void)setAnswer:(Answer *)answer;

@end
