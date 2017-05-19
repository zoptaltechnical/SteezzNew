//
//  LenderProductDetailViewController.h
//  Steezz
//
//  Created by Apple on 08/05/17.
//  Copyright © 2017 Prince. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LenderProductDetailViewController : UIViewController
{
    
    
    IBOutlet UIButton *favouriteBtn;
    
    
    
    
    IBOutlet UIButton *detailBackBtn;
    
    IBOutlet UIButton *usernameBtn;
    
    
    IBOutlet UIButton *settingBtn;
    
    IBOutlet UILabel *date;
    
    
    IBOutlet UIImageView *productImage;
    
    
    IBOutlet UILabel *price;
    
    IBOutlet UILabel *categoryName;
    
    IBOutlet UITextView *descriptionTextView;
    
    IBOutlet UILabel *location;
    
    
    IBOutlet UIImageView *userImage;
    
    
}


@property(nonatomic,strong) NSString * ProductDetail;

@end
