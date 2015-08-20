//
//  QuestionsTextLabel.m
//  BloQuery
//
//  Created by Charles Wesley Cho on 8/20/15.
//  Copyright (c) 2015 Charles Wesley Cho. All rights reserved.
//

#import "QuestionsTextLabel.h"

@interface QuestionsTextLabel()

@property (nonatomic) UIEdgeInsets edgeInsets;

@end

@implementation QuestionsTextLabel



- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines
{
    
    UIEdgeInsets insets = self.edgeInsets;
    CGRect rect = [super textRectForBounds:UIEdgeInsetsInsetRect(bounds, insets)
                    limitedToNumberOfLines:numberOfLines];
    
    rect.origin.x    -= insets.left;
    rect.origin.y    -= insets.top;
    rect.size.width  += (insets.left + insets.right);
    rect.size.height += (insets.top + insets.bottom);
    
    return rect;
}

- (void)drawTextInRect:(CGRect)rect
{
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, self.edgeInsets)];
}


//- (void)drawTextInRect:(CGRect)rect {
//    UIEdgeInsets insets = {5, 5, 5, 5};
//    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, insets)];
//}


@end
