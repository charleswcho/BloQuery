//
//  QuestionsTableViewCell.h
//  BloQuery
//
//  Created by Charles Wesley Cho on 8/14/15.
//  Copyright (c) 2015 Charles Wesley Cho. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuestionsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *profilePic;
@property (weak, nonatomic) IBOutlet UILabel *questionText;
@property (weak, nonatomic) IBOutlet UIButton *numberOfAnswersButton;
@property (weak, nonatomic) IBOutlet UIImageView *interestLevel;

@end
