//
//  Utility.h
//  H2O_happiness
//
//  Created by Eshan cheema on 10/18/14.
//  Copyright (c) 2014 Eshan cheema. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"


@interface Utility : NSObject
+(Utility *) sharedManager;

+(void)showAlertWithTitleText:(NSString *)text messageText:(NSString *)messageText  delegate:(id)AlertDelegate tag:(int)tag;
+(void) showAlertWithTitleText:(NSString *)text messageText:(NSString *)messageText  delegate:(id)AlertDelegate ;
+(void) showAlertWithTitleText:(NSString *)text messageText:(NSString *)messageText  delegate:(id)AlertDelegate OKButtonText:(NSString *)OKText CancelButtonText:(NSString *)CancelText tag:(int)tag;
+(void) showAlertWithTitleText:(NSString *)text messageText:(NSString *)messageText  delegate:(id)AlertDelegate OKButtonText:(NSString *)OKText CancelButtonText:(NSString *)CancelText;
+(UIImage*)imageWithEditImage:(UIImage*)image andWidth:(CGFloat)width andHeight:(CGFloat)height;
+(void)animateTextField:(UIView*)view up:(BOOL)up withDistance:(int)movementDistance;

+ (BOOL) NSStringIsValidEmail:(NSString *)checkString;
+ (BOOL) NSStringIsValidMobile:(NSString *)checkString;
+ (BOOL) NSStringIsValidName:(NSString *)checkString;
+(void)addHorizontalPadding:(NSMutableArray *)textFieldArray;
+(void)addHorizontalPaddingMore:(NSMutableArray *)textFieldArray;
+(void)addHorizontalPaddingLessExtra:(NSMutableArray *)textFieldArray;
+ (NSString *) valueForKey:(NSString *) key;
+ (void) setValue:(id)value forKey:(NSString *)key;
+(void) setObject:(id)object forKey:(NSString *)key;
+(NSString *)checkForNull:(id)value;
+(UIBarButtonItem *)leftbar:(UIImage *)image :(UIViewController *)viewController ;
+(UIBarButtonItem *)rightbar:(NSString *)String :(UIViewController *)viewController;
+(NSString *)relativeDateStringForDate:(NSDate *)date;
+(void)callNoNetworkAlert;
+(CGSize)calculateSizeOfText:(NSString*)text font:(UIFont*)font width:(NSInteger)width;
+(void)callNoNetworkAlert1;
+(NSString *)timetofill:(NSString *)date;

// ********  trial  ************//
+(id)objectForKey:(NSString *)key;

@property(nonatomic,assign)int internetworking;

@end
