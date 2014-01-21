//
//  UIImageViewRound.m
//  Our Team
//
//  Created by Mark Bridges on 21/01/2014.
//  Copyright (c) 2014 Mark Bridges. All rights reserved.
//

#import "UIImageViewRound.h"

@implementation UIImageViewRound

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self round];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self round];
    }
    return self;
}

- (void)round{
    self.layer.cornerRadius = self.frame.size.height/2;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
