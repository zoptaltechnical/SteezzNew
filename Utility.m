//
//  Utility.m
//  H2O_happiness
//
//  Created by Eshan cheema on 10/18/14.
//  Copyright (c) 2014 Eshan cheema. All rights reserved.
//

#import "Utility.h"

@implementation  Utility+(Utility *)sharedManager
{
    static Utility *sharedInstance = nil;
    static dispatch_once_t onceQueue;
    dispatch_once(&onceQueue, ^{
        sharedInstance = [[Utility alloc] init];
    });
    return sharedInstance;
}
+(NSString *)checkForNull:(id)value
{
    NSString *str=@"";
    if([value isEqual:[NSNull null]]|| value==nil)
    {
        str=@"";
    }
    else
        str=(NSString *)value;
    return str;
}

+(UIBarButtonItem *)leftbar:(UIImage *)image :(UIViewController *)viewController
{
    UIButton *buttonLeft = [[ UIButton alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
    [buttonLeft setImage:image forState:UIControlStateNormal];
    [buttonLeft addTarget:viewController action:@selector(leftButtonAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *left = [[ UIBarButtonItem alloc] initWithCustomView:buttonLeft];
    return left;
}
-(void)leftButtonAction
{
    
}
+(UIBarButtonItem *)rightbar:(NSString *)String :(UIViewController *)viewController
{
    UIButton *buttonRight = [[ UIButton alloc] initWithFrame:CGRectMake(230,0, 50, 25)];
    buttonRight.titleLabel.font = UIFontWithNameAndSize(@"MYRIADPRO-BOLD",20.0f);
    [buttonRight setTitle:String forState:UIControlStateNormal];
    [buttonRight addTarget:viewController action:@selector(rightButtonAction) forControlEvents:UIControlEventTouchUpInside];
    buttonRight.titleLabel.font = [UIFont boldSystemFontOfSize:15];
    UIBarButtonItem *left = [[ UIBarButtonItem alloc] initWithCustomView:buttonRight];
    return left;
}
-(void)rightButtonAction
{
    
}


+(NSString *) valueForKey:(NSString *) key {
    if ([UserDefaults valueForKey:key]) {
        NSString * value = [UserDefaults valueForKey:key];
        return value;
    }
    return nil;
}

// ********  trial  ************//
+(id)objectForKey:(NSString *)key
{
    if ([UserDefaults objectForKey:key]) {
        NSString * value = [UserDefaults objectForKey:key];
        return value;
    }
    return nil;
}
+(void) setValue:(id)value forKey:(NSString *)key {
    
    [UserDefaults setValue:value forKey:key];
    [UserDefaults synchronize];
}

+(void) setObject:(id)object forKey:(NSString *)key
{
    [UserDefaults setObject:object forKey:key];
    [UserDefaults synchronize];
    
}

+(void) showAlertWithTitleText:(NSString *)text messageText:(NSString *)messageText  delegate:(id)AlertDelegate OKButtonText:(NSString *)OKText CancelButtonText:(NSString *)CancelText {
 }

+(void) showAlertWithTitleText:(NSString *)text messageText:(NSString *)messageText  delegate:(id)AlertDelegate OKButtonText:(NSString *)OKText CancelButtonText:(NSString *)CancelText tag:(int)tag {
        UIAlertView *altVW = [[UIAlertView alloc] initWithTitle:text message:messageText delegate:AlertDelegate cancelButtonTitle:OKText otherButtonTitles:CancelText, nil];
    altVW.tag = tag;
    [altVW show];
}

+(void) showAlertWithTitleText:(NSString *)text messageText:(NSString *)messageText  delegate:(id)AlertDelegate {
    
    UIAlertView *altVW = [[UIAlertView alloc] initWithTitle:text message:messageText delegate:AlertDelegate cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [altVW show];
}

+(void) showAlertWithTitleText:(NSString *)text messageText:(NSString *)messageText  delegate:(id)AlertDelegate tag:(int)tag {
    UIAlertView *altVW = [[UIAlertView alloc] initWithTitle:text message:messageText delegate:AlertDelegate cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    altVW.tag = tag;
    [altVW show];
}

+(void)animateTextField:(UIView*)view up:(BOOL)up withDistance:(int)movementDistance
{
    float movementDuration=0.0;
    movementDuration = 0.3f;
    int movement = (up ? movementDistance : -movementDistance);
    [UIView beginAnimations: @"animateTextField" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    view.frame = CGRectOffset(view.frame, 0, movement);
    [UIView commitAnimations];
}

+(UIImage*)imageWithEditImage:(UIImage*)image andWidth:(CGFloat)width andHeight:(CGFloat)height
{
    UIGraphicsBeginImageContext( CGSizeMake(width, height));
    [image drawInRect:CGRectMake(0,0,width,height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

+ (BOOL) NSStringIsValidEmail:(NSString *)checkString
{
    BOOL stricterFilter = YES;
    NSString *stricterFilterString = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSString *laxString = @".+@.+\\.[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}
+ (BOOL) NSStringIsValidMobile:(NSString *)checkString
{
    BOOL stricterFilter = YES;
    NSString *stricterFilterString = @"[A-Za-z.%+-]+[0-9]{0,4}";
    NSString *laxString = @".+\\[0-9]{4}[0-9]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
   // NSLog(@"email text %hhd",[emailTest evaluateWithObject:checkString]);
    return [emailTest evaluateWithObject:checkString];
}

+ (BOOL) NSStringIsValidName:(NSString *)checkString
{
    BOOL stricterFilter = YES;
    NSString *stricterFilterString = @"[A-Za-z.%+-]+[0-9]{0,0}";
    NSString *laxString = @".+\\[0-9]{0}[0-9]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
  //  NSLog(@"email text %hhd",[emailTest evaluateWithObject:checkString]);
    return [emailTest evaluateWithObject:checkString];
}

+(void)addHorizontalPadding:(NSMutableArray *)textFieldArray
{
    for(UITextField *textField in textFieldArray){
        UIView *spacerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 25, 30)];
        [textField setLeftViewMode:UITextFieldViewModeAlways];
        [textField setLeftView:spacerView];
    }
}
+(void)addHorizontalPaddingMore:(NSMutableArray *)textFieldArray
{
    for(UITextField *textField in textFieldArray){
        UIView *spacerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 30)];
        [textField setLeftViewMode:UITextFieldViewModeAlways];
        [textField setLeftView:spacerView];
    }
}
+(void)addHorizontalPaddingLessExtra:(NSMutableArray *)textFieldArray
{
    for(UITextField *textField in textFieldArray){
        UIView *spacerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 30)];
        [textField setLeftViewMode:UITextFieldViewModeAlways];
        [textField setLeftView:spacerView];
    }
}


+(UITabBarItem*)tabBarItemWithImage:(UIImage*)image
                      selectedImage:(UIImage*)selectedImage
{
    UITabBarItem* item = [[UITabBarItem alloc] initWithTitle:@""
                                                       image:image
                                               selectedImage:selectedImage];
    item.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
    return item;
}
+ (NSString *)relativeDateStringForDate:(NSString *)date
{
    
    
     NSLog(@"date %@",date);
     NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
     [dateFormat setDateFormat:@"dd-MM-yyyy HH:mm:ss"];
     NSDate *datetwo = [dateFormat dateFromString:date];
//     [dateFormat setDateFormat:@"dd-MMM-yyyy HH:mm:ss"];
    [dateFormat setTimeZone:[NSTimeZone timeZoneWithName:@"UTC"]];
    
    
    NSCalendarUnit units = NSCalendarUnitYear | NSCalendarUnitMonth |  NSCalendarUnitDay;
    
//    NSCalendarUnit units = NSCalendarUnitYear | NSCalendarUnitMonth |  NSCalendarUnitDay|
//    NSMonthCalendarUnit | NSYearCalendarUnit;
    
   // NSCalendarUnit units = NSMinuteCalendarUnit|NSHourCalendarUnit|NSDayCalendarUnit | NSWeekOfYearCalendarUnit ;
    
    NSDateComponents *components = [[NSCalendar currentCalendar] components:units
                                                                   fromDate:datetwo
                                                                     toDate:[NSDate date]
                                                                    options:0];
    if (components.year > 0) {
        return [NSString stringWithFormat:@"%ld years ago", (long)components.year];
    }
    else if (components.month > 0)
    {
        return [NSString stringWithFormat:@"%ld months ago", (long)components.month];
    }
    else if (components.weekOfYear > 0)
    {
        return [NSString stringWithFormat:@"%ld weeks ago", (long)components.weekOfYear];
    }
    else if (components.day > 0)
    {
        if (components.day>1) {
            return [NSString stringWithFormat:@"%ld days ago", (long)components.day];
        }
        else  {
            return [NSString stringWithFormat:@"%ld day ago", (long)components.day];
        }
    }
    else if(components.hour > 0)
    {
        if (components.hour >1)
        {
            return [NSString stringWithFormat:@"%ld hours ago",(long)components.hour];
        }
        else
        {
            return [NSString stringWithFormat:@"%ld hour ago",(long)components.hour];
        }
        
    }
    else if(components.minute>0)
    {
        return [NSString stringWithFormat:@"%ld minutes ago",(long)components.minute];
    }
    else
    {
        return @"Just now";
    }
}

+(NSString *)timetofill:(NSString *)date
{
    NSLog(@"date %@",date);
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"dd-MM-yyyy"]; // HH:mm:ss
    NSDate *datetwo = [dateFormat dateFromString:date];
    [dateFormat setDateFormat:@"dd-MMM-yyyy"];
    NSString *formatted_time = [ dateFormat stringFromDate:datetwo];
    NSLog(@"Today's Date and Time: %@", formatted_time );
    return formatted_time;
}

+(void)callNoNetworkAlert
{
   
    [Utility showAlertWithTitleText:@"Network error" messageText:@"Please check your internet connection." delegate:nil];

}

+(void)callNoNetworkAlert1
{
   [Utility showAlertWithTitleText:@"Network error" messageText:@"You cannot change your profile when no network." delegate:nil];
        
}

+(CGSize)calculateSizeOfText:(NSString*)text font:(UIFont*)font width:(NSInteger)width
{
    
    CGSize maximumLabelSize = CGSizeMake(width, 99999.0f);
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] init];
    NSDictionary *attributes = @{NSFontAttributeName : font};
    [attributedString appendAttributedString:[[NSAttributedString alloc] initWithString:text attributes:attributes]];
    CGRect expectedLabelSize = [attributedString boundingRectWithSize:maximumLabelSize options:NSStringDrawingUsesLineFragmentOrigin  context:nil];
    
    return expectedLabelSize.size;
}




@end
