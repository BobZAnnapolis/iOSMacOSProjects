//
//  ViewController.m
//  FlowerColorTable
//
//  Created by John Ray on 10/25/12.
//  Copyright (c) 2012 John E. Ray. All rights reserved.
//

#import "ViewController.h"

#define kSectionCount 2
#define kRedSection 0
#define kBlueSection 1

@interface ViewController () {
    NSArray *_redFlowers;
    NSArray *_blueFlowers;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _redFlowers = @[@"Gerbera",@"Peony",@"Rose",@"Poppy"];
	_blueFlowers = @[@"Hyacinth",@"Hydrangea",@"Sea Holly",@"Phlox",@"Iris"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return kSectionCount;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
	switch (section) {
		case kRedSection:
			return [_redFlowers count];
		case kBlueSection:
			return [_blueFlowers count];
		default:
			return 0;
	}
}

- (NSString *)tableView:(UITableView *)tableView
titleForHeaderInSection:(NSInteger)section {
    switch (section) {
        case kRedSection:
            return @"Red";
        case kBlueSection:
            return @"Blue";
        default:
            return @"Unknown";
    }
}

/*
 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
 {
 static NSString *CellIdentifier = @"Cell";
 
 UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
 if (cell == nil) {
 cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
 }
 
 switch (indexPath.section) {
 case kRedSection:
 [[cell textLabel]
 setText:[redFlowers objectAtIndex:indexPath.row]];
 break;
 case kBlueSection:
 [[cell textLabel]
 setText:[blueFlowers objectAtIndex:indexPath.row]];
 break;
 default:
 [[cell textLabel]
 setText:@"Unknown"];
 }
 
 return cell;
 }
 */

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:@"flowerCell"];
    
    
    switch (indexPath.section) {
		case kRedSection:
			cell.textLabel.text=_redFlowers[indexPath.row];
			break;
		case kBlueSection:
			cell.textLabel.text=_blueFlowers[indexPath.row];
			break;
		default:
			cell.textLabel.text=@"Unknown";
	}
    
    UIImage *flowerImage;
    flowerImage=[UIImage imageNamed:
                 [NSString stringWithFormat:@"%@%@",
                  cell.textLabel.text,@".png"]];
    cell.imageView.image=flowerImage;
    
    return cell;
}


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - Table view delegate


- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
	UIAlertView *showSelection;
	NSString	*flowerMessage;
    
	switch (indexPath.section) {
		case kRedSection:
			flowerMessage=[[NSString alloc]
						   initWithFormat:
						   @"You chose the red flower - %@",
						   _redFlowers[indexPath.row]];
			break;
		case kBlueSection:
			flowerMessage=[[NSString alloc]
						   initWithFormat:
						   @"You chose the blue flower - %@",
						   _blueFlowers[indexPath.row]];
			break;
		default:
			flowerMessage=[[NSString alloc]
						   initWithFormat:
						   @"I have no idea what you chose!?"];
			break;
	}
	
	showSelection = [[UIAlertView alloc]
					 initWithTitle: @"Flower Selected"
					 message:flowerMessage
					 delegate: nil
					 cancelButtonTitle: @"Ok"
					 otherButtonTitles: nil];
	[showSelection show];
}


@end
