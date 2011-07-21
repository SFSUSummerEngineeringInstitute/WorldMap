//
//  InfoView.h
//  worldcontinents
//
//  Created by Student on 7/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ContinentView;

@interface InfoView : UIView {
    UILabel *titleLabel;
    UITextView *factLabel;
    
}

@property (nonatomic, retain) IBOutlet UILabel *titleLabel;

@property (nonatomic, retain) IBOutlet UITextView *factLabel;

- (void)initialSetup;
- (void)setupForContinentView:(ContinentView *)continent;
- (void)show;

@end
