//
//  lenderHomePageViewController.m
//  Steezz
//
//  Created by Apple on 08/05/17.
//  Copyright © 2017 Prince. All rights reserved.
//

#import "lenderHomePageViewController.h"
#import "FTPopOverMenu.h"

@interface lenderHomePageViewController ()<UIGestureRecognizerDelegate>

{
    NSString *ProductId;
    NSString *categoryString;
    
    NSString *categoryID;
    
    NSMutableArray *homeFeedArray;
    
    
    NSDictionary *dict;
    NSMutableArray *categoriesListArray;
    NSMutableArray *categoriesIdArray;
}

@end

@implementation lenderHomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dict=  [[NSUserDefaults standardUserDefaults]objectForKey:@"loginData"];
    NSLog(@"%@ login data = ",dict);
    
    zipcodetextFld.borderStyle = UITextBorderStyleLine;
    zipcodetextFld.layer.borderWidth = 1;
    zipcodetextFld.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    zipcodetextFld.layer.cornerRadius = 8.0;
    
    priceTextFld.borderStyle = UITextBorderStyleLine;
    priceTextFld.layer.borderWidth = 1;
    priceTextFld.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    priceTextFld.layer.cornerRadius = 8.0;
    
    selectDateTxtFld.borderStyle = UITextBorderStyleLine;
    selectDateTxtFld.layer.borderWidth = 1;
    selectDateTxtFld.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    selectDateTxtFld.layer.cornerRadius = 8.0;
    
    selectCategoryBtn.layer.borderWidth = 1;
    selectCategoryBtn.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    selectCategoryBtn.layer.cornerRadius = 8.0;
    [selectCategoryBtn setTitleEdgeInsets:UIEdgeInsetsMake(10.0f, 0.0f, 0.0f, 0.0f)];
    
    searchPopUpView.layer.cornerRadius = 8.0;
     [backgroudView setBackgroundColor:[[UIColor blackColor] colorWithAlphaComponent:0.41]];
    
    
    UITapGestureRecognizer *singleFingerTap =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(handleSingleTap:)];
    singleFingerTap.delegate = self;
    [backgroudView addGestureRecognizer:singleFingerTap];
    

     [self callGetAllCategories];
    
    [self callLendeerHomeFeedAPI];
   
}

- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer
{
    backgroudView.hidden = YES;
    
    [zipcodetextFld resignFirstResponder];
   [priceTextFld resignFirstResponder];
    [selectDateTxtFld resignFirstResponder];
    
    
    
}




- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if ([touch.view isDescendantOfView:searchPopUpView]) {
        
        return NO;
    }
    return YES;
}



- (IBAction)selectCatgoryBtnPressed:(id)sender {
    
    
    NSMutableArray*array=[[NSMutableArray alloc]init];
    
    NSMutableArray *IdsArray = [[NSMutableArray alloc]init];
    
    [array addObjectsFromArray:categoriesListArray ];
    
    [IdsArray addObjectsFromArray:categoriesIdArray ];
    
    [FTPopOverMenuConfiguration defaultConfiguration].menuWidth=110;
    
    [FTPopOverMenu showForSender:sender withMenu:array doneBlock:^(NSInteger selectedIndex) {
        
        categoryString = [NSString stringWithFormat:@"%@",[array objectAtIndex:selectedIndex]];
        
        [selectCategoryBtn setTitle:categoryString forState:UIControlStateNormal];
        
        if ([categoryString isEqualToString:@"All"]) {
            
            categoryID = @"All";
        }
        else
        {
            categoryID = [NSString stringWithFormat:@"%@",[IdsArray objectAtIndex:selectedIndex]];
        }
        
        NSLog(@"3u294509645604 =====%@",categoryID);
        
//        testString = @"0";
//        searchItemValue=1;
//        [menuDataArray removeAllObjects];
//        [self callSearchItemAPI];
    }
                    dismissBlock:^{
                    }];

    
    
}

- (IBAction)searchNowBtnPressed:(id)sender {
    
     backgroudView.hidden = YES;
}





- (IBAction)settingBtnPressed:(id)sender
{
    
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    LenderSettingsViewController *homeObj = [storyboard instantiateViewControllerWithIdentifier:@"LenderSettingsViewController"];
    [self.navigationController pushViewController:homeObj animated:YES];
    
    
}

