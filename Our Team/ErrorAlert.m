//
//  ErrorAlert.m
//
//
//  Created by Mark Bridges on 26/11/2013.
//  Copyright (c) 2012 Mark Bridges. All rights reserved.
//

#import "ErrorAlert.h"

@implementation ErrorAlert

+(void)showError:(NSError *)error{
    if (error) {
        NSString *message = [NSString stringWithFormat:@"Description: %@",error.localizedDescription];
        
        if (error.localizedFailureReason) {
            message = [NSString stringWithFormat:@"%@\nReason: %@", message, error.localizedDescription];
        }
        if (error.localizedRecoverySuggestion) {
            message = [NSString stringWithFormat:@"%@\nRecovery Suggestion: %@", message, error.localizedRecoverySuggestion];
        }
        
        UIAlertView *errorAlert = [[UIAlertView alloc]initWithTitle:errorTitle
                                                            message:message
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil, nil];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [errorAlert show];
        });
    }
}

+(void)showErrorWithMessage:(NSString *)errorMessage{
    UIAlertView *errorAlert = [[UIAlertView alloc]initWithTitle:errorTitle
                                                        message:errorMessage
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil, nil];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [errorAlert show];
    });
}

@end
