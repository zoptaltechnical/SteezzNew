//
//  AppDelegate.h
//  Steezz
//
//  Created by Apple on 05/05/17.
//  Copyright © 2017 Prince. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GMDCircleLoader.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
-(void)startLoader:(UIView*)view withTitle:(NSString*)message;
- (void)stopLoader:(UIView*)view;

@end

