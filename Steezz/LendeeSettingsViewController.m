//
//  LendeeSettingsViewController.m
//  Steezz
//
//  Created by Apple on 10/05/17.
//  Copyright © 2017 Prince. All rights reserved.
//

#import "LendeeSettingsViewController.h"

@interface LendeeSettingsViewController ()
{
    NSDictionary *dict;
    
    NSMutableArray *menu_label;
    
    NSMutableArray*Array_of_images;
}

@end

@implementation LendeeSettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    dict=  [[NSUserDefaults standardUserDefaults]objectForKey:@"loginData"];
    NSLog(@"%@ login data = ",dict);
    
    
    menu_label=[[NSMutableArray alloc]initWithObjects:@"MY PROFILE",@"FEEDBACK FORUM",@"NOTIFICATION CENTER",@"SUPPORT",@"ABOUT US",@"CHANGE PASSWORD",@"PAYMENTS",@"DISCLAIMER",@"SWITCH TO RENTER",nil];
    
    Array_of_images = [[NSMutableArray alloc] initWithObjects:
                       [UIImage imageNamed:@"profile_icon"],
                       [UIImage imageNamed:@"feedback-forum"],
                       [UIImage imageNamed:@"notification-center"],
                       [UIImage imageNamed:@"support"],
                       [UIImage imageNamed:@"about-us"],
                       [UIImage imageNamed:@"Change-Password"],
                       [UIImage imageNamed:@"payments"],
                       [UIImage imageNamed:@"Disclaimer"],
                       [UIImage imageNamed:@"Switch-to-Lendeer"], nil];
    
    
     [self callMyProfileAPI];
    // Do any additional setup after loading the view.
}

- (IBAction)lendeeLogoutBtnPressed:(id)sender {
 
    [Utility showAlertWithTitleText:@"Are you sure you want to logout?" messageText:nil delegate:self OKButtonText:@"NO" CancelButtonText:@"YES" tag:786100];
}





- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return menu_label.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"LendeeSettingsCell"];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LendeeSettingsCell"];
    }
    
    
    UIImageView *categoriesImageView = (UIImageView *)([cell.contentView  viewWithTag:9000000]);
    
    UILabel *Categories = (UILabel *)([cell.contentView viewWithTag:9000001]);
    
    Categories.text = [menu_label objectAtIndex:indexPath.row];
    
    categoriesImageView.image = [Array_of_images objectAtIndex:indexPath.row];
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return  cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    if (indexPath.row == 0)
    {
        
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        LenderProfileViewController *homeObj = [storyboard instantiateViewControllerWithIdentifier:@"LenderProfileViewController"];
        [self.navigationController pushViewController:homeObj animated:YES];
        
    }
    else if(indexPath.row == 1)
    {
        
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        LenderFeedBackForumViewController *homeObj = [storyboard instantiateViewControllerWithIdentifier:@"LenderFeedBackForumViewController"];
        [self.navigationController pushViewController:homeObj animated:YES];
        
        
    }
    else if (indexPath.row == 2)
    {
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        LenderProductDetailViewController *homeObj = [storyboard instantiateViewControllerWithIdentifier:@"LenderProductDetailViewController"];
        [self.navigationController pushViewController:homeObj animated:YES];
        
        
    }
    else if (indexPath.row == 3)
    {
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        lenderSupportViewController *homeObj = [storyboard instantiateViewControllerWithIdentifier:@"lenderSupportViewController"];
        [self.navigationController pushViewController:homeObj animated:YES];
        
    }
    
    
    else if (indexPath.row == 4)
    {
        
        
        //        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        //        LenderProductDetailViewController *homeObj = [storyboard instantiateViewControllerWithIdentifier:@"LenderProductDetailViewController"];
        //        [self.navigationController pushViewController:homeObj animated:YES];
        //
    }
    else if (indexPath.row == 5)
    {
        
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        LenderChangePasswordViewController *homeObj = [storyboard instantiateViewControllerWithIdentifier:@"LenderChangePasswordViewController"];
        [self.navigationController pushViewController:homeObj animated:YES];
        
        
    }
    else if (indexPath.row == 6)
    {
        
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        LenderProductDetailViewController *homeObj = [storyboard instantiateViewControllerWithIdentifier:@"LenderProductDetailViewController"];
        [self.navigationController pushViewController:homeObj animated:YES];
        
    }
    
    
    else if (indexPath.row == 7)
    {
        
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        LenderProductDetailViewController *homeObj = [storyboard instantiateViewControllerWithIdentifier:@"LenderProductDetailViewController"];
        [self.navigationController pushViewController:homeObj animated:YES];
    }
    
    
    else if (indexPath.row == 8)
    {
        
        [self callSwitchToLenderAPI];
        
        
       
    }
    
    
    
    
    
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    if (alertView.tag == 786100)
    {
        if (buttonIndex == 1)
        {
            [self callLogoutAPI];
        }
    }
    
}

