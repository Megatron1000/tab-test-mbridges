//
//  ErrorAlert.h
//  HewdeniOS4
//
//  Created by Mark Bridges on 26/11/2012.
//  Copyright (c) 2012 Oakley Mobile. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString *errorTitle = @"A Glitch Has Occured";

@interface ErrorAlert : NSObject

+(void)showError:(NSError*)error;
+(void)showErrorWithMessage:(NSString *)errorMessage;

@end
