//
//  worldcontinentsAppDelegate.h
//  worldcontinents
//
//  Created by Student on 7/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class worldcontinentsViewController;

@interface worldcontinentsAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet worldcontinentsViewController *viewController;

@end
