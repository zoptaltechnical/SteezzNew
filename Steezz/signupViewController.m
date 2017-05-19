//
//  signupViewController.m
//  Steezz
//
//  Created by Apple on 05/05/17.
//  Copyright © 2017 Prince. All rights reserved.
//

#import "signupViewController.h"

@interface signupViewController ()<PlaceSearchTextFieldDelegate>

@end

@implementation signupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    firstnameTxtFld.borderStyle = UITextBorderStyleLine;
    firstnameTxtFld.layer.borderWidth = 1;
    firstnameTxtFld.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    firstnameTxtFld.layer.cornerRadius = 15.0;
    
    lastnameTxtFld.borderStyle = UITextBorderStyleLine;
    lastnameTxtFld.layer.borderWidth = 1;
    lastnameTxtFld.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    lastnameTxtFld.layer.cornerRadius = 15.0;

    passwordTxtFld.borderStyle = UITextBorderStyleLine;
    passwordTxtFld.layer.borderWidth = 1;
    passwordTxtFld.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    passwordTxtFld.layer.cornerRadius = 15.0;

    emailTxtFld.borderStyle = UITextBorderStyleLine;
    emailTxtFld.layer.borderWidth = 1;
    emailTxtFld.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    emailTxtFld.layer.cornerRadius = 15.0;

    addressTxtFld.borderStyle = UITextBorderStyleLine;
    addressTxtFld.layer.borderWidth = 1;
    addressTxtFld.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    addressTxtFld.layer.cornerRadius = 15.0;

    mobileTxtFld.borderStyle = UITextBorderStyleLine;
    mobileTxtFld.layer.borderWidth = 1;
    mobileTxtFld.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    mobileTxtFld.layer.cornerRadius = 15.0;

    areaTxtFld.borderStyle = UITextBorderStyleLine;
    areaTxtFld.layer.borderWidth = 1;
    areaTxtFld.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    areaTxtFld.layer.cornerRadius = 15.0;
    areaTxtFld.placeSearchDelegate                 = self;
    areaTxtFld.strApiKey                           = @"AIzaSyCDi2dklT-95tEHqYoE7Tklwzn3eJP-MtM";
    areaTxtFld.superViewOfList                     = self.view;
    areaTxtFld.autoCompleteShouldHideOnSelection   = YES;
    areaTxtFld.maximumNumberOfAutoCompleteRows     = 5;
    
    aboutUserTxtView.layer.borderWidth = 1;
    aboutUserTxtView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    aboutUserTxtView.layer.cornerRadius = 15.0;
   
    aboutUserTxtView.placeholderColor = [UIColor lightGrayColor];
    
    
    if (ScreenHeight<=568)
    {
       aboutUserTxtView.placeholderText = @"                      About User";
    }
    
    else if (ScreenHeight <=670)
    {
         aboutUserTxtView.placeholderText = @"                             About User";
       
    }
    
    else if (ScreenHeight <=736)
    {
         aboutUserTxtView.placeholderText = @"                                 About User";
    }
    
    usernametxtFld.borderStyle = UITextBorderStyleRoundedRect;
    usernametxtFld.layer.borderWidth = 1;
    usernametxtFld.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    usernametxtFld.layer.cornerRadius = 15.0;
    
    [Utility addHorizontalPadding:[NSMutableArray arrayWithObjects:firstnameTxtFld ,nil]];
    [Utility addHorizontalPadding:[NSMutableArray arrayWithObjects:lastnameTxtFld ,nil]];
    [Utility addHorizontalPadding:[NSMutableArray arrayWithObjects:passwordTxtFld ,nil]];
    [Utility addHorizontalPadding:[NSMutableArray arrayWithObjects:mobileTxtFld ,nil]];
    [Utility addHorizontalPadding:[NSMutableArray arrayWithObjects:areaTxtFld ,nil]];
    [Utility addHorizontalPadding:[NSMutableArray arrayWithObjects:addressTxtFld ,nil]];
    [Utility addHorizontalPadding:[NSMutableArray arrayWithObjects:usernametxtFld ,nil]];
    [Utility addHorizontalPadding:[NSMutableArray arrayWithObjects:emailTxtFld ,nil]];
    // Do any additional setup after loading the view.
}





-(void)viewDidAppear:(BOOL)animated{
    
    //Optional Properties
    areaTxtFld.autoCompleteRegularFontName =  @"HelveticaNeue-Bold";
    areaTxtFld.autoCompleteBoldFontName = @"HelveticaNeue";
    areaTxtFld.autoCompleteTableCornerRadius=0.0;
    areaTxtFld.autoCompleteRowHeight=35;
    areaTxtFld.autoCompleteTableCellTextColor=[UIColor colorWithWhite:0.131 alpha:1.000];
    areaTxtFld.autoCompleteFontSize=14;
    areaTxtFld.autoCompleteTableBorderWidth=1.0;
    areaTxtFld.showTextFieldDropShadowWhenAutoCompleteTableIsOpen=YES;
    areaTxtFld.autoCompleteShouldHideOnSelection=YES;
    areaTxtFld.autoCompleteShouldHideClosingKeyboard=YES;
    areaTxtFld.autoCompleteShouldSelectOnExactMatchAutomatically = YES;
    
    NSLog(@"%@",areaTxtFld.text);
    
    areaTxtFld.autoCompleteTableFrame = CGRectMake((self.view.frame.size.width-areaTxtFld.frame.size.width)*0.5, areaTxtFld.frame.size.height+100.0, areaTxtFld.frame.size.width, 200.0);
}

