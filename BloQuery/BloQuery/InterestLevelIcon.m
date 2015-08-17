//
//  interestLevelIcon.m
//  Blocstagram
//
//  Created by Charles Wesley Cho on 7/16/15.
//  Copyright (c) 2015 Charles Wesley Cho. All rights reserved.
//

#import "interestLevelIcon.h"

#define kinterestLevelLowImage @"interestLevelLow"
#define kinterestLevelMediumImage @"interestLevelMedium"
#define kinterestLevelHighImage @"interestLevelHigh"
#define kinterestLevelVeryHighImage @"interestLevelVeryHigh"

@interface interestLevelIcon ()

@end

@implementation interestLevelIcon

- (instancetype) init {
    self = [super init];
    
    if (self) {
        
        //-------------------------------------------------How do I link this image to the cell?
        self.interestLevelIconState = interestLevelLow;
    }
    
    return self;
}

- (void) layoutSubviews {
    [super layoutSubviews];
}

- (void) setinterestLevelIconState:(interestLevel)interestLevel {
    _interestLevelIconState = interestLevel;
    
    NSString *imageName;
    
    switch (_interestLevelIconState) {
        case interestLevelLow:
            imageName = kinterestLevelLowImage;
            break;
        case interestLevelMedium:
            imageName = kinterestLevelMediumImage;
            break;
        case interestLevelHigh:
            imageName = kinterestLevelHighImage;
            break;
        case interestLevelVeryHigh:
            imageName = kinterestLevelVeryHighImage;
            break;

    }
    [self setImage:[UIImage imageNamed:imageName]];
    
}


@end