//
//  LendeeAddProductViewController.h
//  Steezz
//
//  Created by Apple on 10/05/17.
//  Copyright © 2017 Prince. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MVPlaceSearchTextField.h"

@interface LendeeAddProductViewController : UIViewController<UIImagePickerControllerDelegate,UIActionSheetDelegate>
{
    
    IBOutlet UIButton *backBtn;
    
    IBOutlet UITextField *datetxtFld;
    
    
    IBOutlet MVPlaceSearchTextField *locationTxtFld;
    
    
    IBOutlet UITextField *pricetxtFld;
    
    
    IBOutlet LPlaceholderTextView *description;
 
    
    IBOutlet UIButton *submitBtn;
    
    IBOutlet UIButton *cameraBtn;
    
    IBOutlet UIImageView *productImage;
    IBOutlet UIButton *selectCategoryBtn;
    
    
}

@end
