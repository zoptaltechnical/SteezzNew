//
//  LenderSettingsViewController.h
//  Steezz
//
//  Created by Apple on 09/05/17.
//  Copyright © 2017 Prince. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LenderSettingsViewController : UIViewController
{
    
    IBOutlet UIButton *lenderLogoutBtn;
    
    
    IBOutlet UIImageView *lenderProfilePic;
    
    IBOutlet UIButton *lenderSettingBackBtn;
    
    
    IBOutlet UILabel *lenderName;
    
    IBOutlet UITableView *lenderSettingtableView;
    
}

@end
