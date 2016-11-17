//
//  SearchListViewController.m
//  Acromine
//
//  Created by Abhishek Tyagi on 11/17/16.
//  Copyright © 2016 Department of Education. All rights reserved.
//

#import "SearchListViewController.h"
#import "CustomResultCell.h"
#import "Acronyms.h"

@interface SearchListViewController () {
    Acronyms            *acronymsInfo;
}

@end

@implementation SearchListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    acronymsInfo = [Acronyms getInstanceOfAcronym];
    
    self.title = acronymsInfo.sf;
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return acronymsInfo.lfsArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    LFS *lfsInfo = [acronymsInfo.lfsArray objectAtIndex:indexPath.row];
    
    float height = [self heigthWithWidth:self.view.frame.size.width-70 andFont:[UIFont systemFontOfSize:14] string:[self getCommaSeperatedStringFromArray:lfsInfo.vars]];
    return height+91;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomResultCell *cell = (CustomResultCell*)[tableView dequeueReusableCellWithIdentifier:@"customResultCell"];
    
    LFS *lfsInfo = [acronymsInfo.lfsArray objectAtIndex:indexPath.row];
    
    cell.lfLabel.text = lfsInfo.lf;
    cell.freqLabel.text = lfsInfo.freq;
    cell.sinceLabel.text = lfsInfo.since;
    cell.varsLabel.text = [self getCommaSeperatedStringFromArray:lfsInfo.vars];

    // Configure the cell...
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (NSString *)getCommaSeperatedStringFromArray:(NSArray *)vars {
    NSMutableArray * array = [[NSMutableArray alloc] init]; // create a Mutable array
    
    for(id item in vars){
        [array addObject:[item objectForKey:@"lf"]]; // Add the values to this created mutable array
    }
    
    return [array componentsJoinedByString:@","];
}

- (CGFloat)heigthWithWidth:(CGFloat)width andFont:(UIFont *)font string:(NSString *)string
{
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:string];
    [attrStr addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, [string length])];
    CGRect rect = [attrStr boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil];
    return rect.size.height;
}

@end
