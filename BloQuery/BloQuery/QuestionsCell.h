//
//  QuestionsTableViewCell.h
//  BloQuery
//
//  Created by Charles Wesley Cho on 8/14/15.
//  Copyright (c) 2015 Charles Wesley Cho. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Question, QuestionsCell;

@protocol QuestionsCellDelegate <NSObject>

-(void) cellDidPressAnswersButton:(QuestionsCell *)cell;

@end



@interface QuestionsCell : UITableViewCell

@property (nonatomic, weak) id <QuestionsCellDelegate> delegate;

@property (nonatomic, strong) Question *question;

//+ (CGFloat)heightForQuestion:(Question *)question;

@end
