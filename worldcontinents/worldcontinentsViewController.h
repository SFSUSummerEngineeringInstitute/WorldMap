//
//  worldcontinentsViewController.h
//  worldcontinents
//
//  Created by Student on 7/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContinentView.h"
@class InfoView;

@interface worldcontinentsViewController : UIViewController <ContinentViewDelegate> {
    
    ContinentView *northAmerica;
    ContinentView *southAmerica;
    ContinentView *europe;
    ContinentView *africa;
    ContinentView *asia;
    ContinentView *australia;
    ContinentView *antartica;
    
    InfoView *infoView;
    
}


@property (nonatomic, retain) IBOutlet ContinentView *northAmerica;
@property (nonatomic, retain) IBOutlet ContinentView *southAmerica;
@property (nonatomic, retain) IBOutlet ContinentView *europe;
@property (nonatomic, retain) IBOutlet ContinentView *africa;
@property (nonatomic, retain) IBOutlet ContinentView *asia;
@property (nonatomic, retain) IBOutlet ContinentView *australia;
@property (nonatomic, retain) IBOutlet ContinentView *antartica;
@property (nonatomic, retain) IBOutlet InfoView *infoView;

-(IBAction)restartgame: (id)sender;

@end
