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

@property (weak, nonatomic) IBOutlet UIImageView *profilePicView;
@property (weak, nonatomic) IBOutlet UILabel *questionTextLabel;
@property (weak, nonatomic) IBOutlet UIButton *numberOfAnswersButton;
@property (weak, nonatomic) IBOutlet UIImageView *interestLevelView;

@end

@implementation QuestionsCell

//+ (CGFloat)heightForQuestion:(Question *)question {
//    const CGFloat topMargin = 0.0f;
//    const CGFloat bottomMargin = 0.0f;
//    const CGFloat minHeight = 100.0f;
//    
//    UIFont *font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
//    
//    CGRect boudingBox = [question.questionText
//                         boundingRectWithSize:(476f, CGFLOAT_MAX)
//                         options:(NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin)
//                         attributes:@{NSFontAttributeName: font}
//                         context:nil];
//    
//    return MAX(minHeight, CGRect)
//}

-(void) setQuestion:(Question *)question {
    self.questionTextLabel.text = question.questionText;
//    self.numberOfAnswersButton = question.numberOfAnswers;  //-------------------------------------TODO  Create a custom class
    self.profilePicView.image = question.user.profilePic;
//    self.interestLevelView = question.interestLevel;        //-------------------------------------TODO  Create a custom class

}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
