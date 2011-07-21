//
//  ContinentView.h
//  worldContinents
//
//  Created by Emerson Malca on 7/15/11.
//  Copyright 2011 OneZeroWare. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ContinentViewDelegate;

@interface ContinentView : UIImageView {
    
    NSString *continentName;
    NSString *continentFact;
    NSString *continentSongFilename;
    CGRect thumbnailRect;
    CGRect finalRect;
    int viewState;
    
    id<ContinentViewDelegate> delegate;
}

@property (nonatomic, retain) NSString *continentName;
@property (nonatomic, retain) NSString *continentFact;
@property (nonatomic, retain) NSString *continentSongFilename;
@property (nonatomic) CGRect thumbnailRect;
@property (nonatomic) CGRect finalRect;
@property (nonatomic, assign) id<ContinentViewDelegate> delegate;

- (void)initialSetup;
- (void)updateAfterTouchesEndedAtPoint:(CGPoint)point;
- (void)resetContinentView;

@end

@protocol ContinentViewDelegate <NSObject>

- (void)continentViewDidFinishWithSuccess:(ContinentView *)continentView;

@end
