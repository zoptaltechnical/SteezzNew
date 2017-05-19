//
//  LenderChangePasswordViewController.h
//  Steezz
//
//  Created by Apple on 09/05/17.
//  Copyright © 2017 Prince. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LenderChangePasswordViewController : UIViewController

{
    IBOutlet UITextField *cnfrmPasswrdTxtFld;
    
    IBOutlet UIButton *chngePasswrdBckBtn;
    IBOutlet UITextField *oldPaswrdTxtFld;
    
    IBOutlet UITextField *newPaswrdTxtFld;
    
    IBOutlet UIButton *saveBtn;
}

@end
