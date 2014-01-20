//
//  EmployeeDownloader.h
//  Our Team
//
//  Created by Mark Bridges on 20/01/2014.
//  Copyright (c) 2014 Mark Bridges. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ErrorAlert.h"

typedef void (^DownloadCompletionHandler)(NSData *data);

@interface EmployeeDownloader : NSObject <NSURLConnectionDelegate, NSURLConnectionDataDelegate>

@property NSMutableData *receivedData;

@end
