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

-(void) cell:(QuestionsCell *)cell didPressAnswersButton:(UIButton *)numberOfAnswersButton;

@end



@interface QuestionsCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *profilePicView;
@property (weak, nonatomic) IBOutlet UILabel *questionTextLabel;
@property (strong, nonatomic) IBOutlet UIButton *numberOfAnswersButton;
@property (weak, nonatomic) IBOutlet UIImageView *interestLevelView;

@property (nonatomic, weak) id <QuestionsCellDelegate> delegate;

+ (CGFloat)heightForQuestion:(Question *)question;
- (void) setQuestion:(Question *)question;

@end