# pragma LOGOUT API

-(void)callLogoutAPI
{
    
    dict=  [[NSUserDefaults standardUserDefaults]objectForKey:@"loginData"];
    NSLog(@"%@ login data = ",dict);
    
    [Appdelegate startLoader:nil withTitle:@"Loading..."];
    
    NSDictionary* registerInfo = @{
                                   @"access_token":[dict valueForKey:@"access_token"]
                                   };
    
    McomLOG(@"%@",registerInfo);
    [API LogoutWithInfo:[registerInfo mutableCopy] completionHandler:^(NSDictionary *responseDict,NSError *error)
     {
         
         [Appdelegate stopLoader:nil];
         
         NSDictionary *dict_response = [[NSDictionary alloc]initWithDictionary:responseDict];
         
         if ([responseDict[@"result"]boolValue]==0)
         {
             NSLog(@"%@",dict_response);
             
         }
         else if ([responseDict[@"result"]boolValue]==1)
         {
             NSLog(@"sign_up%@", responseDict);
             
             [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"loginData"];
             [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"Updation"];
             [[NSUserDefaults standardUserDefaults] removeObjectForKey:access_token];
             
             UIViewController *popUpController = ViewControllerIdentifier(@"LoginScreennavigateID");
             [self.view.window setRootViewController:popUpController];
             
             
         }
     }];
}



#pragma SWITCH TO LENDEE  API " which we have to save"
-(void)callSwitchToLenderAPI
{
    
    [Appdelegate startLoader:nil withTitle:@"Loading..."];
    
    NSDictionary* registerInfo = @{
                                   @"access_token":[dict valueForKey:@"access_token"],
                                   @"user_type":[dict valueForKey:@"user_type"]
                                   };
    
    McomLOG(@"%@",registerInfo);
    [API SwitchToLenderWithInfo:[registerInfo mutableCopy] completionHandler:^(NSDictionary *responseDict,NSError *error)
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
             
             
             UIViewController *popUpController = ViewControllerIdentifier(@"LenderNavigateID");
             [self.view.window setRootViewController:popUpController];
            
             [SRAlertView sr_showAlertViewWithTitle:@"Alert"
                                            message:@"You have sucessfully switch to RENTER."
                                    leftActionTitle:@"OK"
                                   rightActionTitle:@""
                                     animationStyle:AlertViewAnimationZoom
                                       selectAction:^(AlertViewActionType actionType) {
                                           NSLog(@"%zd", actionType);
                                       }];
             
         }
     }];
}




#pragma  CALL MY PROFILE API FOR LENDER

-(void)callMyProfileAPI
{
    
    dict=  [[NSUserDefaults standardUserDefaults]objectForKey:@"loginData"];
    NSLog(@"%@ login data = ",dict);
    
    [Appdelegate startLoader:nil withTitle:@"Loading..."];
    
    NSDictionary* registerInfo = @{
                                   @"access_token":[dict valueForKey:@"access_token"]
                                   };
    
    McomLOG(@"%@",registerInfo);
    [API myProfileWithInfo:[registerInfo mutableCopy] completionHandler:^(NSDictionary *responseDict,NSError *error)
     {
         
         [Appdelegate stopLoader:nil];
         
         NSDictionary *dict_response = [[NSDictionary alloc]initWithDictionary:responseDict];
         
         if ([responseDict[@"result"]boolValue]==0)
         {
             NSLog(@"%@",dict_response);
             
         }
         else if ([responseDict[@"result"]boolValue]==1)
         {
             NSLog(@"sign_up%@", responseDict);
             
             if ([responseDict valueForKey:@"data"])
             {
                 lendeeName.text = [NSString stringWithFormat:@"%@", [[responseDict valueForKey:@"data"] valueForKey:@"first_name"]];
                 
                 [lendeeImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",[[responseDict valueForKey:@"data"] valueForKey:@"profile_pic"]]] placeholderImage:[UIImage imageNamed:@"3"] options:SDWebImageRefreshCached];
                 
             }
         }
     }];
}


@end
