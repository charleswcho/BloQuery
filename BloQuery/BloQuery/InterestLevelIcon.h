//
//  interestLevelIcon.h
//  Blocstagram
//
//  Created by Charles Wesley Cho on 7/16/15.
//  Copyright (c) 2015 Charles Wesley Cho. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, interestLevel) {
    interestLevelLow                    = 0,
    interestLevelMedium                 = 1,
    interestLevelHigh                   = 2,
    interestLevelVeryHigh               = 3
};

@interface interestLevelIcon : UIImageView

/**
 The current state of the interest Level icon. Setting to a higher value will show more lightning bolts.
 */
@property (nonatomic, assign) interestLevel interestLevelIconState;

@end
