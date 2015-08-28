//
//  AnswerCell.m
//  BloQuery
//
//  Created by Charles Wesley Cho on 8/17/15.
//  Copyright (c) 2015 Charles Wesley Cho. All rights reserved.
//

#import "AnswerCell.h"
#import "Answer.h"
#import "User.h"

@interface AnswerCell()

@property (weak, nonatomic) IBOutlet UILabel *answerText;
@property (strong, nonatomic) IBOutlet UIImageView *answerProfilePic;

@end

@implementation AnswerCell

+ (CGFloat)heightForAnswer:(Answer *)answer {
    //    const CGFloat topMargin = 0.0f;
    //    const CGFloat bottomMargin = 0.0f;
    const CGFloat minHeight = 100.0f;
    
    UIFont *font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
    
    CGRect boundingBox = [answer.answerText
                          boundingRectWithSize:CGSizeMake(476.0f, CGFLOAT_MAX)
                          options:(NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin)
                          attributes:@{NSFontAttributeName: font}
                          context:nil];
    
    return MAX(minHeight, boundingBox.size.height);
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setAnswer:(Answer *)answer {
    self.answerText.text = answer.answerText;
    self.answerProfilePic.image = answer.from.profilePic;
}

@end
