//
//  worldcontinentsViewController.m
//  worldcontinents
//
//  Created by Student on 7/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "worldcontinentsViewController.h"
#import "InfoView.h"
#import "Continentview.h"
#import <QuartzCore/QuartzCore.h>
#import <AVFoundation/AVFoundation.h>


@implementation worldcontinentsViewController

@synthesize infoView;
@synthesize northAmerica;
@synthesize southAmerica;
@synthesize europe;
@synthesize asia;
@synthesize africa;
@synthesize australia;
@synthesize antartica;


- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImage *bg = [UIImage imageNamed:@"Background"];
    self.view.layer.contents = (id)bg.CGImage;
    self.view.contentMode = UIViewContentModeScaleToFill;
    
    //North America
    [northAmerica setContinentName:@"North America"];
    [northAmerica setContinentFact:@"1. It is the third largest continent in the world. \n2. It covers about 4.8% of the planet's surface."];
    UIImage *northAmericaImage = [UIImage imageNamed:@"northamerica.png"];
    [northAmerica setImage:northAmericaImage];
    [northAmerica setThumbnailRect:CGRectMake (790.0, 612.0, 204.0, 131.0)];
    [northAmerica setFinalRect:CGRectMake(24.0, 19.0,444.0, 279.0)];
    [northAmerica setDelegate:self];
    
    //South America
    [southAmerica setContinentName:@"South America"];
    [southAmerica setContinentFact:@"1. South America is a continent occupying the southern part of the supercontinent of America. \n 2. It is the fourth largest continent in the world."];
    UIImage *southAmericaImage = [UIImage imageNamed:@"southamerica.png"];
    [southAmerica setImage:southAmericaImage];
    [southAmerica setThumbnailRect:CGRectMake (688.0, 619.0, 96.0, 117.0)];
    [southAmerica setFinalRect:CGRectMake(166.0, 294.0, 169.0, 255.0)];
    [southAmerica setDelegate:self];
    
    //Europe
    [europe setContinentName:@"Europe"];
    [europe setContinentFact:@"1. Europe is the world's second-smallest continent. \n2. It covers about 10,180,000 square kilometres 3,930,000 sq miles."];
    UIImage *europeImage = [UIImage imageNamed:@"europe.png"];
    [europe setImage:europeImage];
    [europe setThumbnailRect:CGRectMake (504.0, 640.0, 175.0, 96.0)];
    [europe setFinalRect:CGRectMake(428.00, 58.0, 219.0, 128.0)];
    [europe setDelegate:self];
    
    //Australia
    [australia setContinentName:@"Australia"];
    [australia setContinentFact:@"1. It is the smallest continent. \n2. In the past, Australasia has been used as a name for combined Australia/New Zealand sporting teams."];
    UIImage *australiaImage = [UIImage imageNamed:@"australia.png"];
    [australia setImage:australiaImage];
    [australia setThumbnailRect:CGRectMake (905.0, 610.0, 114.0, 71.0)];
    [australia setFinalRect:CGRectMake(756.0, 374.0, 144.0, 110.0)];
    [australia setDelegate:self];
    
    //Asia
    [asia setContinentName:@"Asia"];
    [asia setContinentFact:@"1. Biggest continent in the world. \n2. It covers 8.6% of Earth total surface."];
    UIImage *asiaImage = [UIImage imageNamed:@"asia.png"];
    [asia setImage:asiaImage];
    [asia setThumbnailRect:CGRectMake (3.0, 626.0, 159.0, 103.0)];
    [asia setFinalRect:CGRectMake(587.0, 53.0, 435.0, 266.0)];
    [asia setDelegate:self];
    
    //Antartica
    [antartica setContinentName:@"Antarctica"];
    [antartica setContinentFact:@"1. Antarctica is Earth's southernmost continent, overlying the South Pole. \n2. 98% of Antarctica is covered by ice."];
    UIImage *antarticaImage = [UIImage imageNamed:@"antarctica.png"];
    [antartica setImage:antarticaImage];
    [antartica setThumbnailRect:CGRectMake (142.0, 658.0, 291.0, 71.0)];
    [antartica setFinalRect:CGRectMake(249.00, 536.00,670.00, 71.00)];
    [antartica setDelegate:self];
    
    //Africa
    [africa setContinentName:@"Africa"];
    [africa setContinentFact:@"1. Second largest continent on Earth. \n2. It covers 6% of the Earth's total surface area."];
    UIImage *africaImage = [UIImage imageNamed:@"africa.png"];
    [africa setImage:africaImage];
    [africa setThumbnailRect:CGRectMake (388.0, 619.0, 128.0, 109.0)];
    [africa setFinalRect:CGRectMake(423.00, 199.0, 248.0, 284.00)];
    [africa setDelegate:self];
    
    AVAudioSession *session = [AVAudioSession sharedInstance];
    [session setCategory:AVAudioSessionCategorySoloAmbient error:nil];
    [session setActive:TRUE error:nil];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"overtherainbow" ofType:@"mp3"];
    NSURL *fileURL = [[NSURL alloc] initFileURLWithPath:path];
    AVAudioPlayer *player = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:nil];
    [player setNumberOfLoops:-1];
    [player play];
    [fileURL release];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

#pragma mark ContinetView delegate methods

- (void)continentViewDidFinishWithSuccess:(ContinentView *)continentView {
    
    //show info view for this continent
    [infoView setupForContinentView:continentView];
    [infoView show];
    
}

-(IBAction)restartgame: (id)sender; {
    
    [UIView animateWithDuration:0.3
                     animations:^ {
                         [northAmerica resetContinentView];
                         [southAmerica resetContinentView];
                         [africa resetContinentView];
                         [antartica resetContinentView];
                         [asia resetContinentView];
                         [europe resetContinentView];
                         [australia resetContinentView];
                     }];
    
}


@end