#pragma mark - 
#pragma -> Place search Textfield Delegates
-(void)placeSearchResponseForSelectedPlace:(NSMutableDictionary*)responseDict{
    [self.view endEditing:YES];
    NSLog(@"%@",responseDict);
    
    NSDictionary *aDictLocation=[[[responseDict objectForKey:@"result"] objectForKey:@"geometry"] objectForKey:@"location"];
    NSLog(@"SELECTED ADDRESS :%@",aDictLocation);
}
-(void)placeSearchWillShowResult{
    
}
-(void)placeSearchWillHideResult{
    
}
-(void)placeSearchResultCell:(UITableViewCell *)cell withPlaceObject:(PlaceObject *)placeObject atIndex:(NSInteger)index{
    if(index%2==0){
        cell.contentView.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
    }else{
        cell.contentView.backgroundColor = [UIColor whiteColor];
    }
}




- (IBAction)signUpBtnPressed:(id)sender {
    
    

    
    [self validations];
    
}




- (IBAction)signInBtnPressed:(id)sender {
    
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    signInViewController *homeObj = [storyboard instantiateViewControllerWithIdentifier:@"signInViewController"];
    [self.navigationController pushViewController:homeObj animated:YES];
}






- (IBAction)signupBackBtnPressed:(id)sender {
    
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
}




-(void)validations
{
    
    if ([[firstnameTxtFld.text stringByReplacingOccurrencesOfString:@" " withString:@""] length] == 0)
    {
        
        [SRAlertView sr_showAlertViewWithTitle:@"Alert"
                                       message:@"Please enter your First name"
                               leftActionTitle:@"OK"
                              rightActionTitle:@""
                                animationStyle:AlertViewAnimationDownToCenterSpring
                                  selectAction:^(AlertViewActionType actionType) {
                                      NSLog(@"%zd", actionType);
                                  }];
        
        
        [firstnameTxtFld resignFirstResponder];
        
        
    }
    
    else if ([[lastnameTxtFld.text stringByReplacingOccurrencesOfString:@" " withString:@""] length] == 0)
    {

    
        [SRAlertView sr_showAlertViewWithTitle:@"Alert"
                                       message:@"Please enter your Last Name"
                               leftActionTitle:@"OK"
                              rightActionTitle:@""
                                animationStyle:AlertViewAnimationDownToCenterSpring
                                  selectAction:^(AlertViewActionType actionType) {
                                      NSLog(@"%zd", actionType);
                                  }];
        
        
        [lastnameTxtFld resignFirstResponder];}
    
    else if ([[passwordTxtFld.text stringByReplacingOccurrencesOfString:@" " withString:@""] length] == 0)
    {
        [SRAlertView sr_showAlertViewWithTitle:@"Alert"
                                       message:@"Please enter your Password"
                               leftActionTitle:@"OK"
                              rightActionTitle:@""
                                animationStyle:AlertViewAnimationDownToCenterSpring
                                  selectAction:^(AlertViewActionType actionType) {
                                      NSLog(@"%zd", actionType);
                                  }];
        
        
        [passwordTxtFld resignFirstResponder];    }
    
    
    else if ([[emailTxtFld.text stringByReplacingOccurrencesOfString:@" " withString:@""] length] == 0)
    {
        [SRAlertView sr_showAlertViewWithTitle:@"Alert"
                                       message:@"Please enter your Email"
                               leftActionTitle:@"OK"
                              rightActionTitle:@""
                                animationStyle:AlertViewAnimationDownToCenterSpring
                                  selectAction:^(AlertViewActionType actionType) {
                                      NSLog(@"%zd", actionType);
                                  }];
        
        
        [emailTxtFld resignFirstResponder];    }
    
    else if ([[addressTxtFld.text stringByReplacingOccurrencesOfString:@" " withString:@""] length] == 0)
    {
        
        [SRAlertView sr_showAlertViewWithTitle:@"Alert"
                                       message:@"Please enter your Address"
                               leftActionTitle:@"OK"
                              rightActionTitle:@""
                                animationStyle:AlertViewAnimationDownToCenterSpring
                                  selectAction:^(AlertViewActionType actionType) {
                                      NSLog(@"%zd", actionType);
                                  }];
        
        
        [addressTxtFld resignFirstResponder];    }
    
    
    
    else if ([[areaTxtFld.text stringByReplacingOccurrencesOfString:@" " withString:@""] length] == 0)
    {
        [SRAlertView sr_showAlertViewWithTitle:@"Alert"
                                       message:@"Please enter your area"
                               leftActionTitle:@"OK"
                              rightActionTitle:@""
                                animationStyle:AlertViewAnimationDownToCenterSpring
                                  selectAction:^(AlertViewActionType actionType) {
                                      NSLog(@"%zd", actionType);
                                  }];
        
        
        [areaTxtFld resignFirstResponder];    }
    
    else if ([[aboutUserTxtView.text stringByReplacingOccurrencesOfString:@" " withString:@""] length] == 0)
    {
        
        [SRAlertView sr_showAlertViewWithTitle:@"Alert"
                                       message:@"Please Fill About User Field"
                               leftActionTitle:@"OK"
                              rightActionTitle:@""
                                animationStyle:AlertViewAnimationDownToCenterSpring
                                  selectAction:^(AlertViewActionType actionType) {
                                      NSLog(@"%zd", actionType);
                                  }];
        
        
        [aboutUserTxtView resignFirstResponder];    }
    
    
    
    else if ([[mobileTxtFld.text stringByReplacingOccurrencesOfString:@" " withString:@""] length] == 0)
    {
        [SRAlertView sr_showAlertViewWithTitle:@"Alert"
                                       message:@"Please enter your Phone Number"
                               leftActionTitle:@"OK"
                              rightActionTitle:@""
                                animationStyle:AlertViewAnimationDownToCenterSpring
                                  selectAction:^(AlertViewActionType actionType) {
                                      NSLog(@"%zd", actionType);
                                  }];
        
        
        [mobileTxtFld resignFirstResponder];    }
    
    else if ([[usernametxtFld.text stringByReplacingOccurrencesOfString:@" " withString:@""] length] == 0)
    {
        
        [SRAlertView sr_showAlertViewWithTitle:@"Alert"
                                       message:@"Please enter your Username"
                               leftActionTitle:@"OK"
                              rightActionTitle:@""
                                animationStyle:AlertViewAnimationDownToCenterSpring
                                  selectAction:^(AlertViewActionType actionType) {
                                      NSLog(@"%zd", actionType);
                                  }];
        
        
        [usernametxtFld resignFirstResponder];
    }
    
    
    
    else if (![Utility NSStringIsValidEmail:emailTxtFld.text])
    {
        
        [SRAlertView sr_showAlertViewWithTitle:@"Alert"
                                       message:@"Please enter Valid Email"
                               leftActionTitle:@"OK"
                              rightActionTitle:@""
                                animationStyle:AlertViewAnimationRightToCenterSpring
                                  selectAction:^(AlertViewActionType actionType) {
                                      NSLog(@"%zd", actionType);
                                  }];
        
        
        [emailTxtFld resignFirstResponder];
        
    }
    
     else
    {
        [self callSignUpAPI];
        
    }
}

