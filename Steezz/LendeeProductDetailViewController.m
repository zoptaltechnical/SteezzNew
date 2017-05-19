//
//  LendeeProductDetailViewController.m
//  Steezz
//
//  Created by Apple on 10/05/17.
//  Copyright © 2017 Prince. All rights reserved.
//

#import "LendeeProductDetailViewController.h"

@interface LendeeProductDetailViewController ()

@end

@implementation LendeeProductDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    productDetailTextView.placeholderText = @"       Message";
    productDetailTextView.placeholderColor = [UIColor lightGrayColor];
    productDetailTextView.layer.borderWidth = 1;
    productDetailTextView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    productDetailTextView.layer.cornerRadius = 8.0;
    
    // Do any additional setup after loading the view.
}

- (IBAction)landeeBackBtnPressed:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
    
}
- (IBAction)addBtnPressed:(id)sender {
    
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    LendeeAddProductViewController *homeObj = [storyboard instantiateViewControllerWithIdentifier:@"LendeeAddProductViewController"];
    [self.navigationController pushViewController:homeObj animated:YES];
    
    
}

@end
