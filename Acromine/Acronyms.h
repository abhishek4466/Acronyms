//
//  Acronyms.h
//  Acromine
//
//  Created by Abhishek Tyagi on 11/17/16.
//  Copyright © 2016 Department of Education. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LFS.h"

@interface Acronyms : NSObject

@property(nonatomic, strong) NSString           *sf;
@property(nonatomic, strong) NSMutableArray     *lfsArray;

+ (Acronyms*)getInstanceOfAcronym;
+ (void)saveAcronymsInfoInInstance:(id)json;
@end