- (IBAction)filterBtnPressed:(id)sender {
    
    backgroudView.hidden = NO;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return homeFeedArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"LenderHomePageCell"];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LenderHomePageCell"];
    }
    
 
    
    
    
    //    UILabel *titleLabel=(UILabel *)[cell.contentView viewWithTag:20720000];
    //    titleLabel.text= [NSString stringWithFormat:@"%@",[[loyalityProgramArray valueForKey:@"title"]objectAtIndex:indexPath.row]];
    //
    //    UILabel *NumberOfPunches=(UILabel *)[cell.contentView viewWithTag:20720001];
    //    NumberOfPunches.text= [NSString stringWithFormat:@"%@",[[loyalityProgramArray valueForKey:@"punches"]objectAtIndex:indexPath.row]];
    //
    UILabel *Productname=(UILabel *)[cell.contentView viewWithTag:1000];
    Productname.text= [NSString stringWithFormat:@"%@",   [[homeFeedArray valueForKey:@"product_name"]objectAtIndex:indexPath.row]];
    
    UILabel *price=(UILabel *)[cell.contentView viewWithTag:1001];
    price.text= [NSString stringWithFormat:@"%@",   [[homeFeedArray valueForKey:@"product_price"]objectAtIndex:indexPath.row]];
    
    UILabel *location=(UILabel *)[cell.contentView viewWithTag:1002];
    location.text= [NSString stringWithFormat:@"%@",[[homeFeedArray valueForKey:@"location"]objectAtIndex:indexPath.row]];
    
    UIImageView *ImageMy = (UIImageView *)[cell.contentView viewWithTag:1003];
    
    [ImageMy sd_setImageWithURL:[NSURL URLWithString: [[homeFeedArray valueForKey:@"product_image"] objectAtIndex:indexPath.row] ]placeholderImage:[UIImage imageNamed:@"1"] options:SDWebImageRefreshCached];
  
    
    UIButton *SaveBtn =(UIButton *)[cell.contentView viewWithTag:1004];
    [SaveBtn addTarget:self
                        action:@selector(SaveBtnPressed:)
              forControlEvents:UIControlEventTouchUpInside];
    
  
    
    
    
       [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return  cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    LenderProductDetailViewController *homeObj = [storyboard instantiateViewControllerWithIdentifier:@"LenderProductDetailViewController"];
    
       homeObj.ProductDetail = [[homeFeedArray valueForKey:@"id"]objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:homeObj animated:YES];
    
    
    
}


-(void)SaveBtnPressed:(id)sender
{
  
        CGPoint buttonPosition = [sender convertPoint:CGPointZero toView:homeFeedTableView];
        NSIndexPath *indexPath = [homeFeedTableView indexPathForRowAtPoint:buttonPosition];
        McomLOG(@"like-indexPath--%ld",(long)indexPath.row);
        
         ProductId = [NSString stringWithFormat:@"%@",[[homeFeedArray valueForKey:@"id"]objectAtIndex:indexPath.row]];
    
    
    [self callSaveProductAPI];
    
        
    }



#pragma  Category List API
-(void)callGetAllCategories
{
    
    NSDictionary* registerInfo = @{
                                   @"access_token":[dict valueForKey:@"access_token"]
                                   };
    
    McomLOG(@"%@",registerInfo);
    [API getCategoriesList:[registerInfo mutableCopy] completionHandler:^(NSDictionary *responseDict,NSError *error)
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
             NSLog(@"category List  = %@",responseDict);
             
             if ([responseDict[@"data"] count]>0)
             {
                 categoriesListArray =[[NSMutableArray alloc]initWithArray:[responseDict[@"data"] valueForKey:@"cat_name"]];
                 categoriesIdArray =[[NSMutableArray alloc]initWithArray:[responseDict[@"data"] valueForKey:@"id"]];
                 NSLog(@"categories List = %@", categoriesListArray);
                 NSLog(@"categories List = %@", categoriesIdArray);
             }
             
             else
             {
             }
             
         }
     }];
}




#pragma  Lendeer Home Feed List API
-(void)callLendeerHomeFeedAPI
{
    
    [Appdelegate startLoader:nil withTitle:@"Loading..."];
    
    NSDictionary* registerInfo = @{
                                   @"access_token":[dict valueForKey:@"access_token"]
                                   };
    
    McomLOG(@"%@",registerInfo);
    [API LenderHomeFeedWithInfo:[registerInfo mutableCopy] completionHandler:^(NSDictionary *responseDict,NSError *error)
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
             
             NSLog(@"%@", responseDict);
             
             homeFeedArray =[[NSMutableArray alloc]initWithArray:responseDict[@"data"]];
             NSLog(@"tabel list Data%@", homeFeedArray);
             
             if (homeFeedArray.count ==0)
             {
                 UIAlertView*  myAlertView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"No product are Available"  delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
                 
                 [myAlertView show];
                 
             }
             
             [homeFeedTableView reloadData];
             
         }
     }];
}




#pragma Product call Save Product  API " which we have to save"
-(void)callSaveProductAPI
{
    
    [Appdelegate startLoader:nil withTitle:@"Loading..."];
    
    NSDictionary* registerInfo = @{
                                   @"access_token":[dict valueForKey:@"access_token"],
                                   @"product_id":ProductId
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
