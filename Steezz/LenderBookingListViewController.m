//
//  LenderBookingListViewController.m
//  Steezz
//
//  Created by Apple on 09/05/17.
//  Copyright © 2017 Prince. All rights reserved.
//

#import "LenderBookingListViewController.h"

@interface LenderBookingListViewController ()

@end

@implementation LenderBookingListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)bookingSettingBtnPressed:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    LenderSettingsViewController *homeObj = [storyboard instantiateViewControllerWithIdentifier:@"LenderSettingsViewController"];
    [self.navigationController pushViewController:homeObj animated:YES];
    
}

- (IBAction)bookingBackBtnPressed:(id)sender {
    
    
    [self.navigationController popViewControllerAnimated:YES];
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
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"BookingListCell"];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"BookingListCell"];
    }
    
    
   
    return  cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{}

@end
