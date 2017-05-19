//
//  ApiMaster.m
//
//  Created by Eshan cheema on 11/3/14.
//  Copyright (c) 2014 Eshan cheema. All rights reserved.
//

#import "ApiMaster.h"
#import "UIAlertView+Blocks.h"

typedef void (^APICompletionHandler)(NSDictionary* responseDict,NSError *error);


@implementation ApiMaster


static ApiMaster* singleton = nil;

+(ApiMaster*)singleton
{
    if(singleton == nil)
        singleton = [[self alloc] init];
    return singleton;
}
-(id)init
{
    if(self = [super init])
    {
    }
    return self;
}


-(void)FaceBookSignInWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler
{
    
    NSString* infoStr = [NSString stringWithFormat:@"name=%@&email=%@&address=%@&latitude=%@&longitude=%@&device_token=%@&device_type=%@&fb_id=%@",userInfo [@"name"],userInfo[@"email"],userInfo[@"address"],userInfo [@"longitude"],userInfo[@"latitude"],userInfo[@"device_token"],userInfo[@"device_type"],userInfo[@"fb_id"]];
    
    
    McomLOG(@"infostr :%@",infoStr);
    NSString *url=[[NSString stringWithFormat:@"%@facebook_register",WebURl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"that is the url -->%@",url);
    
    
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url] ];
    [request setHTTPBody:[infoStr dataUsingEncoding:NSUTF8StringEncoding]];
    [request setTimeoutInterval:540];
    
    NSLog(@" request at sign up%@",request);
    [self forwardRequest1:request showActivity:YES completionHandler:handler];
    
    
}


-(void)GooglePlusSignInWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler
{
    
    
    NSString* infoStr = [NSString stringWithFormat:@"name=%@&email=%@&address=%@&latitude=%@&longitude=%@&device_token=%@&device_type=%@&g_id=%@",userInfo [@"name"],userInfo[@"email"],userInfo[@"address"],userInfo [@"longitude"],userInfo[@"latitude"],userInfo[@"device_token"],userInfo[@"device_type"],userInfo[@"g_id"]];
    
    
    McomLOG(@"infostr :%@",infoStr);
    NSString *url=[[NSString stringWithFormat:@"%@google_register",WebURl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"that is the url -->%@",url);
    
    
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url] ];
    [request setHTTPBody:[infoStr dataUsingEncoding:NSUTF8StringEncoding]];
    [request setTimeoutInterval:540];
    
    NSLog(@" request at sign up%@",request);
    [self forwardRequest1:request showActivity:YES completionHandler:handler];

    
    
    
    
}



