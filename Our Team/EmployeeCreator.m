//
//  EmployeeCreator.m
//  Our Team
//
//  Created by Mark Bridges on 20/01/2014.
//  Copyright (c) 2014 Mark Bridges. All rights reserved.
//

#import "EmployeeCreator.h"

@interface EmployeeCreator ()

@property (nonatomic, copy) CreatorCompletionHandler completionHandler;

@end

@implementation EmployeeCreator

- (void)createEmployeesWithCompletionHandler:(CreatorCompletionHandler)completionHandler{
    (void)[[EmployeeDownloader alloc]initWithCompletionHandler:^(NSData *data) {
        
        TFHpple *htmlParser = [TFHpple hppleWithHTMLData:data];
        
        NSString *XpathQueryString = @"//div[@class='col col2']";
        NSArray *employeeNodes = [htmlParser searchWithXPathQuery:XpathQueryString];
        
        NSMutableArray *employees = [[NSMutableArray alloc]init];
        for (TFHppleElement *element in employeeNodes) {
            [employees addObject:[self createEmployeeForElement:element]];
        }
        
        completionHandler(employees);
    }];
}

- (Employee*)createEmployeeForElement:(TFHppleElement *)element{
    Employee *employee = [[Employee alloc] init];
    
    for (TFHppleElement *child in element.children) {
        if ([child.tagName isEqualToString:@"div"]) {
            for (TFHppleElement *grandchild in child.children) {
                if ([grandchild.tagName isEqualToString:@"img"]) {
                    employee.photoURL = [grandchild objectForKey:@"src"];
                }
            }
        } else if ([child.tagName isEqualToString:@"h3"]) {
            employee.name = [[child firstChild] content];
        } else if ([child.tagName isEqualToString:@"p"]) {
            // this isn't a great way of identifying which field is which
            if (employee.jobTitle.length==0) {
                employee.jobTitle = [[child firstChild] content];
            }
            else{
                employee.bio = [[child firstChild] content];
            }
        }
    }
    return employee;
}

@end
