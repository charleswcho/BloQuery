//
//  NewAnswerCell.m
//  BloQuery
//
//  Created by Charles Wesley Cho on 8/23/15.
//  Copyright (c) 2015 Charles Wesley Cho. All rights reserved.
//

#import "NewAnswerCell.h"
#import "Answer.h"

@implementation NewAnswerCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setAnswer:(Answer *)answer {
    answer.answerText = self.answerText.text;

}


@end
