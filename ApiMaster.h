//
//  ApiMaster.h
//  
//
//  Created by Eshan cheema on 11/3/14.
//  Copyright (c) 2014 Eshan cheema. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Utility.h"
#import "Constants.h"

typedef void (^APICompletionHandler)(NSDictionary* responseDict,NSError *error);

@interface ApiMaster : NSObject


+(ApiMaster*)singleton;


-(void)FaceBookSignInWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;


-(void)signUpUserWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;


-(void)signInUserWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;


-(void)ForgotPasswrodWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;


-(void)myProfileWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;


-(void)UpdateProfileWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;


-(void)LenderHomeFeedWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;


-(void)getCategoriesList:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;

-(void)AddProductWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;




-(void)LogoutWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;


-(void)HomePageWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;

-(void)ProductDetailWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;

-(void)SaveProductWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;

-(void)LenderSavedProductWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;


-(void)SwitchToLenderWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;

-(void)LenderSupportWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;

-(void)LenderFeedbackWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;






















































-(void)tabelListWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;




-(void)NotificationWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;

-(void)DeleteItemWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;


-(void)UpdateItemToCartWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;

-(void)BookaTableWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;


-(void)LoyalityProgramWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;


-(void)ListOfCoupansWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;


-(void)MyEarnedCoupansWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;


-(void)GetDeliveryAddressWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;

-(void)AddDeliveryAddressWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;


-(void)GetDeliveryOrderDetailWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;

-(void)MyPunchesAPIWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;

-(void)RedeemCodeWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;

-(void)CouponCodeAPIWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;

-(void)RemoveCouponCodeAPIWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;


-(void)paypalPaymentSucessWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;

-(void)OrderHistoryWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;

-(void)ScanCodeWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;

-(void)ItemDetailWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;


-(void)RedeemCouponWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;

-(void)TableDetailWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;



-(void)DetailOrderHistoryWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;

-(void)GetDeliveryStatusWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;







-(void)HomePageAdvertismentInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;

-(void)myCartInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;

-(void)DeleteCartItem:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;

-(void)changePasswordWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;

-(void)EditProfileWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;

-(void)AddToCartWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;


-(void)LogoutUserWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;


-(void)AddProductWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;
-(void)EditProductWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;


-(void)AddEventWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;
-(void)EditEventWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;
-(void)DeleteEventWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;


-(void)SearchItemWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;
-(void)SearchItemProductDetailWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;
-(void)SearchItemEventDetailWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;
-(void)SearchItemServiceDetailWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;






-(void)FollowWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;
-(void)MessageWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;

-(void)LikeUnlikeWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;

-(void)AllMessagesWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;
-(void)MessagesDetailWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;

-(void)TimeLineWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;


-(void)ProductDetailWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;
-(void)EventDetailWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;



-(void)ServiceDetailWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;
//-(void)SearchItem:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;

-(void)FriendsWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;
-(void)ViewProfileWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;
-(void)CommentWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;
-(void)CommentListWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;

-(void)DeleteComment:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;





@end
