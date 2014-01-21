//
//  TeamListViewController.h
//  Our Team
//
//  Created by Mark Bridges on 20/01/2014.
//  Copyright (c) 2014 Mark Bridges. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EmployeeCreator.h"
#import "EmployeeCell.h"
#import "UIImageView+WebCache.h"

@interface TeamListViewController : UICollectionViewController

@property EmployeeCreator *employeeCreator;
@property NSArray *employees;

@end
