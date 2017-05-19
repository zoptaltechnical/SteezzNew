//
//  LenderProductDetailViewController.m
//  Steezz
//
//  Created by Apple on 08/05/17.
//  Copyright © 2017 Prince. All rights reserved.
//

#import "LenderProductDetailViewController.h"

@interface LenderProductDetailViewController ()
{
    NSString *product_id;
    NSDictionary *dict;
    
}

@end

@implementation LenderProductDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    userImage.layer.borderWidth=5;
    userImage.layer.cornerRadius=userImage.frame.size.width/2;;
    userImage.clipsToBounds= YES;
    
    userImage.layer.borderColor=[UIColor whiteColor].CGColor;
    
    dict=  [[NSUserDefaults standardUserDefaults]objectForKey:@"loginData"];
    NSLog(@"%@ login data = ",dict);
    
    
    [self callProductDetailAPI];
    // Do any additional setup after loading the view.
}

- (IBAction)detailBackBtnPressed:(id)sender {
    
    
    [self.navigationController popViewControllerAnimated:YES];
    
}


- (IBAction)favouriteBtnPressed:(id)sender
{
    
    
    [self callSaveProductAPI ];
    
}







- (IBAction)usernameBtnPressed:(id)sender {
    
    LenderBookingListViewController *secondView = [self.storyboard instantiateViewControllerWithIdentifier:@"LenderBookingListViewController"];
    [self.navigationController pushViewController:secondView animated:YES];
    
}
- (IBAction)settingBtnPressed:(id)sender {
    
    
    LenderSettingsViewController *secondView = [self.storyboard instantiateViewControllerWithIdentifier:@"LenderSettingsViewController"];
    [self.navigationController pushViewController:secondView animated:YES];
    
}

#pragma Product Detail API
-(void)callProductDetailAPI
{
    
    [Appdelegate startLoader:nil withTitle:@"Loading..."];
    
    NSDictionary* registerInfo = @{
                                   @"access_token":[dict valueForKey:@"access_token"],
                                   @"product_id":_ProductDetail
                                   };
    
    McomLOG(@"%@",registerInfo);
    
    [API ProductDetailWithInfo:[registerInfo mutableCopy] completionHandler:^(NSDictionary *responseDict,NSError *error)
     {
         
         [Appdelegate stopLoader:nil];
         NSDictionary *dict_response = [[NSDictionary alloc]initWithDictionary:responseDict];
         NSLog(@"%@",dict_response);
         
         if ([responseDict[@"result"]boolValue]==0)
         {
             [Utility showAlertWithTitleText:[responseDict valueForKey:@"message"] messageText:nil delegate:nil];
         }
         
         else if ([responseDict[@"result"]boolValue]==1)
         {
             NSLog(@"Home Feed List  = %@",responseDict);
             
             if ([responseDict valueForKey:@"product"])
             {
                 
                 date.text =[NSString stringWithFormat:@"%@",[[responseDict valueForKey:@"product"] valueForKey:@"available_date"]] ;
                 
                 location.text = [NSString stringWithFormat:@"%@",[[responseDict valueForKey:@"product"] valueForKey:@"location"]];
                 
                 descriptionTextView.text = [NSString stringWithFormat:@"%@",[[responseDict valueForKey:@"product"] valueForKey:@"product_desc"]];
                 
                 categoryName.text = [NSString stringWithFormat:@"%@",[[responseDict valueForKey:@"product"] valueForKey:@"cat_name"]];
                 
                 price.text =[NSString stringWithFormat:@"%@",[[responseDict valueForKey:@"product"] valueForKey:@"product_price"]];
                 
                 [usernameBtn setTitle:[NSString stringWithFormat:@"%@",[[responseDict valueForKey:@"product"] valueForKey:@"first_name"]] forState:UIControlStateNormal];
                 
                 
                 [productImage sd_setImageWithURL:[NSURL URLWithString: [[responseDict valueForKey:@"product"] valueForKey:@"product_image"] ]placeholderImage:[UIImage imageNamed:@"1"] options:SDWebImageRefreshCached];
                 
                 
                 
                 [userImage sd_setImageWithURL:[NSURL URLWithString: [[responseDict valueForKey:@"product"] valueForKey:@"profile_pic"] ]placeholderImage:[UIImage imageNamed:@"1"] options:SDWebImageRefreshCached];
                 
                 product_id = [NSString stringWithFormat:@"%@",[[responseDict valueForKey:@"product"] valueForKey:@"id"]];

             }
             
   
             
            }
     }];
}


-(void)callSaveProductAPI
{
    
    [Appdelegate startLoader:nil withTitle:@"Loading..."];
    
    NSDictionary* registerInfo = @{
                                   @"access_token":[dict valueForKey:@"access_token"],
                                   @"product_id":product_id
                                   };
    
    McomLOG(@"%@",registerInfo);
    [API SaveProductWithInfo:[registerInfo mutableCopy] completionHandler:^(NSDictionary *responseDict,NSError *error)
     {
         
         [Appdelegate stopLoader:nil];
         NSDictionary *dict_response = [[NSDictionary alloc]initWithDictionary:responseDict];
         NSLog(@"%@",dict_response);
         
         if ([responseDict[@"result"]boolValue]==0)
         {
             [Utility showAlertWithTitleText:[responseDict valueForKey:@"message"] messageText:nil delegate:nil];
         }
         
         else if ([responseDict[@"result"]boolValue]==1)
         {
             NSLog(@"save product = %@",responseDict);
             
             
             [SRAlertView sr_showAlertViewWithTitle:@"Alert"
                                            message:[responseDict valueForKey:@"message"]
                                    leftActionTitle:@"OK"
                                   rightActionTitle:@""
                                     animationStyle:AlertViewAnimationZoom
                                       selectAction:^(AlertViewActionType actionType) {
                                           NSLog(@"%zd", actionType);
                                       }];
             
         }
     }];
}





@end
