//
//  LenderProfileViewController.h
//  Steezz
//
//  Created by Apple on 09/05/17.
//  Copyright © 2017 Prince. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LPlaceholderTextView.h"
@interface LenderProfileViewController : UIViewController<UIImagePickerControllerDelegate,UIActionSheetDelegate>

{
    IBOutlet UITextField *usernametxtFld;
    IBOutlet UIButton *cameraBtn;
    
    IBOutlet UIButton *myProfileBackBtn;
    
    IBOutlet UITextField *nameTextFld;
    
    IBOutlet UITextField *emailTxtFld;
    
    IBOutlet UITextField *lastNameTextField;
    
    IBOutlet UITextField *phoneNumbertxtFld;
    
   
    IBOutlet UITextField *addressTxtFld;
    IBOutlet MVPlaceSearchTextField *locationtextFld;
  
    IBOutlet LPlaceholderTextView *aboutTxtView;
    
    IBOutlet UIImageView *userProfilePic;
    
    IBOutlet UIButton *editBtn;
    
}

@end
