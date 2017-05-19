//
//  lenderSupportViewController.h
//  Steezz
//
//  Created by Apple on 09/05/17.
//  Copyright © 2017 Prince. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "LPlaceholderTextView.h"

@interface lenderSupportViewController : UIViewController

{
    
    IBOutlet UIButton *sendBtn;
    
    IBOutlet UIButton *lenderSupportBackBtn;
    IBOutlet UITextField *supportName;
    
    
    IBOutlet UITextField *supportEmail;
    
    IBOutlet LPlaceholderTextView *messageTxtView;
    
   
    
    
    
}

@end
