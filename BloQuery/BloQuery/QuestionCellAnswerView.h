//
//  QuestionCellAnswerView.h
//  BloQuery
//
//  Created by Charles Wesley Cho on 8/17/15.
//  Copyright (c) 2015 Charles Wesley Cho. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Question;

@interface QuestionCellAnswerView : UITableViewCell

@property (nonatomic, strong) Question *question;

+ (CGFloat)heightForQuestion:(Question *)question;
- (void) setQuestion:(Question *)question;

@end
