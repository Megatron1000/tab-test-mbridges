//
//  ActivityViewManager.h
//  
//
//  Created by Mark Bridges on 21/01/2014.
//
//

#import <Foundation/Foundation.h>

@interface ActivityViewManager : NSObject

@property UIView *activityIndicatorView;

- (void)showActivityInView:(UIView*)view;
- (void)hideActivity;

@end
