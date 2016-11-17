//
//  CustomResultCell.h
//  Acromine
//
//  Created by Abhishek Tyagi on 11/17/16.
//  Copyright © 2016 Department of Education. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomResultCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel        *lfLabel;
@property (nonatomic, weak) IBOutlet UILabel        *sinceLabel;
@property (nonatomic, weak) IBOutlet UILabel        *freqLabel;
@property (nonatomic, weak) IBOutlet UILabel        *varsLabel;

@end
