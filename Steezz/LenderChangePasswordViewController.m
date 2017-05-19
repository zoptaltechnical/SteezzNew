//
//  LenderChangePasswordViewController.m
//  Steezz
//
//  Created by Apple on 09/05/17.
//  Copyright © 2017 Prince. All rights reserved.
//

#import "LenderChangePasswordViewController.h"

@interface LenderChangePasswordViewController ()
{
    NSDictionary *dict;
}

@end

@implementation LenderChangePasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dict=  [[NSUserDefaults standardUserDefaults]objectForKey:@"loginData"];
    NSLog(@"%@ login data = ",dict);
    
    oldPaswrdTxtFld.borderStyle = UITextBorderStyleLine;
    oldPaswrdTxtFld.layer.borderWidth = 1;
    oldPaswrdTxtFld.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    oldPaswrdTxtFld.layer.cornerRadius = 5.0;
    
    newPaswrdTxtFld.borderStyle = UITextBorderStyleLine;
    newPaswrdTxtFld.layer.borderWidth = 1;
    newPaswrdTxtFld.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    newPaswrdTxtFld.layer.cornerRadius = 5.0;
    
    cnfrmPasswrdTxtFld.layer.borderWidth = 1;
    cnfrmPasswrdTxtFld.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    cnfrmPasswrdTxtFld.layer.cornerRadius = 5.0;

    [Utility addHorizontalPadding:[NSMutableArray arrayWithObjects:oldPaswrdTxtFld ,nil]];
    [Utility addHorizontalPadding:[NSMutableArray arrayWithObjects:newPaswrdTxtFld ,nil]];
    [Utility addHorizontalPadding:[NSMutableArray arrayWithObjects:cnfrmPasswrdTxtFld ,nil]];
    
    
    // Do any additional setup after loading the view.
}

- (IBAction)saveBtnPressed:(id)sender {
    [self changePasswordValidation];
}


- (IBAction)chngepasswrdBckBtnPressed:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}


-(void)changePasswordValidation
{
    
    if ([[oldPaswrdTxtFld.text stringByReplacingOccurrencesOfString:@" " withString:@""] length] == 0)
    {
        [SRAlertView sr_showAlertViewWithTitle:@"Alert"
                                       message:@"Please enter your old Pasword"
                               leftActionTitle:@"OK"
                              rightActionTitle:@""
                                animationStyle:AlertViewAnimationDownToCenterSpring
                                  selectAction:^(AlertViewActionType actionType) {
                                      NSLog(@"%zd", actionType);
                                  }];
        
    }
    
    else if ([[newPaswrdTxtFld.text stringByReplacingOccurrencesOfString:@" " withString:@""] length] == 0)
    {
        [SRAlertView sr_showAlertViewWithTitle:@"Alert"
                                       message:@"Please enter your new Password"
                               leftActionTitle:@"OK"
                              rightActionTitle:@""
                                animationStyle:AlertViewAnimationLeftToCenterSpring
                                  selectAction:^(AlertViewActionType actionType) {
                                      NSLog(@"%zd", actionType);
                                  }];
    }
    
    else if ([[cnfrmPasswrdTxtFld.text stringByReplacingOccurrencesOfString:@" " withString:@""] length] == 0)
    {
        [SRAlertView sr_showAlertViewWithTitle:@"Alert"
                                       message:@"Please enter your Password to conform."
                               leftActionTitle:@"OK"
                              rightActionTitle:@""
                                animationStyle:AlertViewAnimationRightToCenterSpring
                                  selectAction:^(AlertViewActionType actionType) {
                                      NSLog(@"%zd", actionType);
                                  }];
    }
    
    else if (![newPaswrdTxtFld.text isEqualToString:cnfrmPasswrdTxtFld.text])
    {
        
        
        [SRAlertView sr_showAlertViewWithTitle:@"AlertView"
                                       message:@"your Password do not match Please check."
                               leftActionTitle:@"OK"
                              rightActionTitle:@""
                                animationStyle:AlertViewAnimationRightToCenterSpring
                                  selectAction:^(AlertViewActionType actionType) {
                                      NSLog(@"%zd", actionType);
                                  }];
    }
    
    else
    {
        [self callChangePasswordAPI];
    }
}

# pragma  change Password API
-(void)callChangePasswordAPI
{
    
    dict=  [[NSUserDefaults standardUserDefaults]objectForKey:@"loginData"];
    NSLog(@"%@ login data = ",dict);
    
    NSDictionary* registerInfo;
    [Appdelegate startLoader:nil withTitle:@"Loading..."];
    
    registerInfo = @{
                     @"old_password":oldPaswrdTxtFld.text,
                     @"password":newPaswrdTxtFld.text,
                     @"access_token":[dict valueForKey:@"access_token"],
                     @"cpassword":cnfrmPasswrdTxtFld.text
                     };
    
    McomLOG(@"%@",registerInfo);
    [API changePasswordWithInfo:[registerInfo mutableCopy] completionHandler:^(NSDictionary *responseDict,NSError *error)
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
             NSLog(@"Home Feed Data =  %@",responseDict);
             
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
         
         [self.navigationController popViewControllerAnimated:YES];
         
     }];
}


@end
