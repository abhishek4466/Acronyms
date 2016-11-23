//
//  LFS.h
//  Acromine
//
//  Created by Abhishek Tyagi on 11/17/16.
//  Copyright © 2016 Department of Education. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LFS : NSObject

@property(nonatomic, strong) NSString   *lf;
@property(nonatomic, strong) NSString   *freq;
@property(nonatomic, strong) NSString   *since;
@property(nonatomic, strong) NSArray    *vars;

+ (NSArray *)allPropertyNames;

@end
