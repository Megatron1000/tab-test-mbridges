//
//  TeamListViewController.m
//  Our Team
//
//  Created by Mark Bridges on 20/01/2014.
//  Copyright (c) 2014 Mark Bridges. All rights reserved.
//

#import "TeamListViewController.h"

@interface TeamListViewController ()

@end

@implementation TeamListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
//    [self.collectionView registerClass:[EmployeeCell class] forCellWithReuseIdentifier:@"EmployeeCell"];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self refreshEmployeesArray];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)refreshEmployeesArray{
    if (!self.employeeCreator) {
        self.employeeCreator = [[EmployeeCreator alloc]init];
    }
    [self.employeeCreator createEmployeesWithCompletionHandler:^(NSArray *employees) {
        self.employees = employees;
        [self.collectionView reloadData];
    }];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.employees.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    Employee *thisEmployee = [self.employees objectAtIndex:indexPath.row];
    
    EmployeeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"EmployeeCell" forIndexPath:indexPath];
    [cell setBackgroundColor:[UIColor redColor]];
    [cell.pic setImageWithURL:[NSURL URLWithString:thisEmployee.photoURL]];
    [cell.nameLabel setText:thisEmployee.name];
    [cell.jobLabel setText:thisEmployee.jobTitle];
    [cell.bioLabel setText:thisEmployee.bio];
    
    return cell;
}




@end
