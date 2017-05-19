//
//  signInViewController.m
//  Steezz
//
//  Created by Apple on 05/05/17.
//  Copyright © 2017 Prince. All rights reserved.
//

#import "signInViewController.h"

@interface signInViewController ()

@end

@implementation signInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    signInEmailTxtFld.borderStyle = UITextBorderStyleLine;
    signInEmailTxtFld.layer.borderWidth = 2;
    signInEmailTxtFld.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    signInEmailTxtFld.layer.cornerRadius = 15.0;

    
    signInPasswrdTxtFld.borderStyle = UITextBorderStyleLine;
    signInPasswrdTxtFld.layer.borderWidth = 2;
    signInPasswrdTxtFld.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    signInPasswrdTxtFld.layer.cornerRadius = 15.0;

}
- (IBAction)signInBtnPressed:(id)sender {
    
    
    [self signInValidation];
//    
//    UIViewController *popUpController = ViewControllerIdentifier(@"LenderNavigateID");
//    [self.view.window setRootViewController:popUpController];
//    
    
    
}

- (IBAction)keepMrSignInBtnPressed:(id)sender {
    
}

- (IBAction)forgotPasswordBtnPressed:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    forgotPasswordViewController *homeObj = [storyboard instantiateViewControllerWithIdentifier:@"forgotPasswordViewController"];
    [self.navigationController pushViewController:homeObj animated:YES];

    
    
}



- (IBAction)backBtnPressed:(id)sender
{
    
     [self.navigationController popViewControllerAnimated:YES];
 
}




-(void)signInValidation
{
    if ([[signInEmailTxtFld.text stringByReplacingOccurrencesOfString:@" " withString:@""] length] == 0)
    {
        [SRAlertView sr_showAlertViewWithTitle:@"Alert"
                                       message:@"Please enter your Username or Email"
                               leftActionTitle:@"OK"
                              rightActionTitle:@""
                                animationStyle:AlertViewAnimationTopToCenterSpring
                                  selectAction:^(AlertViewActionType actionType) {
                                      NSLog(@"%zd", actionType);
                                  }];
        
        [signInEmailTxtFld resignFirstResponder];
    }
    
    else if ([[signInPasswrdTxtFld.text stringByReplacingOccurrencesOfString:@" " withString:@""] length] == 0)
    {
        
        [SRAlertView sr_showAlertViewWithTitle:@"Alert"
                                       message:@"Please enter your Password"
                               leftActionTitle:@"OK"
                              rightActionTitle:@""
                                animationStyle:AlertViewAnimationZoom
                                  selectAction:^(AlertViewActionType actionType) {
                                      NSLog(@"%zd", actionType);
                                  }];
        
        [signInPasswrdTxtFld resignFirstResponder];
    }
    
    else
    {
        [self callSignInAPI];
    }
}


#pragma Sign in API

-(void)callSignInAPI
{
    [Appdelegate startLoader:nil withTitle:@"Loading..."];
    
    NSDictionary* registerInfo = @{
                                   @"username":signInEmailTxtFld.text,
                                   @"password":signInPasswrdTxtFld.text,
                                   @"device_token":@"12345678",
                                   @"device_type":@"iPhone"
                                   };
    
    McomLOG(@"%@",registerInfo);
    [API signInUserWithInfo:[registerInfo mutableCopy] completionHandler:^(NSDictionary *responseDict,NSError *error)
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
             
             [[NSUserDefaults standardUserDefaults] setObject:[responseDict objectForKey:@"data"]forKey:@"loginData"];
             [[NSUserDefaults standardUserDefaults] synchronize];
             
             LenderTabBarViewController *secondView = [self.storyboard instantiateViewControllerWithIdentifier:@"LenderTabBarViewController"];
             [self.navigationController pushViewController:secondView animated:YES];
          
         }
     }];
}


@end
