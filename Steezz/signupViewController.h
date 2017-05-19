//
//  signupViewController.h
//  Steezz
//
//  Created by Apple on 05/05/17.
//  Copyright © 2017 Prince. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MVPlaceSearchTextField.h"
#import "LPlaceholderTextView.h"
@interface signupViewController : UIViewController

{
    
    IBOutlet UIButton *signUpBackBtn;
    
    IBOutlet UITextField *firstnameTxtFld;
    
    IBOutlet UITextField *lastnameTxtFld;
    
    IBOutlet UITextField *usernametxtFld;
    
    IBOutlet UITextField *emailTxtFld;
    
    IBOutlet LPlaceholderTextView *aboutUserTxtView;
   
    
    IBOutlet UITextField *passwordTxtFld;
    
    IBOutlet UITextField *mobileTxtFld;
    
    
    IBOutlet MVPlaceSearchTextField *areaTxtFld;
    
    IBOutlet UITextField *addressTxtFld;
    
    IBOutlet UIButton *signUpBtn;
    
    IBOutlet UIButton *signInBtn;
}

@end
