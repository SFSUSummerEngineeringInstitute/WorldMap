//
//  ContinentView.m
//  worldContinents
//
//  Created by Emerson Malca on 7/15/11.
//  Copyright 2011 OneZeroWare. All rights reserved.
//

#import "ContinentView.h"

@implementation ContinentView

@synthesize continentName;
@synthesize continentFact;
@synthesize continentSongFilename;
@synthesize thumbnailRect;
@synthesize finalRect;
@synthesize delegate;

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
        //Initialization code
        [self initialSetup];
    }
    
    return  self;
}

- (void)initialSetup {

    
    //Make it touchable
    [self setUserInteractionEnabled:YES];
    
    //Track the dragging
    UIPanGestureRecognizer *panRecognizer = [[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(move:)] autorelease];
    [panRecognizer setMinimumNumberOfTouches:1];
    [panRecognizer setMaximumNumberOfTouches:1];
    [self addGestureRecognizer:panRecognizer];
    
}

- (void)move:(UIPanGestureRecognizer*)sender {
    
    //Translate it to the super view coord system
    CGPoint translatedPoint = [sender translationInView:self.superview];
    CGPoint initialCenterPoint = CGPointMake(CGRectGetMidX(thumbnailRect), CGRectGetMidY(thumbnailRect));
    CGPoint finalCenterPoint;
    
    if([sender state] == UIGestureRecognizerStateEnded || [sender state] == UIGestureRecognizerStateFailed || [sender state] == UIGestureRecognizerStateCancelled) {
        
        finalCenterPoint = CGPointMake(initialCenterPoint.x+translatedPoint.x, initialCenterPoint.y+translatedPoint.y);
        [self updateAfterTouchesEndedAtPoint:finalCenterPoint];
        
    } else {
        
        //Move to new point
        finalCenterPoint = CGPointMake(initialCenterPoint.x+translatedPoint.x, initialCenterPoint.y+translatedPoint.y);
        
        [UIView animateWithDuration:0.1
                              delay:0.0 
                            options:UIViewAnimationOptionBeginFromCurrentState
                         animations:^ {
                             [self setCenter:finalCenterPoint];
                         }
                         completion:NULL];
    }
    
    
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    if (viewState == 0) {
        viewState = 1;
        UITouch *touch = (UITouch*)[touches anyObject];
        CGPoint touchPoint = [touch locationInView:self.superview];
        
        //Initial drag
        CGFloat originX = touchPoint.x - (finalRect.size.width/2);
        CGFloat originY = touchPoint.y - (finalRect.size.height/2);
        
        CGRect bigFrame = CGRectMake(originX, originY, finalRect.size.width, finalRect.size.height);
        
        //Initial growing animation
        [UIView animateWithDuration:0.3
                         animations:^ {
                             [self setFrame:bigFrame];
                         }];
        
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = (UITouch*)[touches anyObject];
    CGPoint touchPoint = [touch locationInView:self.superview];
    [self updateAfterTouchesEndedAtPoint:touchPoint];
}

- (void)updateAfterTouchesEndedAtPoint:(CGPoint)point {
    
    //Check if in final destination
    BOOL isInDestination = CGRectContainsPoint(finalRect, point);
    
    if (isInDestination) {
       
        //If in destination, we set it to where it is supposed to be and kill user interaction
        viewState = 2;
        [self setUserInteractionEnabled:NO];
        [UIView animateWithDuration:0.3
                         animations:^ {
                             [self setFrame:finalRect];
                         }
                         completion:^(BOOL finished) {
                             [self.delegate continentViewDidFinishWithSuccess:self];
                         }];
        
    } else {
        //If not in destination
        
        //Reset the view state
        viewState = 0;
        
        //Go back to thumbnail size and position
        [UIView animateWithDuration:0.3
                         animations:^ {
                             [self setFrame:thumbnailRect];
                         }];
    }
}

- (void)resetContinentView {
    viewState = 0;
    [self setUserInteractionEnabled:YES];
    [self setFrame:thumbnailRect];
}

@end
