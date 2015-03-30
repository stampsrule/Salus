//
//  PatientCell.h
//  Salus
//
//  Created by Daniel Bell on 2015-03-30.
//  Copyright (c) 2015 BellTechMedia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PatientCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *addressLabel;
@property (nonatomic, weak) IBOutlet UILabel *AHSIDLabel;

@end
