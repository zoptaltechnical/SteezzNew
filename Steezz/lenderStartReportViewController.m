//
//  lenderStartReportViewController.m
//  Steezz
//
//  Created by Apple on 08/05/17.
//  Copyright © 2017 Prince. All rights reserved.
//

#import "lenderStartReportViewController.h"

@interface lenderStartReportViewController ()

@end

@implementation lenderStartReportViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    startReportTextView.placeholderText = @"       Description";
    startReportTextView.placeholderColor = [UIColor lightGrayColor];
    
    
    selectCategoryBtn.layer.borderWidth = 1;
    selectCategoryBtn.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    selectCategoryBtn.layer.cornerRadius = 8.0;
    
    startReportTextView.layer.borderWidth = 1;
    startReportTextView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    startReportTextView.layer.cornerRadius = 8.0;
    
    // Do any additional setup after loading the view.
}

- (IBAction)startReportBackBtnPressed:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (IBAction)startReportSettingBtnPressed:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    LenderSettingsViewController *homeObj = [storyboard instantiateViewControllerWithIdentifier:@"LenderSettingsViewController"];
    [self.navigationController pushViewController:homeObj animated:YES];
    
}




- (IBAction)selectCategoryBtnPressed:(id)sender {
    
    
}


@end
