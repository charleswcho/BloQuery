//
//  QuestionsTableViewCell.m
//  BloQuery
//
//  Created by Charles Wesley Cho on 8/14/15.
//  Copyright (c) 2015 Charles Wesley Cho. All rights reserved.
//
#import "QuestionsCell.h"
#import "Question.h"
#import "User.h"

@interface QuestionsCell ()


@end

@implementation QuestionsCell

+ (CGFloat)heightForQuestion:(Question *)question {
//    const CGFloat topMargin = 0.0f;
//    const CGFloat bottomMargin = 0.0f;
    const CGFloat minHeight = 116.0f;
    
    UIFont *font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
    
    CGRect boundingBox = [question.questionText
                         boundingRectWithSize:CGSizeMake(476.0f, CGFLOAT_MAX)
                         options:(NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin)
                         attributes:@{NSFontAttributeName: font}
                         context:nil];
    
    return MAX(minHeight, boundingBox.size.height);
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.numberOfAnswersButton.layer setBorderColor:[[UIColor whiteColor] CGColor]];
    [self.numberOfAnswersButton.layer setBorderWidth:1];
    

    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

-(void) setQuestion:(Question *)question {
    self.profilePicView.image = question.user.profilePic;
    self.questionTextLabel.text = question.questionText;
    
    
    
//    self.numberOfAnswersButton.titleLabel.text = question. + @"answers"  //  Need to create an answers class because answers have properties too
    
//    NSString *numberOfAnswersString = [question.numberOfAnswers stringValue];
//    [self.numberOfAnswersButton setTitle:numberOfAnswersString forState:UIControlStateNormal];
    
//    self.interestLevelView = question.interestLevel;        //-------------------------------------TODO  Create a custom class

}

// ----------------------------Are these necessary?




@end
