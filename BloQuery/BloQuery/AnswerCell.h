//
//  AnswerCell.h
//  BloQuery
//
//  Created by Charles Wesley Cho on 8/17/15.
//  Copyright (c) 2015 Charles Wesley Cho. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Answer;

@interface AnswerCell : UITableViewCell

+ (CGFloat)heightForAnswer:(Answer *)answer;
- (void)setAnswer:(Answer *)answer;

@end
