//
//  QuestionsTextLabel.m
//  BloQuery
//
//  Created by Charles Wesley Cho on 8/20/15.
//  Copyright (c) 2015 Charles Wesley Cho. All rights reserved.
//

#import "QuestionsTextLabel.h"

@implementation QuestionsTextLabel

//------------------------------------------- Need to fix
- (void)drawTextInRect:(CGRect)rect {
    UIEdgeInsets insets = {0, 10, 0, 0};
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, insets)];
}

@end
