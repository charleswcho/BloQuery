//
//  QuestionsTableViewCell.h
//  BloQuery
//
//  Created by Charles Wesley Cho on 8/14/15.
//  Copyright (c) 2015 Charles Wesley Cho. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Question, QuestionsCell, DataSource;

@interface QuestionsCell : UITableViewCell

@property (strong, nonatomic) Question *questionItem;

+ (CGFloat)heightForQuestion:(Question *)question;

@end
