//
//  LendeeDashBoardViewController.m
//  Steezz
//
//  Created by Apple on 10/05/17.
//  Copyright © 2017 Prince. All rights reserved.
//

#import "LendeeDashBoardViewController.h"

@interface LendeeDashBoardViewController ()
{
    
    NSMutableArray *array;
    NSMutableArray *imagesArray;
    
}

@end

@implementation LendeeDashBoardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    array = [[NSMutableArray alloc] initWithObjects:@"Today",
                             @"26,may,2017",
                             nil];
    
    imagesArray = [[NSMutableArray alloc] initWithObjects:@"date_icon-2",
             @"date_icon-1",
             nil];
    // Do any additional setup after loading the view.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    if (section==0)
    {
        return 5;
    }
    else{
        return 8;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"DashBoardCell"];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DashBoardCell"];
    }
    

    return  cell;
}

-(CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
        return 45;
   
}

//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
//    return [array objectAtIndex:section];
//}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *tempView=[[UIView alloc]initWithFrame:CGRectMake(0,0,300,44)];
   
    
    tempView.backgroundColor = [UIColor clearColor];
    UILabel *tempLabel=[[UILabel alloc]initWithFrame:CGRectMake(45,10,300,44)];
    tempLabel.backgroundColor=[UIColor clearColor];
//    tempLabel.shadowColor = [UIColor blackColor];
//    tempLabel.shadowOffset = CGSizeMake(0,2);
     //here you can change the text color of header.
    tempLabel.font = [UIFont fontWithName:@"Helvetica" size:12];
    tempLabel.font = [UIFont boldSystemFontOfSize:12];
    tempLabel.text=[array objectAtIndex:section];
    
    [tempView addSubview:tempLabel];

    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[imagesArray objectAtIndex:section]]];
    imageView.frame = CGRectMake(20,23,18,18);
    
     [tempView addSubview:imageView];
    if (section ==0) {
        
        tempLabel.textColor = [UIColor redColor];
    }
    
    else
    {
        tempLabel.textColor = [UIColor lightGrayColor];
    }
    
    return tempView;
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{}

@end
