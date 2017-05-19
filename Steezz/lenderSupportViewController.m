//
//  lenderSupportViewController.m
//  Steezz
//
//  Created by Apple on 09/05/17.
//  Copyright © 2017 Prince. All rights reserved.
//

#import "lenderSupportViewController.h"

@interface lenderSupportViewController ()
{
    
    
    NSDictionary *dict;
}

@end

@implementation lenderSupportViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dict=  [[NSUserDefaults standardUserDefaults]objectForKey:@"loginData"];
    NSLog(@"%@ login data = ",dict);
    
    supportName.borderStyle = UITextBorderStyleLine;
    supportName.layer.borderWidth = 1;
    supportName.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    supportName.layer.cornerRadius = 15.0;
    
    supportEmail.borderStyle = UITextBorderStyleLine;
    supportEmail.layer.borderWidth = 1;
    supportEmail.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    supportEmail.layer.cornerRadius = 15.0;
    
    messageTxtView.layer.borderWidth = 1;
    messageTxtView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    messageTxtView.layer.cornerRadius = 15.0;
    messageTxtView.placeholderText = @"    Message";
    messageTxtView.placeholderColor = [UIColor lightGrayColor];
    
    [Utility addHorizontalPadding:[NSMutableArray arrayWithObjects:supportName ,nil]];
    [Utility addHorizontalPadding:[NSMutableArray arrayWithObjects:supportEmail ,nil]];
    
    // Do any additional setup after loading the view.
}

- (IBAction)lenderSupportBackBtnPressed:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}



- (IBAction)sendBtnPressed:(id)sender {
    
    
    [self LenderSupportValidations];
    
    
}


#pragma lender Support Validation

-(void)LenderSupportValidations
{
    
    if ([[supportName.text stringByReplacingOccurrencesOfString:@" " withString:@""] length] == 0)
    {
        
        [SRAlertView sr_showAlertViewWithTitle:@"Alert"
                                       message:@"Please enter name"
                               leftActionTitle:@"OK"
                              rightActionTitle:@""
                                animationStyle:AlertViewAnimationDownToCenterSpring
                                  selectAction:^(AlertViewActionType actionType) {
                                      NSLog(@"%zd", actionType);
                                  }];
        
        
        [supportName resignFirstResponder];
        
        
    }
    
    else if ([[supportEmail.text stringByReplacingOccurrencesOfString:@" " withString:@""] length] == 0)
    {
        
        
        [SRAlertView sr_showAlertViewWithTitle:@"Alert"
                                       message:@"Please enter your Email"
                               leftActionTitle:@"OK"
                              rightActionTitle:@""
                                animationStyle:AlertViewAnimationDownToCenterSpring
                                  selectAction:^(AlertViewActionType actionType) {
                                      NSLog(@"%zd", actionType);
                                  }];
        
        
        [supportEmail resignFirstResponder];
        [supportName resignFirstResponder];}
    
    else if ([[messageTxtView.text stringByReplacingOccurrencesOfString:@" " withString:@""] length] == 0)
    {
        [SRAlertView sr_showAlertViewWithTitle:@"Alert"
                                       message:@"Please enter Message"
                               leftActionTitle:@"OK"
                              rightActionTitle:@""
                                animationStyle:AlertViewAnimationDownToCenterSpring
                                  selectAction:^(AlertViewActionType actionType) {
                                      NSLog(@"%zd", actionType);
                                  }];
        
        [supportEmail resignFirstResponder];
        [supportName resignFirstResponder];
        [messageTxtView resignFirstResponder];    }
    
    
    
    
    
    else if (![Utility NSStringIsValidEmail:supportEmail.text])
    {
        
        [SRAlertView sr_showAlertViewWithTitle:@"Alert"
                                       message:@"Please enter Valid Email"
                               leftActionTitle:@"OK"
                              rightActionTitle:@""
                                animationStyle:AlertViewAnimationRightToCenterSpring
                                  selectAction:^(AlertViewActionType actionType) {
                                      NSLog(@"%zd", actionType);
                                  }];
        
        [supportEmail resignFirstResponder];
        [supportName resignFirstResponder];
        [supportEmail resignFirstResponder];
        
    }
    
    else
    {
        [self callLenderSupportAPI];
        
    }
}




#pragma call lender support API

-(void)callLenderSupportAPI
{
    [Appdelegate startLoader:nil withTitle:@"Loading..."];
    
   
    
    NSDictionary* registerInfo = @{
                                   @"email":supportEmail.text,
                                   @"access_token":[dict valueForKey:@"access_token"],
                                   @"name":supportName.text,
                                   @"message":messageTxtView.text
                                   };
    
    McomLOG(@"%@",registerInfo);
    [API LenderSupportWithInfo:[registerInfo mutableCopy] completionHandler:^(NSDictionary *responseDict,NSError *error)
     {
         
         [Appdelegate stopLoader:nil];
         
         NSDictionary *dict_response = [[NSDictionary alloc]initWithDictionary:responseDict];
         
         if ([responseDict[@"result"]boolValue]==0)
         {
             NSString * errormessage = [NSString stringWithFormat:@"%@",[dict_response valueForKey:@"message"]];
             
             [SRAlertView sr_showAlertViewWithTitle:@"Alert"
                                            message:errormessage
                                    leftActionTitle:@"OK"
                                   rightActionTitle:@""
                                     animationStyle:AlertViewAnimationRightToCenterSpring
                                       selectAction:^(AlertViewActionType actionType) {
                                           NSLog(@"%zd", actionType);
                                       }];
             
         }
         else if ([responseDict[@"result"]boolValue]==1)
         {
             NSLog(@"sign_up%@", responseDict);
             
             [SRAlertView sr_showAlertViewWithTitle:@"Alert"
                                            message:@"Success: Your message submitted successfully. We will contact you very shortly"
                                    leftActionTitle:@"OK"
                                   rightActionTitle:@""
                                     animationStyle:AlertViewAnimationRightToCenterSpring
                                       selectAction:^(AlertViewActionType actionType) {
                                           NSLog(@"%zd", actionType);
                                       }];
         }
     }];
}



@end
