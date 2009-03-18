//
//  LuckyNumbersAppDelegate.h
//  LuckyNumbers
//
//  Created by Dan Grigsby on 3/18/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LuckyNumbersViewController;

@interface LuckyNumbersAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    LuckyNumbersViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet LuckyNumbersViewController *viewController;

@end

