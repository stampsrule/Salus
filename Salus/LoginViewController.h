//
//  LoginViewController.h
//  Salus
//
//  Created by Daniel Bell on 2015-03-26.
//  Copyright (c) 2015 BellTechMedia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *passowrd;
@property (nonatomic, strong) NSMutableData* mutableData;
@property (weak, nonatomic) IBOutlet UILabel *WrongPasswordLabel;

@end
