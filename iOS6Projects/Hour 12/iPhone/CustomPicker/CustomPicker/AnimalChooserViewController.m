//
//  AnimalChooserViewController.m
//  CustomPicker
//
//  Created by John Ray on 11/4/12.
//  Copyright (c) 2012 John E. Ray. All rights reserved.
//

#import "AnimalChooserViewController.h"

#define kComponentCount 2
#define kAnimalComponent 0
#define kSoundComponent 1

@interface AnimalChooserViewController () {
    NSArray *_animalNames;
    NSArray *_animalSounds;
    NSArray *_animalImages;
}

@end

@implementation AnimalChooserViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewDidAppear:(BOOL)animated {
    ViewController *initialView;
    initialView=(ViewController *)self.delegate;
    [initialView displayAnimal:_animalNames[0]
                     withSound:_animalSounds[0]
                 fromComponent:@"nothing yet..."];
}

-(void)viewWillDisappear:(BOOL)animated {
    ((ViewController *)self.delegate).animalChooserVisible=NO;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    _animalNames=@[@"Mouse",@"Goose",@"Cat",@"Dog",@"Snake",@"Bear",@"Pig"];
	_animalSounds=@[@"Oink",@"Rawr",@"Ssss",@"Roof",@"Meow",@"Honk",@"Squeak"];
	_animalImages=@[
                       [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mouse.png"]],
                       [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"goose.png"]],
                       [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cat.png"]],
                       [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dog.png"]],
                       [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"snake.png"]],
                       [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bear.png"]],
                       [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pig.png"]],
                       ];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
	return kComponentCount;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView
        numberOfRowsInComponent:(NSInteger)component {
	if (component==kAnimalComponent) {
		return [_animalNames count];
	} else {
		return [_animalSounds count];
	}
}


- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row
		  forComponent:(NSInteger)component reusingView:(UIView *)view {
	if (component==kAnimalComponent) {
		return _animalImages[row];
	} else {
		UILabel *soundLabel;
		soundLabel=[[UILabel alloc] initWithFrame:CGRectMake(0,0,100,32)];
		soundLabel.backgroundColor=[UIColor clearColor];
		soundLabel.text=_animalSounds[row];
		return soundLabel;
	}
}

- (CGFloat)pickerView:(UIPickerView *)pickerView
        rowHeightForComponent:(NSInteger)component {
	return 55.0;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
	if (component==kAnimalComponent) {
		return 75.0;
	} else {
		return 150.0;
	}
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row
	   inComponent:(NSInteger)component {
    
    ViewController *initialView;
    initialView=(ViewController *)self.delegate;
    
    if (component==kAnimalComponent) {
        int chosenSound=[pickerView selectedRowInComponent:kSoundComponent];
        [initialView displayAnimal:_animalNames[row]
                         withSound:_animalSounds[chosenSound]
                     fromComponent:@"the Animal"];
    } else {
        int chosenAnimal=[pickerView selectedRowInComponent:kAnimalComponent];
        [initialView displayAnimal:_animalNames[chosenAnimal]
                         withSound:_animalSounds[row]
                     fromComponent:@"the Sound"];
    }
    
}

- (IBAction)dismissAnimalChooser:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
