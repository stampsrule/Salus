//
//  AdverseReactionViewController.h
//  Salus
//
//  Created by Daniel Bell on 2015-03-31.
//  Copyright (c) 2015 BellTechMedia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "vaccineSelectorViewController.h"

@interface AdverseReactionViewController : UIViewController <vaccineSelectorViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *VaccineLabel;
@property (nonatomic, strong) NSMutableDictionary* thePatient;

@end
