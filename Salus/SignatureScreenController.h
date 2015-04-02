//
//  SignatureScreenController.h
//  Salus
//
//  Created by Daniel Bell on 2015-04-01.
//  Copyright (c) 2015 BellTechMedia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>

@interface SignatureScreenController : UIViewController{
    
    CGPoint lastPoint;
    CGFloat red;
    CGFloat green;
    CGFloat blue;
    CGFloat brush;
    CGFloat opacity;
    BOOL mouseSwiped;
}

@property (nonatomic, strong) NSMutableDictionary* thePatient;
@property (weak, nonatomic) IBOutlet UIImageView *MainImage;
@property (weak, nonatomic) IBOutlet UIImageView *TempDrawImage;
- (IBAction)FinishSignature:(UIButton *)sender;

@end