-(void)callSignUpAPI
{
    
    [Appdelegate startLoader:nil withTitle:@"Loading..."];
    
    NSDictionary* registerInfo;
    

            registerInfo= @{
                            @"first_name":firstnameTxtFld.text,
                            @"last_name":lastnameTxtFld.text,
                            @"username":usernametxtFld.text,
                            @"email":emailTxtFld.text,
                            @"password":passwordTxtFld.text,
                            @"address":addressTxtFld.text,
                            @"cpassword":passwordTxtFld.text,
                            @"phone":mobileTxtFld.text,
                            @"password":passwordTxtFld.text,
                            @"about_user":aboutUserTxtView.text,
                            @"device_token":@"123456789",
                            @"device_type":@"IOS",
                            @"location":addressTxtFld.text
                            };
    
    McomLOG(@"%@",registerInfo);
    [API signUpUserWithInfo:[registerInfo mutableCopy] completionHandler:^(NSDictionary *responseDict,NSError *error)
     {
         [Appdelegate stopLoader:nil];
         NSDictionary *dict_response = [[NSDictionary alloc]initWithDictionary:responseDict];
         
         if ([responseDict[@"result"]boolValue]==0)
         {
             NSString * errormessage = [NSString stringWithFormat:@"%@",[dict_response valueForKey:@"message"]];
             
             [Utility showAlertWithTitleText:errormessage messageText:nil delegate:nil];
         }
         else if ([responseDict[@"result"]boolValue]==1)
         {
             
             //  [Utility setValue:[responseDict valueForKey:@"access_token"] forKey:access_token];
             
             
             NSLog(@"sign_up responce Data%@", responseDict);
             
             
             [[NSUserDefaults standardUserDefaults] setObject:[responseDict objectForKey:@"data"]forKey:@"loginData"];
             [[NSUserDefaults standardUserDefaults] synchronize];
             
             
            UIViewController *popUpController = ViewControllerIdentifier(@"LenderNavigateID");
            [self.view.window setRootViewController:popUpController];
             

         }
     }];
}





@end
