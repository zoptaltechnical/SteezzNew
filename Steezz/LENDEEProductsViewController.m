//
//  LENDEEProductsViewController.m
//  Steezz
//
//  Created by Apple on 10/05/17.
//  Copyright © 2017 Prince. All rights reserved.
//

#import "LENDEEProductsViewController.h"

@interface LENDEEProductsViewController ()

@end

@implementation LENDEEProductsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    messageTxtView.placeholderText = @"       Message";
//    messageTxtView.placeholderColor = [UIColor lightGrayColor];
//    messageTxtView.layer.borderWidth = 1;
//    messageTxtView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
//    messageTxtView.layer.cornerRadius = 8.0;
    
    
    // Do any additional setup after loading the view.
}

- (IBAction)productAddBtnPressed:(id)sender {
    
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    LendeeAddProductViewController *homeObj = [storyboard instantiateViewControllerWithIdentifier:@"LendeeAddProductViewController"];
    [self.navigationController pushViewController:homeObj animated:YES];

    
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"LendeeProductCell"];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LendeeProductCell"];
    }
    
    
    
    return  cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    LendeeProductDetailViewController *homeObj = [storyboard instantiateViewControllerWithIdentifier:@"LendeeProductDetailViewController"];
    [self.navigationController pushViewController:homeObj animated:YES];



}

@end
