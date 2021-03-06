//
//  EmployeeCreator.h
//  Our Team
//
//  Created by Mark Bridges on 20/01/2014.
//  Copyright (c) 2014 Mark Bridges. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TFHpple.h"
#import "Employee.h"
#import "EmployeeDownloader.h"

typedef void (^CreatorCompletionHandler)(NSArray *employees);

@interface EmployeeCreator : NSObject

- (void)createEmployeesWithCompletionHandler:(CreatorCompletionHandler)completionHandler;

@end
