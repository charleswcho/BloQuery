//
//  QuestionCellAnswerView.m
//  BloQuery
//
//  Created by Charles Wesley Cho on 8/17/15.
//  Copyright (c) 2015 Charles Wesley Cho. All rights reserved.
//

#import "QuestionCellAnswerView.h"
#import "Question.h"
#import "User.h"

@interface QuestionCellAnswerView ()

@property (strong, nonatomic) IBOutlet UILabel *questionTextLabel;
@property (strong, nonatomic) IBOutlet UIImageView *profilePicView;

@end

@implementation QuestionCellAnswerView

+ (CGFloat)heightForQuestion:(Question *)question {
    //    const CGFloat topMargin = 0.0f;
    //    const CGFloat bottomMargin = 0.0f;
    const CGFloat minHeight = 100.0f;
    
    UIFont *font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
    
    CGRect boundingBox = [question.questionText
                          boundingRectWithSize:CGSizeMake(476.0f, CGFLOAT_MAX)
                          options:(NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin)
                          attributes:@{NSFontAttributeName: font}
                          context:nil];
    
    return MAX(minHeight, boundingBox.size.height);
}

-(void) setQuestion:(Question *)question {
    
    self.profilePicView.image = question.user.profilePic;
    self.questionTextLabel.text = question.questionText;
    
}


- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
