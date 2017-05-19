//
//  lenderConditionlReportViewController.m
//  Steezz
//
//  Created by Apple on 08/05/17.
//  Copyright © 2017 Prince. All rights reserved.
//

#import "lenderConditionlReportViewController.h"

@interface lenderConditionlReportViewController ()

@end

@implementation lenderConditionlReportViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //
    // Do any additional setup after loading the view.
}

- (IBAction)startReportBtnPressed:(id)sender {
    
     
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    lenderStartReportViewController *homeObj = [storyboard instantiateViewControllerWithIdentifier:@"lenderStartReportViewController"];
    [self.navigationController pushViewController:homeObj animated:YES];
    

    
    
}


- (IBAction)endReportBtnPressed:(id)sender {
    
    
}

- (IBAction)conditionSettingBtnPressed:(id)sender {
    
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    LenderSettingsViewController *homeObj = [storyboard instantiateViewControllerWithIdentifier:@"LenderSettingsViewController"];
    [self.navigationController pushViewController:homeObj animated:YES];
    
    
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
