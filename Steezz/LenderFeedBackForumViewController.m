//
//  LenderFeedBackForumViewController.m
//  Steezz
//
//  Created by Apple on 09/05/17.
//  Copyright © 2017 Prince. All rights reserved.
//

#import "LenderFeedBackForumViewController.h"

@interface LenderFeedBackForumViewController ()
{
    NSString *rateString;
    NSDictionary *dict;
}

@end

@implementation LenderFeedBackForumViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dict=  [[NSUserDefaults standardUserDefaults]objectForKey:@"loginData"];
    NSLog(@"%@ login data = ",dict);
    
    feedbackMessageTextView.placeholderText = @"     Message";
    feedbackMessageTextView.placeholderColor = [UIColor lightGrayColor];
    
    feedbackMessageTextView.layer.borderWidth = 1;
    feedbackMessageTextView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    feedbackMessageTextView.layer.cornerRadius = 15.0;
    
    // Do any additional setup after loading the view.
}

- (IBAction)buttonFivePressed:(id)sender {
    
    NSString *str = @"Happy to help you \U0001F431";
    
    NSData *data = [str dataUsingEncoding:NSNonLossyASCIIStringEncoding];
    NSString *valueUnicode = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    
    NSData *dataa = [valueUnicode dataUsingEncoding:NSUTF8StringEncoding];
    NSString *valueEmoj = [[NSString alloc] initWithData:dataa encoding:NSNonLossyASCIIStringEncoding];
    
    feedbackMessageTextView.text = valueEmoj;
    
    rateString = @"5";
    
}

- (IBAction)buttonFourPressed:(id)sender {
    
    
    NSString *str = @"Happy to help you \U0000FE0E";
    
    NSData *data = [str dataUsingEncoding:NSNonLossyASCIIStringEncoding];
    NSString *valueUnicode = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    
    NSData *dataa = [valueUnicode dataUsingEncoding:NSUTF8StringEncoding];
    NSString *valueEmoj = [[NSString alloc] initWithData:dataa encoding:NSNonLossyASCIIStringEncoding];
    
    feedbackMessageTextView.text = valueEmoj;
    
    rateString = @"4";
}

- (IBAction)buttonThreePressed:(id)sender {
    
    
    NSString *str = @"Happy to help you \U0001F703";
    
    NSData *data = [str dataUsingEncoding:NSNonLossyASCIIStringEncoding];
    NSString *valueUnicode = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    
    NSData *dataa = [valueUnicode dataUsingEncoding:NSUTF8StringEncoding];
    NSString *valueEmoj = [[NSString alloc] initWithData:dataa encoding:NSNonLossyASCIIStringEncoding];
    
    feedbackMessageTextView.text = valueEmoj;
    rateString =@"3";
}

- (IBAction)buttonTwoPressed:(id)sender {
    
    
    
    NSString *str = @"Happy to help you \U0001F435";
    
    NSData *data = [str dataUsingEncoding:NSNonLossyASCIIStringEncoding];
    NSString *valueUnicode = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    
    NSData *dataa = [valueUnicode dataUsingEncoding:NSUTF8StringEncoding];
    NSString *valueEmoj = [[NSString alloc] initWithData:dataa encoding:NSNonLossyASCIIStringEncoding];
    
    feedbackMessageTextView.text = valueEmoj;
    rateString = @"2";
}
- (IBAction)buttonOnePressed:(id)sender {
    
    
    
    
    NSString *str = @"Happy to help you \U0001F439";
    
    NSData *data = [str dataUsingEncoding:NSNonLossyASCIIStringEncoding];
    NSString *valueUnicode = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    
    NSData *dataa = [valueUnicode dataUsingEncoding:NSUTF8StringEncoding];
    NSString *valueEmoj = [[NSString alloc] initWithData:dataa encoding:NSNonLossyASCIIStringEncoding];
    
    feedbackMessageTextView.text = valueEmoj;
    rateString = @"1";
    
}

- (IBAction)feedBackBACKBtnPressed:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)sendBtnPressed:(id)sender {
    
    [self FeedBackValidation];
    
}



-(void)FeedBackValidation
{
    if ([[feedbackMessageTextView.text stringByReplacingOccurrencesOfString:@" " withString:@""] length] == 0)
    {
        [SRAlertView sr_showAlertViewWithTitle:@"Alert"
                                       message:@"Please enter your Message"
                               leftActionTitle:@"OK"
                              rightActionTitle:@""
                                animationStyle:AlertViewAnimationTopToCenterSpring
                                  selectAction:^(AlertViewActionType actionType) {
                                      NSLog(@"%zd", actionType);
                                  }];
        
        [feedbackMessageTextView resignFirstResponder];
    }
    
    else if ([rateString length] == 0)
    {
        
        [SRAlertView sr_showAlertViewWithTitle:@"Alert"
                                       message:@"Please Select the rating from the smily button"
                               leftActionTitle:@"OK"
                              rightActionTitle:@""
                                animationStyle:AlertViewAnimationZoom
                                  selectAction:^(AlertViewActionType actionType) {
                                      NSLog(@"%zd", actionType);
                                  }];
        
        [feedbackMessageTextView resignFirstResponder];
    }
    
    else
    {
        [self callFeedBackAPI];
    }
}


#pragma Sign in API

-(void)callFeedBackAPI
{
    [Appdelegate startLoader:nil withTitle:@"Loading..."];
    
    
 
    NSDictionary* registerInfo = @{
                                   @"access_token":[dict valueForKey:@"access_token"],
                                   @"rate":rateString,
                                   @"message":feedbackMessageTextView
                                   };
    
    McomLOG(@"%@",registerInfo);
    [API LenderFeedbackWithInfo:[registerInfo mutableCopy] completionHandler:^(NSDictionary *responseDict,NSError *error)
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
             
             feedbackMessageTextView.text = nil;
             
             
             [SRAlertView sr_showAlertViewWithTitle:@"Alert"
                                            message:[responseDict valueForKey:@"message"]
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
