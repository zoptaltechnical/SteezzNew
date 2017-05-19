//
//  lenderSaverViewController.m
//  Steezz
//
//  Created by Apple on 08/05/17.
//  Copyright © 2017 Prince. All rights reserved.
//

#import "lenderSaverViewController.h"

@interface lenderSaverViewController ()
{
    
    NSDictionary *dict;
    NSMutableArray *savedProductArray;
    
}

@end

@implementation lenderSaverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dict=  [[NSUserDefaults standardUserDefaults]objectForKey:@"loginData"];
    NSLog(@"%@ login data = ",dict);
    
    [self callSavedProductAPI];
    // Do any additional setup after loading the view.
}


- (IBAction)savedSettingBtnPressed:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    LenderSettingsViewController *homeObj = [storyboard instantiateViewControllerWithIdentifier:@"LenderSettingsViewController"];
    [self.navigationController pushViewController:homeObj animated:YES];
    
    
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return savedProductArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"LenderSavedCell"];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LenderSavedCell"];
    }
    
        UILabel *ProductName=(UILabel *)[cell.contentView viewWithTag:2000];
        ProductName.text= [NSString stringWithFormat:@"%@",[[savedProductArray valueForKey:@"product_name"]objectAtIndex:indexPath.row]];

        UILabel *Price=(UILabel *)[cell.contentView viewWithTag:2001];
        Price.text= [NSString stringWithFormat:@"%@",[[savedProductArray valueForKey:@"product_price"]objectAtIndex:indexPath.row]];
    
        UILabel *description=(UILabel *)[cell.contentView viewWithTag:2002];
        description.text= [NSString stringWithFormat:@"%@ %%",[[savedProductArray valueForKey:@"product_desc"]objectAtIndex:indexPath.row]];
    
    
      UIImageView *ImageMy = (UIImageView *)[cell.contentView viewWithTag:2003];
    
    [ImageMy sd_setImageWithURL:[NSURL URLWithString: [[savedProductArray valueForKey:@"product_image"] objectAtIndex:indexPath.row] ]placeholderImage:[UIImage imageNamed:@"1"] options:SDWebImageRefreshCached];
    
    
        UIButton *BookNowBtn =(UIButton *)[cell.contentView viewWithTag:2004];
        [BookNowBtn addTarget:self
                      action:@selector(BookNowBtnPressed:)
            forControlEvents:UIControlEventTouchUpInside];
    
    
    
    UIButton *SaveBtn =(UIButton *)[cell.contentView viewWithTag:2005];
    [SaveBtn addTarget:self
                   action:@selector(SavevBtnPressed:)
         forControlEvents:UIControlEventTouchUpInside];
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return  cell;
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    LenderProductDetailViewController *homeObj = [storyboard instantiateViewControllerWithIdentifier:@"LenderProductDetailViewController"];
    
    homeObj.ProductDetail = [[savedProductArray valueForKey:@"id"]objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:homeObj animated:YES];
    
    
    
}



-(void)BookNowBtnPressed:(id)sender
{
    
    CGPoint buttonPosition = [sender convertPoint:CGPointZero toView:savedProductTableView];
    NSIndexPath *indexPath = [savedProductTableView indexPathForRowAtPoint:buttonPosition];
    McomLOG(@"like-indexPath--%ld",(long)indexPath.row);
    
   // ProductId = [NSString stringWithFormat:@"%@",[[savedProductArray valueForKey:@"id"]objectAtIndex:indexPath.row]];
    
    
   // [self callSaveProductAPI];
    
    
}



-(void)SavevBtnPressed:(id)sender
{
    
    CGPoint buttonPosition = [sender convertPoint:CGPointZero toView:savedProductTableView];
    NSIndexPath *indexPath = [savedProductTableView indexPathForRowAtPoint:buttonPosition];
    McomLOG(@"like-indexPath--%ld",(long)indexPath.row);
    
    // ProductId = [NSString stringWithFormat:@"%@",[[savedProductArray valueForKey:@"id"]objectAtIndex:indexPath.row]];
    
    
    // [self callSaveProductAPI];
    
    
}




#pragma Product call Save Product  API " which we have to save"
-(void)callSavedProductAPI
{
    
    [Appdelegate startLoader:nil withTitle:@"Loading..."];
    
    NSDictionary* registerInfo = @{
                                   @"access_token":[dict valueForKey:@"access_token"],
                                   };
    
    McomLOG(@"%@",registerInfo);
    [API LenderSavedProductWithInfo:[registerInfo mutableCopy] completionHandler:^(NSDictionary *responseDict,NSError *error)
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
             
             
             
             
             savedProductArray =[[NSMutableArray alloc]initWithArray:responseDict[@"data"]];
             NSLog(@"tabel list Data%@", savedProductArray);
             
             if (savedProductArray.count ==0)
             {
                 UIAlertView*  myAlertView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"No product are Available"  delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
                 
                 [myAlertView show];
                 
             }
             
             [savedProductTableView reloadData];

             
         }
     }];
}


@end