# pragma mark - Register user API
-(void)getCategoriesList:(NSMutableDictionary*)userInfo
        completionHandler:(APICompletionHandler)handler
{

    NSString* infoStr = [NSString stringWithFormat:@"access_token=%@",userInfo[@"access_token"]];
    NSLog(@"infoStr AT LOGIN %@",infoStr);
    
    NSString *url=[[NSString stringWithFormat:@"%@get_categories",WebURl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"that is URL -->%@",url);
    
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    
    [request setHTTPBody:[infoStr dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSLog(@"Category Request URL %@",request);
    
    
    [request setTimeoutInterval:540];
    [self forwardRequest1:request showActivity:YES completionHandler:handler];
}


-(void)siderImagesWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler
{
    
    NSString *url=[[NSString stringWithFormat:@"%@slider",WebURl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url] ];
    [request setTimeoutInterval:540];
    
    NSLog(@" request at sign up%@",request);
    [self forwardGetServive:request showActivity:YES completionHandler:handler];

 
}


# pragma mark - Register user API
-(void)signUpUserWithInfo:(NSMutableDictionary*)userInfo
          completionHandler:(APICompletionHandler)handler
{
    
     NSString* infoStr = [NSString stringWithFormat:@"first_name=%@&last_name=%@&email=%@&phone=%@&address=%@&about_user=%@&username=%@&password=%@&device_token=%@&device_type=%@&cpassword=%@&location=%@",userInfo [@"first_name"],userInfo[@"last_name"],userInfo [@"email"],userInfo[@"phone"],userInfo [@"address"],userInfo [@"about_user"],userInfo [@"username"],userInfo[@"password"],userInfo[@"device_token"],userInfo[@"device_type"],userInfo[@"cpassword"],userInfo[@"location"]];
    
    
    McomLOG(@"infostr :%@",infoStr);
    
    NSString *url=[[NSString stringWithFormat:@"%@register",WebURl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"that is the url -->%@",url);
    
    
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url] ];
    [request setHTTPBody:[infoStr dataUsingEncoding:NSUTF8StringEncoding]];
    [request setTimeoutInterval:540];
    
    NSLog(@" request at sign up%@",request);
    [self forwardRequest1:request showActivity:YES completionHandler:handler];
}


# pragma mark - Login user API
-(void)signInUserWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler
{

    NSString* infoStr = [NSString stringWithFormat:@"username=%@&password=%@&device_token=%@&device_type=%@",userInfo[@"username"], userInfo[@"password"],userInfo[@"device_token"] ,userInfo [@"device_type"]];
    NSLog(@"infoStr AT LOGIN %@",infoStr);
    
        NSString *url=[[NSString stringWithFormat:@"%@login",WebURl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"that is URL -->%@",url);
    
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    
    [request setHTTPBody:[infoStr dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSLog(@"REQUEST AT LOGIN %@",request);
    
    
    [request setTimeoutInterval:540];
    [self forwardRequest1:request showActivity:YES completionHandler:handler];
}

# pragma mark - Forgot Password API

-(void)ForgotPasswrodWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler

{
    //   http://workmeappit.com/test/home/forgot_password
    
    NSString* infoStr = [NSString stringWithFormat:@"email=%@",userInfo[@"email"]];
        NSLog(@"%@",infoStr);
    NSString *url=[[NSString stringWithFormat:@"%@forgot_password",WebURl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPBody:[infoStr dataUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"Request At Frogot %@",request);
    [request setTimeoutInterval:540];
    [self forwardRequest1:request showActivity:YES completionHandler:handler];
}







-(void)HomePageWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler

{
  
    NSString* infoStr = [NSString stringWithFormat:@"category=%@&search=%@&page_no=%@&no_of_post=%@",userInfo[@"category"], userInfo[@"search"],userInfo[@"page_no"] ,userInfo [@"no_of_post"]];
    NSLog(@"infoStr AT LOGIN %@",infoStr);
    
    NSString *url=[[NSString stringWithFormat:@"%@menu_data",WebURl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"that is URL -->%@",url);
    
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    
    [request setHTTPBody:[infoStr dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSLog(@"REQUEST AT LOGIN %@",request);
    
    
    [request setTimeoutInterval:540];
    [self forwardRequest1:request showActivity:YES completionHandler:handler];
    
}

-(void)myProfileWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler

{
     NSString* infoStr = [NSString stringWithFormat:@"access_token=%@",userInfo[@"access_token"]];
        NSLog(@"%@",infoStr);
     NSString *url=[[NSString stringWithFormat:@"%@profile_data",WebURl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPBody:[infoStr dataUsingEncoding:NSUTF8StringEncoding]];
     NSLog(@"Request At profile %@",request);
    [request setTimeoutInterval:540];
    [self forwardRequest1:request showActivity:YES completionHandler:handler];
    
}


-(void)UpdateProfileWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler
{
    
    NSString* infoStr = [NSString stringWithFormat:@"access_token=%@&device_token=%@&device_type=%@&first_name=%@&last_name=%@&email=%@&phone=%@&location=%@&address=%@&about_user=%@&username=%@&profile_pic=%@",userInfo[@"access_token"],userInfo[@"device_token"],userInfo[@"device_type"],userInfo[@"first_name"],userInfo[@"last_name"],userInfo[@"email"],userInfo[@"phone"],userInfo[@"location"],userInfo[@"address"],userInfo[@"about_user"],userInfo[@"username"],userInfo[@"profile_pic"]];
    NSLog(@"%@",infoStr);
    NSString *url=[[NSString stringWithFormat:@"%@update_profile",WebURl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPBody:[infoStr dataUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"Request At profile %@",request);
    [request setTimeoutInterval:540];
    [self forwardRequest1:request showActivity:YES completionHandler:handler];

    
}


-(void)AddProductWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler
{
    
    NSString* infoStr = [NSString stringWithFormat:@"cat_id=%@&product_name=%@&product_desc=%@&location=%@&available_date=%@&is_available=%@&access_token=%@&product_image=%@&price=%@",userInfo[@"cat_id"],userInfo[@"product_name"],userInfo[@"product_desc"],userInfo[@"location"],userInfo[@"available_date"],userInfo[@"is_available"],userInfo[@"access_token"],userInfo[@"product_image"],userInfo[@"price"]];
    NSLog(@"%@",infoStr);
    NSString *url=[[NSString stringWithFormat:@"%@add_product",WebURl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPBody:[infoStr dataUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"Request At profile %@",request);
    [request setTimeoutInterval:540];
    [self forwardRequest1:request showActivity:YES completionHandler:handler];

    
    
    
    
}



-(void)LenderHomeFeedWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler
{
    
    NSString* infoStr = [NSString stringWithFormat:@"access_token=%@" ,userInfo [@"access_token"]];
    
    NSLog(@"%@",infoStr);
    NSString *url=[[NSString stringWithFormat:@"%@listing_feeds",WebURl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPBody:[infoStr dataUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"Request At Lender Home Feed %@",request);
    [request setTimeoutInterval:540];
    [self forwardRequest1:request showActivity:YES completionHandler:handler];
    
    
}






-(void)LogoutWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler

{
    NSString* infoStr = [NSString stringWithFormat:@"access_token=%@",userInfo[@"access_token"]];
    NSLog(@"%@",infoStr);
    NSString *url=[[NSString stringWithFormat:@"%@logout",WebURl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPBody:[infoStr dataUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"Request At Logout %@",request);
    [request setTimeoutInterval:540];
    [self forwardRequest1:request showActivity:YES completionHandler:handler];
    
}





-(void)changePasswordWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler
{
    NSString* infoStr = [NSString stringWithFormat:@"old_password=%@&password=%@&cpassword=%@&access_token=%@",userInfo[@"old_password"],userInfo[@"password"],userInfo[@"cpassword"] ,userInfo[@"access_token"]];
    NSLog(@"%@",infoStr);
    NSString *url=[[NSString stringWithFormat:@"%@change_password",WebURl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPBody:[infoStr dataUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"Request At Change Password %@",request);
    [request setTimeoutInterval:540];
    [self forwardRequest1:request showActivity:YES completionHandler:handler];
    
}

-(void)ProductDetailWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler
{
    
    
    NSString* infoStr = [NSString stringWithFormat:@"product_id=%@&access_token=%@",userInfo[@"product_id"],userInfo[@"access_token"]];
    NSLog(@"%@",infoStr);
    NSString *url=[[NSString stringWithFormat:@"%@product_details",WebURl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPBody:[infoStr dataUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"Request At Product Detail %@",request);
    [request setTimeoutInterval:540];
    [self forwardRequest1:request showActivity:YES completionHandler:handler];
    
    
}



-(void)SaveProductWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler
{
    
    
    NSString* infoStr = [NSString stringWithFormat:@"product_id=%@&access_token=%@",userInfo[@"product_id"],userInfo[@"access_token"]];
    NSLog(@"%@",infoStr);
    NSString *url=[[NSString stringWithFormat:@"%@save_product",WebURl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPBody:[infoStr dataUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"Request At save product %@",request);
    [request setTimeoutInterval:540];
    [self forwardRequest1:request showActivity:YES completionHandler:handler];
    

    
}


-(void)LenderSavedProductWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler
{
    NSString* infoStr = [NSString stringWithFormat:@"access_token=%@",userInfo[@"access_token"]];
    NSLog(@"%@",infoStr);
    NSString *url=[[NSString stringWithFormat:@"%@saved_products",WebURl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPBody:[infoStr dataUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"Request At saved Product %@",request);
    [request setTimeoutInterval:540];
    [self forwardRequest1:request showActivity:YES completionHandler:handler];
    
}


-(void)SwitchToLenderWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler
{
    
    NSString* infoStr = [NSString stringWithFormat:@"user_type=%@&access_token=%@",userInfo[@"user_type"],userInfo[@"access_token"]];
    NSLog(@"%@",infoStr);
    NSString *url=[[NSString stringWithFormat:@"%@switch_to",WebURl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPBody:[infoStr dataUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"Request At switch to lender %@",request);
    [request setTimeoutInterval:540];
    [self forwardRequest1:request showActivity:YES completionHandler:handler];
    

    
    
}

-(void)LenderSupportWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler
{
    
    
    NSString* infoStr = [NSString stringWithFormat:@"name=%@&email=%@&message=%@&access_token=%@",userInfo[@"name"],userInfo[@"email"],userInfo[@"message"] ,userInfo[@"access_token"]];
    NSLog(@"%@",infoStr);
    NSString *url=[[NSString stringWithFormat:@"%@support",WebURl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPBody:[infoStr dataUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"Request At support lender %@",request);
    [request setTimeoutInterval:540];
    [self forwardRequest1:request showActivity:YES completionHandler:handler];

    
    
}


-(void)LenderFeedbackWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler
{
    
    NSString* infoStr = [NSString stringWithFormat:@"rate=%@&message=%@&access_token=%@",userInfo[@"rate"],userInfo[@"message"] ,userInfo[@"access_token"]];
    NSLog(@"%@",infoStr);
    NSString *url=[[NSString stringWithFormat:@"%@send_feedback",WebURl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPBody:[infoStr dataUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"Request At support lender %@",request);
    [request setTimeoutInterval:540];
    [self forwardRequest1:request showActivity:YES completionHandler:handler];
    
    
}

































-(void)tabelListWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler
{
    NSString* infoStr = [NSString stringWithFormat:@"no_of_post=%@&page_no=%@",userInfo[@"no_of_post"],userInfo[@"page_no"]];
    NSLog(@"%@",infoStr);
    NSString *url=[[NSString stringWithFormat:@"%@tables_list",WebURl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPBody:[infoStr dataUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"Request At Frogot %@",request);
    [request setTimeoutInterval:540];
    [self forwardRequest1:request showActivity:YES completionHandler:handler];
}

-(void)myCartInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler

{
    NSString* infoStr = [NSString stringWithFormat:@"access_token=%@" ,userInfo[@"access_token"]];
    NSLog(@"%@",infoStr);
    NSString *url=[[NSString stringWithFormat:@"%@my_cart",WebURl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPBody:[infoStr dataUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"Requestto My Cart List %@",request);
    [request setTimeoutInterval:540];
    [self forwardRequest1:request showActivity:YES completionHandler:handler];
    
}

-(void)DeleteItemWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler
{
    NSString* infoStr = [NSString stringWithFormat:@"access_token=%@&cart_id=%@" ,userInfo [@"access_token"],userInfo[@"cart_id"]];
    NSLog(@"%@",infoStr);
    NSString *url=[[NSString stringWithFormat:@"%@remove_item_from_cart",WebURl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPBody:[infoStr dataUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"Request At Frogot %@",request);
    [request setTimeoutInterval:540];
    [self forwardRequest1:request showActivity:YES completionHandler:handler];
    
}



-(void)UpdateItemToCartWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler
{
    NSString* infoStr = [NSString stringWithFormat:@"access_token=%@&product_id=%@&qty=%@&cart_id=%@" ,userInfo [@"access_token"],userInfo[@"product_id"],userInfo[@"qty"],userInfo[@"cart_id"]];
    NSLog(@"%@",infoStr);
    NSString *url=[[NSString stringWithFormat:@"%@update_item_into_cart",WebURl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPBody:[infoStr dataUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"Request At Frogot %@",request);
    [request setTimeoutInterval:540];
    [self forwardRequest1:request showActivity:YES completionHandler:handler];
    
}


-(void)BookaTableWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler
{
    
    
    NSString* infoStr = [NSString stringWithFormat:@"name=%@&email=%@&phone=%@&discription=%@&no_of_people=%@&table_id=%@&access_token=%@&booking_date=%@&booking_time=%@" ,userInfo [@"name"],userInfo[@"email"],userInfo [@"phone"],userInfo[@"discription"],userInfo [@"no_of_people"],userInfo [@"table_id"],userInfo [@"access_token"],userInfo[@"booking_date"], userInfo[@"booking_time"]];
    
    
    McomLOG(@"infostr :%@",infoStr);
    NSString *url=[[NSString stringWithFormat:@"%@book_a_table",WebURl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"that is the url -->%@",url);
    
    
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url] ];
    [request setHTTPBody:[infoStr dataUsingEncoding:NSUTF8StringEncoding]];
    [request setTimeoutInterval:540];
    
    NSLog(@" request at sign up%@",request);
    [self forwardRequest1:request showActivity:YES completionHandler:handler];

    
}


-(void)LoyalityProgramWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler
{
    
    NSString* infoStr = [NSString stringWithFormat:@"page_no=%@&no_of_post=%@" ,userInfo [@"page_no"],userInfo [@"no_of_post"]];
    
    NSLog(@"%@",infoStr);
    NSString *url=[[NSString stringWithFormat:@"%@list_loyalty_programs",WebURl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPBody:[infoStr dataUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"Request At Frogot %@",request);
    [request setTimeoutInterval:540];
    [self forwardRequest1:request showActivity:YES completionHandler:handler];    
    
    
}


-(void)ListOfCoupansWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler
{
    NSString* infoStr = [NSString stringWithFormat:@"page_no=%@&no_of_post=%@&access_token=%@&latitude=%@&longitude=%@" ,userInfo [@"page_no"],userInfo [@"no_of_post"],userInfo[@"access_token"],userInfo[@"longitude"],userInfo[@"latitude"]];
    
    NSLog(@"%@",infoStr);
    NSString *url=[[NSString stringWithFormat:@"%@list_of_cuopans",WebURl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPBody:[infoStr dataUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"Request At Frogot %@",request);
    [request setTimeoutInterval:540];
    [self forwardRequest1:request showActivity:YES completionHandler:handler];

    
}

-(void)MyEarnedCoupansWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler
{
    
    NSString* infoStr = [NSString stringWithFormat:@"page_no=%@&no_of_post=%@&access_token=%@" ,userInfo [@"page_no"],userInfo [@"no_of_post"],userInfo[@"access_token"]];
    
    NSLog(@"%@",infoStr);
    NSString *url=[[NSString stringWithFormat:@"%@earned_cuopans",WebURl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPBody:[infoStr dataUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"Request At Frogot %@",request);
    [request setTimeoutInterval:540];
    [self forwardRequest1:request showActivity:YES completionHandler:handler];

    
}



-(void)GetDeliveryAddressWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler
{
    
    NSString* infoStr = [NSString stringWithFormat:@"access_token=%@" ,userInfo [@"access_token"]];
    
    NSLog(@"%@",infoStr);
    NSString *url=[[NSString stringWithFormat:@"%@get_delivery_address",WebURl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPBody:[infoStr dataUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"Request At Frogot %@",request);
    [request setTimeoutInterval:540];
    [self forwardRequest1:request showActivity:YES completionHandler:handler];

    
    
    
}




-(void)AddDeliveryAddressWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler
{
    
    
    NSString* infoStr = [NSString stringWithFormat:@"name=%@&email=%@&phone=%@&zip_code=%@&address=%@&access_token=%@" ,userInfo [@"name"],userInfo[@"email"],userInfo [@"phone"],userInfo[@"zip_code"],userInfo [@"address"],userInfo [@"access_token"]];
    
    McomLOG(@"infostr :%@",infoStr);
    NSString *url=[[NSString stringWithFormat:@"%@add_delivery_address",WebURl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"that is the url -->%@",url);
    
    
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url] ];
    [request setHTTPBody:[infoStr dataUsingEncoding:NSUTF8StringEncoding]];
    [request setTimeoutInterval:540];
    
    NSLog(@" request at sign up%@",request);
    [self forwardRequest1:request showActivity:YES completionHandler:handler];

    
    
    
}


-(void)MyPunchesAPIWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler
{
    
    NSString* infoStr = [NSString stringWithFormat:@"access_token=%@&id=%@",userInfo [@"access_token"],userInfo[@"id"]];
    
    McomLOG(@"infostr :%@",infoStr);
    NSString *url=[[NSString stringWithFormat:@"%@my_punches",WebURl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"that is the url -->%@",url);
    
    
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url] ];
    [request setHTTPBody:[infoStr dataUsingEncoding:NSUTF8StringEncoding]];
    [request setTimeoutInterval:540];
    
    NSLog(@" request at sign up%@",request);
    [self forwardRequest1:request showActivity:YES completionHandler:handler];

      
}




-(void)RedeemCodeWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler
{
    
    NSString* infoStr = [NSString stringWithFormat:@"code_id=%@&access_token=%@" ,userInfo [@"code_id"],userInfo [@"access_token"]];
    
    McomLOG(@"infostr :%@",infoStr);
    NSString *url=[[NSString stringWithFormat:@"%@redeem_punches",WebURl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"that is the url -->%@",url);
    
    
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url] ];
    [request setHTTPBody:[infoStr dataUsingEncoding:NSUTF8StringEncoding]];
    [request setTimeoutInterval:540];
    
    NSLog(@" request at sign up%@",request);
    [self forwardRequest1:request showActivity:YES completionHandler:handler];
    
    
    
    
}






-(void)CouponCodeAPIWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler
{
    
    
    NSString* infoStr = [NSString stringWithFormat:@"uniq=%@&code=%@&total_amt=%@&access_token=%@" ,userInfo [@"uniq"],userInfo[@"code"],userInfo [@"total_amt"],userInfo [@"access_token"]];
    
    McomLOG(@"infostr :%@",infoStr);
    NSString *url=[[NSString stringWithFormat:@"%@apply_cuppon_code",WebURl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"that is the url -->%@",url);
    
    
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url] ];
    [request setHTTPBody:[infoStr dataUsingEncoding:NSUTF8StringEncoding]];
    [request setTimeoutInterval:540];
    
    NSLog(@" request at sign up%@",request);
    [self forwardRequest1:request showActivity:YES completionHandler:handler];
 
}


-(void)ContactUsWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler
{
    
    
    NSString *url=[[NSString stringWithFormat:@"%@restaurant_details",WebURl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url] ];
    [request setTimeoutInterval:540];
    
    NSLog(@" resturent Api Request %@",request);
    [self forwardGetServive:request showActivity:YES completionHandler:handler];


}










-(void)resturentLinkWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler
{
    
    NSString *url=[[NSString stringWithFormat:@"%@restaurant_links",WebURl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url] ];
    [request setTimeoutInterval:540];
    
    NSLog(@" resturent Api Request %@",request);
    [self forwardGetServive:request showActivity:YES completionHandler:handler];

    
    
}


-(void)paypalPaymentSucessWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler
{
    
    
    NSString* infoStr = [NSString stringWithFormat:@"uniq=%@&create_time=%@&txn_id=%@&delivery_charges=%@&grand_total=%@&access_token=%@&order_type=%@" ,userInfo [@"uniq"],userInfo[@"create_time"],userInfo [@"txn_id"],userInfo[@"delivery_charges"],userInfo [@"grand_total"],userInfo [@"access_token"],userInfo[@"order_type"]];
    
    McomLOG(@"infostr :%@",infoStr);
    NSString *url=[[NSString stringWithFormat:@"%@payment_success",WebURl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"that is the url -->%@",url);
    
    
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url] ];
    [request setHTTPBody:[infoStr dataUsingEncoding:NSUTF8StringEncoding]];
    [request setTimeoutInterval:540];
    
    NSLog(@" request at sign up%@",request);
    [self forwardRequest1:request showActivity:YES completionHandler:handler];

    
    
    
    
}


-(void)OrderHistoryWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler
{
    
    NSString* infoStr = [NSString stringWithFormat:@"access_token=%@" ,userInfo [@"access_token"]];
    
    McomLOG(@"infostr :%@",infoStr);
    NSString *url=[[NSString stringWithFormat:@"%@order_history",WebURl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"that is the url -->%@",url);
    
    
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url] ];
    [request setHTTPBody:[infoStr dataUsingEncoding:NSUTF8StringEncoding]];
    [request setTimeoutInterval:540];
    
    NSLog(@" request at sign up%@",request);
    [self forwardRequest1:request showActivity:YES completionHandler:handler];

    
    
}



-(void)DetailOrderHistoryWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler
{
    
    NSString* infoStr = [NSString stringWithFormat:@"access_token=%@&order_id=%@" ,userInfo [@"access_token"],userInfo[@"order_id"]];
    
    McomLOG(@"infostr :%@",infoStr);
    NSString *url=[[NSString stringWithFormat:@"%@order_history_details",WebURl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"that is the url -->%@",url);
    
    
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url] ];
    [request setHTTPBody:[infoStr dataUsingEncoding:NSUTF8StringEncoding]];
    [request setTimeoutInterval:540];
    
    NSLog(@" request at sign up%@",request);
    [self forwardRequest1:request showActivity:YES completionHandler:handler];

    
    
    
    
}




-(void)ScanCodeWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler
{
    
    
    NSString* infoStr = [NSString stringWithFormat:@"code=%@&access_token=%@" ,userInfo [@"code"],userInfo [@"access_token"]];
    
    McomLOG(@"infostr :%@",infoStr);
    NSString *url=[[NSString stringWithFormat:@"%@scan_qrcode",WebURl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"that is the url -->%@",url);
    
    
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url] ];
    [request setHTTPBody:[infoStr dataUsingEncoding:NSUTF8StringEncoding]];
    [request setTimeoutInterval:540];
    
    NSLog(@" request at sign up%@",request);
    [self forwardRequest1:request showActivity:YES completionHandler:handler];
    
    
    // image
    
    
    
}



-(void)ItemDetailWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler
{
    
    NSString* infoStr = [NSString stringWithFormat:@"id=%@" ,userInfo [@"id"]];
    
    McomLOG(@"infostr :%@",infoStr);
    NSString *url=[[NSString stringWithFormat:@"%@product_details",WebURl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"that is the url -->%@",url);
    
    
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url] ];
    [request setHTTPBody:[infoStr dataUsingEncoding:NSUTF8StringEncoding]];
    [request setTimeoutInterval:540];
    
    NSLog(@" request at sign up%@",request);
    [self forwardRequest1:request showActivity:YES completionHandler:handler];
    

    
    
    
}



-(void)GetDeliveryOrderDetailWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler
{
    
    
    NSString* infoStr = [NSString stringWithFormat:@"access_token=%@" ,userInfo [@"access_token"]];
    
    NSLog(@"%@",infoStr);
    NSString *url=[[NSString stringWithFormat:@"%@getdelivery_order_details",WebURl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPBody:[infoStr dataUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"Request At Frogot %@",request);
    [request setTimeoutInterval:540];
    [self forwardRequest1:request showActivity:YES completionHandler:handler];
    
    
}


-(void)RedeemCouponWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler
{
    
    
    NSString* infoStr = [NSString stringWithFormat:@"code_id=%@&access_token=%@&type=%@" ,userInfo [@"code_id"],userInfo [@"access_token"],userInfo[@"type"]];
    
    McomLOG(@"infostr :%@",infoStr);
    NSString *url=[[NSString stringWithFormat:@"%@redeem_cuopan",WebURl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"that is the url -->%@",url);
    
    
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url] ];
    [request setHTTPBody:[infoStr dataUsingEncoding:NSUTF8StringEncoding]];
    [request setTimeoutInterval:540];
    
    NSLog(@" request at sign up%@",request);
    [self forwardRequest1:request showActivity:YES completionHandler:handler];
    

    
    
}


-(void)TableDetailWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler
{
    
    
    NSString* infoStr = [NSString stringWithFormat:@"id=%@" ,userInfo [@"id"]];
    
    McomLOG(@"infostr :%@",infoStr);
    NSString *url=[[NSString stringWithFormat:@"%@tables_details",WebURl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"that is the url -->%@",url);
    
    
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url] ];
    [request setHTTPBody:[infoStr dataUsingEncoding:NSUTF8StringEncoding]];
    [request setTimeoutInterval:540];
    
    NSLog(@" request at sign up%@",request);
    [self forwardRequest1:request showActivity:YES completionHandler:handler];
    
    
    
    
}




-(void)GetDeliveryStatusWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler
{
    
    NSString *url=[[NSString stringWithFormat:@"%@get_delivery_status",WebURl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url] ];
    [request setTimeoutInterval:540];
    
    NSLog(@" request at sign up%@",request);
    [self forwardGetServive:request showActivity:YES completionHandler:handler];
    
    
}




-(void)NotificationWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler
{
    
    NSString* infoStr = [NSString stringWithFormat:@"access_token=%@" ,userInfo [@"access_token"]];
    
    McomLOG(@"infostr :%@",infoStr);
    NSString *url=[[NSString stringWithFormat:@"%@notification_center",WebURl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"that is the url -->%@",url);
    
    
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url] ];
    [request setHTTPBody:[infoStr dataUsingEncoding:NSUTF8StringEncoding]];
    [request setTimeoutInterval:540];
    
    NSLog(@" request at sign up%@",request);
    [self forwardRequest1:request showActivity:YES completionHandler:handler];
    
    
  }































-(void)EditProductWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler{
    
    NSString* infoStr = [NSString stringWithFormat:@"id=%@&name=%@&description=%@&tags=%@&price=%@&location=%@&url=%@&userfile=%@&user_id=%@&access_token=%@" ,userInfo [@"id"],userInfo [@"name"],userInfo[@"description"],userInfo [@"tags"],userInfo[@"price"],userInfo [@"location"],userInfo[@"url"],userInfo [@"userfile"],userInfo [@"user_id"],userInfo[@"access_token"]];
    
    NSLog(@"%@",infoStr);
    NSString *url=[[NSString stringWithFormat:@"%@edit_product",WebURl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPBody:[infoStr dataUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"Request At Frogot %@",request);
    [request setTimeoutInterval:540];
    [self forwardRequest1:request showActivity:YES completionHandler:handler];
}


-(void)DeleteEventWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler
{
    NSString* infoStr = [NSString stringWithFormat:@"user_id=%@&id=%@" ,userInfo [@"user_id"],userInfo[@"id"]];
    
    NSLog(@"%@",infoStr);
    NSString *url=[[NSString stringWithFormat:@"%@delete_event",WebURl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPBody:[infoStr dataUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"Request At Frogot %@",request);
    [request setTimeoutInterval:540];
    [self forwardRequest1:request showActivity:YES completionHandler:handler];
}

-(void)DeleteServiceWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler


{
    NSString* infoStr = [NSString stringWithFormat:@"user_id=%@&id=%@" ,userInfo [@"user_id"],userInfo[@"id"]];
    
    NSLog(@"%@",infoStr);
    NSString *url=[[NSString stringWithFormat:@"%@delete_service",WebURl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPBody:[infoStr dataUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"Request At Frogot %@",request);
    [request setTimeoutInterval:540];
    [self forwardRequest1:request showActivity:YES completionHandler:handler];\
}

-(void)AddEventWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler

{
    NSString* infoStr = [NSString stringWithFormat:@"name=%@&description=%@&tags=%@&price=%@&location=%@&userfile=%@&user_id=%@&access_token=%@&start_date=%@&start_time=%@&end_date=%@&end_time=%@" ,userInfo [@"name"],userInfo[@"description"],userInfo [@"tags"],userInfo[@"price"],userInfo [@"location"],userInfo [@"userfile"],userInfo [@"user_id"],userInfo[@"access_token"],userInfo[@"start_date"],userInfo [@"start_time"],userInfo [@"end_date"],userInfo [@"end_time"]];
    NSLog(@"%@",infoStr);
    NSString *url=[[NSString stringWithFormat:@"%@add_event",WebURl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPBody:[infoStr dataUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"Request At Frogot %@",request);
    [request setTimeoutInterval:540];
    [self forwardRequest1:request showActivity:YES completionHandler:handler];
}

-(void)AddServiceWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler


{
    NSString* infoStr = [NSString stringWithFormat:@"name=%@&description=%@&tags=%@&price=%@&location=%@&url=%@&userfile=%@&user_id=%@&access_token=%@" ,userInfo [@"name"],userInfo[@"description"],userInfo [@"tags"],userInfo[@"price"],userInfo [@"location"],userInfo[@"url"],userInfo [@"userfile"],userInfo [@"user_id"],userInfo[@"access_token"]];
    NSLog(@"%@",infoStr);
    NSString *url=[[NSString stringWithFormat:@"%@add_service",WebURl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPBody:[infoStr dataUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"Request At Frogot %@",request);
    [request setTimeoutInterval:540];
    [self forwardRequest1:request showActivity:YES completionHandler:handler];
}


-(void)EditServiceWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler

{
    NSString* infoStr = [NSString stringWithFormat:@"id=%@&name=%@&description=%@&tags=%@&price=%@&location=%@&url=%@&userfile=%@&user_id=%@&access_token=%@" ,userInfo [@"id"],userInfo [@"name"],userInfo[@"description"],userInfo [@"tags"],userInfo[@"price"],userInfo [@"location"],userInfo[@"url"],userInfo [@"userfile"],userInfo [@"user_id"],userInfo[@"access_token"]];
    NSLog(@"%@",infoStr);
    NSString *url=[[NSString stringWithFormat:@"%@edit_service",WebURl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPBody:[infoStr dataUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"Request At Frogot %@",request);
    [request setTimeoutInterval:540];
    [self forwardRequest1:request showActivity:YES completionHandler:handler];
}

-(void)FollowWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler

{
    NSString* infoStr = [NSString stringWithFormat:@"user_id=%@&follow_to=%@&status=%@" ,userInfo [@"user_id"],userInfo[@"follow_to"],userInfo [@"status"]];
    NSLog(@"%@",infoStr);
    NSString *url=[[NSString stringWithFormat:@"%@follow_unfollow",WebURl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPBody:[infoStr dataUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"Request At Frogot %@",request);
    [request setTimeoutInterval:540];
    [self forwardRequest1:request showActivity:YES completionHandler:handler];
}





-(void)TimeLineWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler

{
    NSString* infoStr = [NSString stringWithFormat:@"user_id=%@&access_token=%@" ,userInfo [@"user_id"],userInfo[@"access_token"]];
    NSLog(@"%@",infoStr);
    NSString *url=[[NSString stringWithFormat:@"%@timeline",WebURl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPBody:[infoStr dataUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"Request At Frogot %@",request);
    [request setTimeoutInterval:540];
    [self forwardRequest1:request showActivity:YES completionHandler:handler];
}



-(void)EventDetailWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler

{
    NSString* infoStr = [NSString stringWithFormat:@"id=%@" ,userInfo [@"id"]];
    NSLog(@"%@",infoStr);
    NSString *url=[[NSString stringWithFormat:@"%@event_detail",WebURl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPBody:[infoStr dataUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"Request At Frogot %@",request);
    [request setTimeoutInterval:540];
    [self forwardRequest1:request showActivity:YES completionHandler:handler];
}

-(void)EditEventWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler

{
    
    NSString* infoStr = [NSString stringWithFormat:@"id=%@&name=%@&description=%@&tags=%@&price=%@&location=%@&start_date=%@&userfile=%@&user_id=%@&access_token=%@&start_time=%@&end_date=%@&end_time=%@" ,userInfo [@"id"], userInfo [@"name"],userInfo[@"description"],userInfo [@"tags"],userInfo[@"price"],userInfo [@"location"],userInfo[@"start_date"],userInfo [@"userfile"],userInfo [@"user_id"],userInfo[@"access_token"],userInfo [@"start_time"],userInfo[@"end_date"],userInfo [@"end_time"]];
    
    NSLog(@"%@",infoStr);
    NSString *url=[[NSString stringWithFormat:@"%@edit_event",WebURl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPBody:[infoStr dataUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"Request At Frogot %@",request);
    [request setTimeoutInterval:540];
    [self forwardRequest1:request showActivity:YES completionHandler:handler];
    
}

-(void)ServiceDetailWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler

{
    NSString* infoStr = [NSString stringWithFormat:@"id=%@" ,userInfo [@"id"]];
    NSLog(@"%@",infoStr);
    NSString *url=[[NSString stringWithFormat:@"%@service_detail",WebURl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPBody:[infoStr dataUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"Request At Frogot %@",request);
    [request setTimeoutInterval:540];
    [self forwardRequest1:request showActivity:YES completionHandler:handler];
}

-(void)SearchItemWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler

{
    NSString* infoStr = [NSString stringWithFormat:@"filter_type=%@&search_text=%@&latitude=%@&longitude=%@&type=%@&user_id=%@&page_number=%@",userInfo [@"filter_type"],userInfo[@"search_text"],userInfo[@"latitude"],userInfo[@"longitude"],userInfo[@"type"],userInfo[@"user_id"],userInfo[@"page_number"]];
    NSLog(@"%@",infoStr);
    
    NSCharacterSet *set = [NSCharacterSet URLQueryAllowedCharacterSet];
    NSString *url=[[NSString stringWithFormat:@"%@search_item",WebURl] stringByAddingPercentEncodingWithAllowedCharacters:set];
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPBody:[infoStr dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSLog(@"Request At Frogot %@",request);
    [request setTimeoutInterval:540];
    [self forwardRequest1:request showActivity:YES completionHandler:handler];
}

-(void)SearchItemProductDetailWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler
{
    NSString* infoStr = [NSString stringWithFormat:@"id=%@&user_id=%@&type=%@" ,userInfo [@"id"],userInfo [@"user_id"],userInfo [@"type"]];
    NSLog(@"%@",infoStr);
    NSString *url=[[NSString stringWithFormat:@"%@search_item_detail",WebURl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPBody:[infoStr dataUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"Request At Frogot %@",request);
    [request setTimeoutInterval:540];
    [self forwardRequest1:request showActivity:YES completionHandler:handler];
    
}

-(void)SearchItemEventDetailWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler
{
   
    NSString* infoStr = [NSString stringWithFormat:@"id=%@&user_id=%@&type=%@" ,userInfo [@"id"],userInfo [@"user_id"],userInfo [@"type"]];
    NSLog(@"%@",infoStr);
    NSString *url=[[NSString stringWithFormat:@"%@search_item_detail",WebURl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPBody:[infoStr dataUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"Request At Frogot %@",request);
    [request setTimeoutInterval:540];
    [self forwardRequest1:request showActivity:YES completionHandler:handler];
    
}
-(void)SearchItemServiceDetailWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler
{
    NSString* infoStr = [NSString stringWithFormat:@"id=%@&user_id=%@&type=%@" ,userInfo [@"id"],userInfo [@"user_id"],userInfo [@"type"]];
    NSLog(@"%@",infoStr);
    NSString *url=[[NSString stringWithFormat:@"%@search_item_detail",WebURl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPBody:[infoStr dataUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"Request At Frogot %@",request);
    [request setTimeoutInterval:540];
    [self forwardRequest1:request showActivity:YES completionHandler:handler];
}


-(void)AddToCartWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler
{
    NSString* infoStr = [NSString stringWithFormat:@"access_token=%@&product_id=%@&qty=%@" ,userInfo [@"access_token"],userInfo [@"product_id"],userInfo [@"qty"]];
    NSLog(@"%@",infoStr);
    NSString *url=[[NSString stringWithFormat:@"%@add_to_cart",WebURl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPBody:[infoStr dataUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"Request At Frogot %@",request);
    [request setTimeoutInterval:540];
    [self forwardRequest1:request showActivity:YES completionHandler:handler];

}


-(void)LikeUnlikeWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler

{
    NSString* infoStr = [NSString stringWithFormat:@"item_id=%@&user_id=%@&type=%@&status=%@",userInfo [@"item_id"],userInfo[@"user_id"],userInfo[@"type"],userInfo[@"status"]];
    NSCharacterSet *set = [NSCharacterSet URLQueryAllowedCharacterSet];
    NSString *url=[[NSString stringWithFormat:@"%@like_unlike",WebURl] stringByAddingPercentEncodingWithAllowedCharacters:set];
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPBody:[infoStr dataUsingEncoding:NSUTF8StringEncoding]];
    [request setTimeoutInterval:540];
    [self forwardRequest:request showActivity:YES completionHandler:handler];
}

-(void)HomePageAdvertismentInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler
{
    NSString* infoStr = [NSString stringWithFormat:@"type=%@",userInfo [@"type"]];
    NSCharacterSet *set = [NSCharacterSet URLQueryAllowedCharacterSet];
    NSString *url=[[NSString stringWithFormat:@"%@advert",WebURl] stringByAddingPercentEncodingWithAllowedCharacters:set];
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPBody:[infoStr dataUsingEncoding:NSUTF8StringEncoding]];
    [request setTimeoutInterval:540];
    [self forwardRequest:request showActivity:YES completionHandler:handler];
}

-(void)ShowCartInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler
{
    NSString* infoStr = [NSString stringWithFormat:@"user_id=%@&access_token=%@",userInfo [@"user_id"], userInfo [@"access_token"]];
    NSCharacterSet *set = [NSCharacterSet URLQueryAllowedCharacterSet];
    NSString *url=[[NSString stringWithFormat:@"%@show_cart",WebURl] stringByAddingPercentEncodingWithAllowedCharacters:set];
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPBody:[infoStr dataUsingEncoding:NSUTF8StringEncoding]];
    [request setTimeoutInterval:540];
    [self forwardRequest:request showActivity:YES completionHandler:handler];
}
-(void)DeleteCartItem:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler
{
    NSString* infoStr = [NSString stringWithFormat:@"user_id=%@&access_token=%@&item_id=%@",userInfo [@"user_id"], userInfo[@"access_token"],userInfo [@"item_id"]];
    NSLog(@"%@",infoStr);
    NSCharacterSet *set = [NSCharacterSet URLQueryAllowedCharacterSet];
    NSString *url=[[NSString stringWithFormat:@"%@delete_cart",WebURl] stringByAddingPercentEncodingWithAllowedCharacters:set];
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPBody:[infoStr dataUsingEncoding:NSUTF8StringEncoding]];
    [request setTimeoutInterval:540];
    NSLog(@"%@",request);
    [self forwardRequest:request showActivity:YES completionHandler:handler];
}
-(void)CommentWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler
{
    
    NSString* infoStr = [NSString stringWithFormat:@"user_id=%@&type=%@&item_id=%@&comment=%@",userInfo [@"user_id"], userInfo[@"type"],userInfo [@"item_id"],userInfo [@"comment"]];
    NSLog(@"%@",infoStr);
    NSCharacterSet *set = [NSCharacterSet URLQueryAllowedCharacterSet];
    NSString *url=[[NSString stringWithFormat:@"%@comments",WebURl] stringByAddingPercentEncodingWithAllowedCharacters:set];
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPBody:[infoStr dataUsingEncoding:NSUTF8StringEncoding]];
    [request setTimeoutInterval:540];
    NSLog(@"%@",request);
    [self forwardRequest:request showActivity:YES completionHandler:handler];
}

-(void)CommentListWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler
{
    
    NSString* infoStr = [NSString stringWithFormat:@"type=%@&id=%@", userInfo[@"type"],userInfo [@"id"]];
    NSLog(@"%@",infoStr);
    NSCharacterSet *set = [NSCharacterSet URLQueryAllowedCharacterSet];
    NSString *url=[[NSString stringWithFormat:@"%@comment_list",WebURl] stringByAddingPercentEncodingWithAllowedCharacters:set];
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPBody:[infoStr dataUsingEncoding:NSUTF8StringEncoding]];
    [request setTimeoutInterval:540];
    NSLog(@"%@",request);
    [self forwardRequest1:request showActivity:YES completionHandler:handler];
}

-(void)DeleteComment:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler
{
    
    NSString* infoStr = [NSString stringWithFormat:@"id=%@", userInfo [@"id"]];
    NSLog(@"%@",infoStr);
    NSCharacterSet *set = [NSCharacterSet URLQueryAllowedCharacterSet];
    NSString *url=[[NSString stringWithFormat:@"%@delete_comment",WebURl] stringByAddingPercentEncodingWithAllowedCharacters:set];
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPBody:[infoStr dataUsingEncoding:NSUTF8StringEncoding]];
    [request setTimeoutInterval:540];
     NSLog(@"%@",request);
    [self forwardRequest:request showActivity:YES completionHandler:handler];
}

#pragma mark request to Server
-(void)forwardRequest:(NSMutableURLRequest*)request showActivity:(BOOL)showActivity

    completionHandler:(APICompletionHandler)handler
{
    [request addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPMethod:@"POST"];
  
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:
     ^(NSURLResponse* response, NSData* data, NSError* connectionError)
     {
         if(connectionError != nil)
         {
             
             [[[UIAlertView alloc] initWithTitle:@"Connection Error !" message:@"No Internet Connection" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil] show];
             return;
         }
         McomLOG(@"Response String %@", NSStringFromNSData(data));
         if(handler != nil)
             handler(JSONObjectFromData(data),connectionError);
     }];
}
#pragma mark request1 to Server
-(void)forwardRequest1:(NSMutableURLRequest*)request showActivity:(BOOL)showActivity
    completionHandler:(APICompletionHandler)handler
{
    [request addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPMethod:@"POST"];
   
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:
     ^(NSURLResponse* response, NSData* data, NSError* connectionError)
     {
         if(connectionError != nil)
         {
             
             [[[UIAlertView alloc] initWithTitle:@"Connection Error !" message:@"No Internet Connection" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil] show];
             
            
             
            [Appdelegate stopLoader:nil];
             
              return;
         }
         McomLOG(@"Response String %@", NSStringFromNSData(data));
         if(handler != nil)
             handler(JSONObjectFromData(data),connectionError);
     }];
}

#pragma mark request1 to Server
-(void)forwardGetServive:(NSMutableURLRequest*)request showActivity:(BOOL)showActivity
     completionHandler:(APICompletionHandler)handler
{
    [request addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPMethod:@"GET"];
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:
     ^(NSURLResponse* response, NSData* data, NSError* connectionError)
     {
         if(connectionError != nil)
         {
             [[[UIAlertView alloc] initWithTitle:@"Connection Error !" message:@"No Internet Connection" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil] show];
             return;
         }
         McomLOG(@"Response String %@", NSStringFromNSData(data));
         if(handler != nil)
             handler(JSONObjectFromData(data),connectionError);
     }];
}

@end
