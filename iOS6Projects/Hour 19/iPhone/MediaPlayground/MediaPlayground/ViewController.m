//
//  ViewController.m
//  MediaPlayground
//
//  Created by John Ray on 10/22/12.
//  Copyright (c) 2012 John E. Ray. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    AVAudioRecorder *_audioRecorder;
    AVAudioPlayer *_audioPlayer;
    MPMusicPlayerController *_musicPlayer;
    MPMoviePlayerController *_moviePlayer;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib
    
    //Setup the audio recorder
    NSURL *soundFileURL=[NSURL fileURLWithPath:
                         [NSTemporaryDirectory()
                          stringByAppendingString:@"sound.caf"]];
	
	NSDictionary *soundSetting;
    soundSetting = @{AVSampleRateKey:@44100.0F,
                    AVFormatIDKey:@(kAudioFormatMPEG4AAC),
                    AVNumberOfChannelsKey:@2,
                    AVEncoderAudioQualityKey:@(AVAudioQualityHigh)
    };
	
	_audioRecorder = [[AVAudioRecorder alloc]
                          initWithURL: soundFileURL
                          settings: soundSetting
                          error: nil];
    
    //Setup the audio player
    NSURL *noSoundFileURL=[NSURL fileURLWithPath:
                           [[NSBundle mainBundle]
                            pathForResource:@"norecording" ofType:@"wav"]];
    _audioPlayer =  [[AVAudioPlayer alloc]
                         initWithContentsOfURL:noSoundFileURL error:nil];
    
    
    //Setup the music player
	_musicPlayer=[MPMusicPlayerController iPodMusicPlayer];

}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    NSString *movieFile = [[NSBundle mainBundle]
                           pathForResource:@"movie" ofType:@"m4v"];
	_moviePlayer = [[MPMoviePlayerController alloc]
                    initWithContentURL: [NSURL
                                         fileURLWithPath:
                                         movieFile]];
    _moviePlayer.allowsAirPlay=YES;
    [_moviePlayer.view setFrame: self.movieRegion.frame];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)playMovie:(id)sender {
    [self.view addSubview:_moviePlayer.view];
	[[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(playMovieFinished:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:_moviePlayer];
    
    if ([self.toggleFullscreen isOn]) {
        [_moviePlayer setFullscreen:YES animated:YES];
	}
    
    [_moviePlayer play];
}

-(void)playMovieFinished:(NSNotification*)theNotification
{
    [[NSNotificationCenter defaultCenter]
     removeObserver:self
     name:MPMoviePlayerPlaybackDidFinishNotification
     object:_moviePlayer];
    
    [_moviePlayer.view removeFromSuperview];
}

- (IBAction)recordAudio:(id)sender {
    if ([self.recordButton.titleLabel.text
         isEqualToString:@"Record Audio"]) {
		[_audioRecorder record];
		[self.recordButton setTitle:@"Stop Recording"
                           forState:UIControlStateNormal];
	} else {
		[_audioRecorder stop];
 		[self.recordButton setTitle:@"Record Audio"
                           forState:UIControlStateNormal];
        // Load the new sound in the audioPlayer for playback
        NSURL *soundFileURL=[NSURL fileURLWithPath:
                             [NSTemporaryDirectory()
                              stringByAppendingString:@"sound.caf"]];
        _audioPlayer =  [[AVAudioPlayer alloc]
                             initWithContentsOfURL:soundFileURL error:nil];
	}
}

- (IBAction)playAudio:(id)sender {
    //    self.audioPlayer.delegate=self;
	[_audioPlayer play];
}

/*
 - (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player
 successfully:(BOOL)flag {
 player=nil;
 }
 */

- (IBAction)chooseImage:(id)sender {
    UIImagePickerController *imagePicker;
    imagePicker = [[UIImagePickerController alloc] init];
    
    if ([self.toggleCamera isOn]) {
        imagePicker.sourceType=UIImagePickerControllerSourceTypeCamera;
	} else {
        imagePicker.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
    }
	imagePicker.delegate=self;
    
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    [self presentViewController:imagePicker animated:YES completion:nil];
}

- (IBAction)applyFilter:(id)sender {
    CIImage *imageToFilter;
    imageToFilter=[[CIImage alloc]
                   initWithImage:self.displayImageView.image];
    
    CIFilter *activeFilter = [CIFilter filterWithName:@"CISepiaTone"];
    [activeFilter setDefaults];
    [activeFilter setValue: @0.75F
                    forKey: @"inputIntensity"];
    [activeFilter setValue:imageToFilter forKey: @"inputImage"];
    CIImage *filteredImage=[activeFilter valueForKey: @"outputImage"];
    
    UIImage *myNewImage = [UIImage imageWithCIImage:filteredImage];
    self.displayImageView.image = myNewImage;
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    [self dismissViewControllerAnimated:YES completion:nil];
    self.displayImageView.image=
                info[UIImagePickerControllerOriginalImage];
}

- (IBAction)chooseMusic:(id)sender {
    MPMediaPickerController *musicPicker;
	
	[_musicPlayer stop];
	self.displayNowPlaying.text=@"No Song Playing";
	[self.musicPlayButton setTitle:@"Play Music"
                          forState:UIControlStateNormal];
	
	musicPicker = [[MPMediaPickerController alloc]
				   initWithMediaTypes: MPMediaTypeMusic];
	
	musicPicker.prompt = @"Choose Songs to Play" ;
	musicPicker.allowsPickingMultipleItems = YES;
	musicPicker.delegate = self;
	
	[self presentViewController:musicPicker animated:YES completion:nil];
}

- (void)mediaPicker: (MPMediaPickerController *)mediaPicker
  didPickMediaItems:(MPMediaItemCollection *)mediaItemCollection {
	[_musicPlayer setQueueWithItemCollection: mediaItemCollection];
	[self dismissViewControllerAnimated:YES completion:nil];
}

- (void)mediaPickerDidCancel:(MPMediaPickerController *)mediaPicker {
	[self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)playMusic:(id)sender {
    if ([self.musicPlayButton.titleLabel.text
         isEqualToString:@"Play Music"]) {
		[_musicPlayer play];
		[self.musicPlayButton setTitle:@"Pause Music"
                              forState:UIControlStateNormal];
		self.displayNowPlaying.text=[_musicPlayer.nowPlayingItem
                                     valueForProperty:MPMediaItemPropertyTitle];
        
	} else {
        
		[_musicPlayer pause];
		[self.musicPlayButton setTitle:@"Play Music"
                              forState:UIControlStateNormal];
		self.displayNowPlaying.text=@"No Song Playing";
	}
}


@end
