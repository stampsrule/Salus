//
//  vaccineSelectorViewController.h
//  Salus
//
//  Created by Daniel Bell on 2015-04-01.
//  Copyright (c) 2015 BellTechMedia. All rights reserved.
//

#import <UIKit/UIKit.h>

@class vaccineSelectorViewController;

@protocol vaccineSelectorViewControllerDelegate <NSObject>
- (void)vaccineSelectorViewController:(vaccineSelectorViewController *)controller didChooseValue:(NSString *)vaccine;
@end


@interface vaccineSelectorViewController : UIViewController <UIPickerViewDataSource,UIPickerViewDelegate>
{
    NSString *vaccine;
}

@property (strong, nonatomic) NSArray *vaccineNames;

@property (weak, nonatomic) IBOutlet UIPickerView *Picker;

@property (nonatomic, weak) id <vaccineSelectorViewControllerDelegate> delegate;

- (IBAction)Save:(id)sender;


@end