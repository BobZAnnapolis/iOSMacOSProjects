//
//  ViewController.h
//  MediaPlayground
//
//  Created by John Ray on 10/22/12.
//  Copyright (c) 2012 John E. Ray. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreAudio/CoreAudioTypes.h>
#import <CoreImage/CoreImage.h>

@interface ViewController : UIViewController <MPMediaPickerControllerDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UISwitch *toggleFullscreen;
@property (weak, nonatomic) IBOutlet UISwitch *toggleCamera;
@property (weak, nonatomic) IBOutlet UIImageView *displayImageView;
@property (weak, nonatomic) IBOutlet UILabel *displayNowPlaying;
@property (weak, nonatomic) IBOutlet UIButton *musicPlayButton;
@property (weak, nonatomic) IBOutlet UIButton *recordButton;
@property (weak, nonatomic) IBOutlet UIView *movieRegion;

- (IBAction)playMovie:(id)sender;
- (IBAction)recordAudio:(id)sender;
- (IBAction)playAudio:(id)sender;
- (IBAction)chooseImage:(id)sender;
- (IBAction)applyFilter:(id)sender;
- (IBAction)chooseMusic:(id)sender;
- (IBAction)playMusic:(id)sender;

@end