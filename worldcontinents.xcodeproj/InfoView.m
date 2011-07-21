//
//  InfoView.m
//  worldcontinents
//
//  Created by Student on 7/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "InfoView.h"
#import "ContinentView.h"

@implementation InfoView
@synthesize titleLabel;
@synthesize factLabel;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initialSetup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super initWithCoder:decoder];
    if (self) {
        //initiazation code
        [self initialSetup];
    }
    return self;
}

- (void) initialSetup {
    UITapGestureRecognizer *tap = [[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)] autorelease];
    [self addGestureRecognizer:tap];

}

- (void)setupForContinentView:(ContinentView *)continent {
    [titleLabel setText:continent.continentName];
    [factLabel setText:continent.continentFact];
}

- (void)show { 
    [UIView animateWithDuration:0.3
                     animations:^{
                         [self setAlpha:1.0];
                     }];
    
}
- (void)tap:(UITapGestureRecognizer *)sender {
    
    if ([sender state] == UIGestureRecognizerStateRecognized){
        
        //animate out
        [UIView animateWithDuration:0.3
                         animations:^{
                             [self setAlpha:0.0];
                         }];
    }
}

@end
