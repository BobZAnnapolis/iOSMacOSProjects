//
//  MasterViewController.m
//  FlowerDetail
//
//  Created by John Ray on 10/27/12.
//  Copyright (c) 2012 John E. Ray. All rights reserved.
//

#import "MasterViewController.h"

#import "DetailViewController.h"

@interface MasterViewController () {
    NSMutableArray *_objects;
    NSArray *_flowerData;
    NSArray *_flowerSections;
}
@end

@implementation MasterViewController

- (void)awakeFromNib
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.clearsSelectionOnViewWillAppear = NO;
        self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
    }
    [super awakeFromNib];
}


- (void)createFlowerData {
    
	NSMutableArray *redFlowers;
	NSMutableArray *blueFlowers;
	
	_flowerSections=@[@"Red Flowers",@"Blue Flowers"];
	
	redFlowers=[[NSMutableArray alloc] init];
	blueFlowers=[[NSMutableArray alloc] init];
	
	[redFlowers addObject:@{@"name":@"Poppy",
						    @"picture":@"Poppy.png",
                            @"url":@"http://en.wikipedia.org/wiki/Poppy"}];
	[redFlowers addObject:@{@"name":@"Tulip",
						    @"picture":@"Tulip.png",
						    @"url":@"http://en.wikipedia.org/wiki/Tulip"}];
	[redFlowers addObject:@{@"name":@"Gerbera",
						   @"picture":@"Gerbera.png",
						   @"url":@"http://en.wikipedia.org/wiki/Gerbera"}];
	[redFlowers addObject:@{@"name":@"Peony",
						   @"picture":@"Peony.png",
						   @"url":@"http://en.wikipedia.org/wiki/Peony"}];
	[redFlowers addObject:@{@"name":@"Rose",
                            @"picture":@"Rose.png",
                            @"url":@"http://en.wikipedia.org/wiki/Rose"}];
    [redFlowers addObject:@{@"name":@"Hollyhock",
                            @"picture":@"Hollyhock.png",
                            @"url":@"http://en.wikipedia.org/wiki/Hollyhock"}];
    [redFlowers addObject:@{@"name":@"Straw Flower",
                            @"picture":@"Strawflower.png",
                            @"url":@"http://en.wikipedia.org/wiki/Peony"}];
    [blueFlowers addObject:@{@"name":@"Hyacinth",
                            @"picture":@"Hyacinth.png",
                            @"url":@"http://en.m.wikipedia.org/wiki/Hyacinth_(flower)"}];
    [blueFlowers addObject:@{@"name":@"Hydrangea",
                            @"picture":@"Hydrangea.png",
                            @"url":@"http://en.m.wikipedia.org/wiki/Hydrangea"}];
    [blueFlowers addObject:@{@"name":@"Sea Holly",
                            @"picture":@"Sea Holly.png",
                            @"url":@"http://en.wikipedia.org/wiki/Sea_holly"}];
    [blueFlowers addObject:@{@"name":@"Grape Hyacinth",
                            @"picture":@"Grape Hyacinth.png",
                            @"url":@"http://en.wikipedia.org/wiki/Grape_hyacinth"}];
    [blueFlowers addObject:@{@"name":@"Phlox",
                            @"picture":@"Phlox.png",
                            @"url":@"http://en.wikipedia.org/wiki/Phlox"}];
    [blueFlowers addObject:@{@"name":@"Pin Cushion Flower",
                            @"picture":@"Pincushion flower.png",
                            @"url":@"http://en.wikipedia.org/wiki/Scabious"}];
    [blueFlowers addObject:@{@"name":@"Iris",
                            @"picture":@"Iris.png",
                            @"url":@"http://en.wikipedia.org/wiki/Iris_(plant)"}];
    
	_flowerData=@[redFlowers,blueFlowers];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.detailViewController = (DetailViewController *)
            [[self.splitViewController.viewControllers lastObject] topViewController];
    [self createFlowerData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender
{
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    [_objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)aTableView {
    // Return the number of sections.
    return [_flowerSections count];
}


- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
	return [_flowerData[section] count];
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	return [_flowerSections objectAtIndex:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:@"flowerCell"];
    
    cell.textLabel.text=
                _flowerData[indexPath.section][indexPath.row][@"name"];
    cell.detailTextLabel.text=
                _flowerData[indexPath.section][indexPath.row][@"url"];
    
    UIImage *flowerImage;
    flowerImage=[UIImage imageNamed:
                 _flowerData[indexPath.section][indexPath.row][@"picture"]];
    
    cell.imageView.image=flowerImage;
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

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

- (void)tableView:(UITableView *)aTableView
        didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.detailViewController.detailItem=
                        _flowerData[indexPath.section][indexPath.row];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        [[segue destinationViewController] setDetailItem:
                            _flowerData[indexPath.section][indexPath.row]];
    }
}

@end
