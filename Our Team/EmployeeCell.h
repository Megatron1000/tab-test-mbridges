//
//  EmployeeCell.h
//  Our Team
//
//  Created by Mark Bridges on 20/01/2014.
//  Copyright (c) 2014 Mark Bridges. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageViewRound.h"

@interface EmployeeCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageViewRound *pic;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *jobLabel;
@property (weak, nonatomic) IBOutlet UILabel *bioLabel;

@end
