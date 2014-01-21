//
//  ActivityViewManager.m
//
//
//  Created by Mark Bridges on 21/01/2014.
//
//

#import "ActivityViewManager.h"

@implementation ActivityViewManager

- (void)showActivityInView:(UIView*)view{
    if (!self.activityIndicatorView) {
        self.activityIndicatorView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 60, 60)];
        [self.activityIndicatorView setBackgroundColor:[UIColor lightGrayColor]];
        self.activityIndicatorView.layer.masksToBounds = TRUE;
        self.activityIndicatorView.layer.cornerRadius = 30;
        self.activityIndicatorView.layer.borderWidth = 3;
        self.activityIndicatorView.layer.borderColor = [UIColor whiteColor].CGColor;

        UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(10, 10, 40, 40)];
        [indicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhiteLarge];
        [indicator setHidden:FALSE];
        [indicator startAnimating];
        [self.activityIndicatorView addSubview:indicator];
    }
    [self.activityIndicatorView setCenter:view.center];

    [self.activityIndicatorView setAlpha:0];
    [view addSubview:self.activityIndicatorView];

    [UIView animateWithDuration:0.1 animations:^{
        [self.activityIndicatorView setAlpha:0.8];
    }];
}

- (void)hideActivity{
    [UIView animateWithDuration:0.1 animations:^{
        [self.activityIndicatorView setAlpha:0];
    } completion:^(BOOL finished) {
        [self.activityIndicatorView removeFromSuperview];
    }];
}

@end
