//   
//  Constants.h
//  H2O_happiness
//
//  Created by Eshan cheema on 10/18/14.
//  Copyright (c) 2014 Eshan cheema. All rights reserved.
//
#import "AppDelegate.h"



#ifndef H2O_happiness_Constants_h
#define H2O_happiness_Constants_h

#define WindowFrame  [[UIScreen mainScreen] bounds]
#define ScreenHeight WindowFrame.size.height

#define StoryBoard [ UIStoryboard storyboardWithName:@"Main" bundle:nil]
#define ViewControllerIdentifier(i) [ StoryBoard instantiateViewControllerWithIdentifier:i]

#define ColorWithRGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#define fontNameAndSize [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, nil]

#define UIFontWithNameAndSize(n,s) [UIFont fontWithName:n size:s];

#define FontNameWithSize(Name,Size) [NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:Name size:Size], NSFontAttributeName, [UIColor whiteColor], NSForegroundColorAttributeName, nil]


#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)


#define API          [ApiMaster singleton]
#define Application  [UIApplication sharedApplication]
#define Appdelegate        ((AppDelegate*)[Application delegate])

#define UserDefaults [NSUserDefaults standardUserDefaults]


#ifndef Language_Changer_Constants_h
#define Language_Changer_Constants_h

// NSUserDefaults keys
#define DEFAULTS_KEY_LANGUAGE_CODE @"LanguageCode" // The key against which to store the selected language code.

/*
 * Custom localised string macro, functioning in a similar way to the standard NSLocalisedString().
 */
#define CustomLocalisedString(key, comment) \
[[LanguageManager sharedLanguageManager] getTranslationForKey:key]

#endif



#define userID1   @"userID"
#define userIDCheck   @"userIDCheck"
#define userLoginData   @"userLoginData"
#define userData     @"userData"
#define access_token @"access_token"
#define friend_access_token @"friend_access_token"
#define usrProfileData @"usrProfileData"
#define DeviceToken @"DeviceToken"
#define termAOrB @"termAOrB"
#define callNotification @"callNotification"
#define current_package   @"current_package"
#define otherUserImageArray @"otherUserImageArray"
#define hideButton @"hideButton"
#define sentNoAdd @"sentNoAdd"
#define languageString @"languageString"
#define throughPushYes @"throughPushYes"
#define pushArray @"pushArray"
#define languageStringArabOrEnglish @"languageStringArabOrEnglish"
#define requestedPakage @"requestedPakage"
#define notifcationText @"notificationText"
#define kNetworkAlert   @"No network available"


#define WebURl @"http://workmeappit.com/steezz/home/"



#define UtilManager  [Utility singleton]
#define iOSVersion   [[[UIDevice currentDevice] systemVersion] floatValue]
#define FontWithGillSansMTStdLightFont(s) [UIFont fontWithName:@"Helvetica" size:s]
#define FontWithGillSansMTStdMediumFont(s) [UIFont fontWithName:@"Helvetica" size:s]
#define FontWithGillSansMTStdBoldFont(s) [UIFont fontWithName:@"Helvetica" size:s]


#define JSONObjectFromData(d) [NSJSONSerialization JSONObjectWithData:data options:0 error:nil]

#define NSStringFromNSData(d) [[NSString alloc] initWithBytes:[d bytes] length:[d length] encoding:NSUTF8StringEncoding]

#define NslogEnabled YES
#ifndef McomLOG
#define McomLOG(format, ...) if(NslogEnabled) NSLog(format, ##__VA_ARGS__)
#endif

#define NslogEnabled YES
#ifndef NSLog
#define NSLog(format, ...) if(NslogEnabled) NSLog(format, ##__VA_ARGS__)
#endif
#endif
