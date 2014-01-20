//
//  EmployeeDownloader.m
//  Our Team
//
//  Created by Mark Bridges on 20/01/2014.
//  Copyright (c) 2014 Mark Bridges. All rights reserved.
//

#import "EmployeeDownloader.h"

@interface EmployeeDownloader ()

@property (nonatomic, copy) DownloadCompletionHandler completionHandler;

@end

@implementation EmployeeDownloader

- (id)initWithCompletionHandler:(DownloadCompletionHandler)completionHandler{
    self = [super init];
    if (self){
        self.completionHandler = completionHandler;
        [self startPageSourceDownload];
    }
    return self;
}

- (void)startPageSourceDownload{
    NSURLRequest *theRequest=[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.theappbusiness.com/our-team/"]
                                              cachePolicy:NSURLRequestUseProtocolCachePolicy
                                          timeoutInterval:60.0];
    
    self.receivedData = [NSMutableData dataWithCapacity: 0];
    
    NSURLConnection *theConnection=[[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    if (!theConnection) {
        self.receivedData = nil;
        [ErrorAlert showErrorWithMessage:@"Unable To Create Connection"];
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    [self.receivedData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [self.receivedData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    self.receivedData = nil;
    self.completionHandler(self.receivedData);
    [ErrorAlert showError:error];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    self.completionHandler(self.receivedData);
}

@end
