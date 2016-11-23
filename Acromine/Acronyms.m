//
//  Acronyms.m
//  Acromine
//
//  Created by Abhishek Tyagi on 11/17/16.
//  Copyright © 2016 Department of Education. All rights reserved.
//

#import "Acronyms.h"

@implementation Acronyms

static Acronyms *instance =nil;
+(Acronyms *)getInstanceOfAcronym
{
    @synchronized(self)
    {
        if(instance==nil)
        {
            instance= [Acronyms new];
            NSMutableArray *emptyArray = [[NSMutableArray alloc] init];
            [instance setLfsArray:[emptyArray mutableCopy]];
            [instance setSf:@""];
            //            /cart
        }
    }
    return instance;
}

+ (void)saveAcronymsInfoInInstance:(id)json {
    [self clearAcronymInstance];
    [self getInstanceOfAcronym];
    instance.sf = [[json objectAtIndex:0] objectForKey:@"sf"];
    NSArray *array = [[json objectAtIndex:0] objectForKey:@"lfs"];
    for (int i = 0; i < array.count; i++) {
        [self addLFInInstance:[array objectAtIndex:i]];
    }
}


//+ (void)addLFInInstance:(NSDictionary*)lfDict {
//    LFS *lfs = [[LFS alloc] init];
//    lfs.lf = [lfDict objectForKey:@"lf"];
//    lfs.freq = [[lfDict objectForKey:@"freq"] stringValue];
//    lfs.since = [[lfDict objectForKey:@"since"] stringValue];
//    lfs.vars = [lfDict objectForKey:@"vars"];
//    
//    [instance.lfsArray addObject:lfs];
//}

+ (void)addLFInInstance:(NSDictionary*)lfDict {
    LFS *lfs = [[LFS alloc] init];
    for (NSString *key in lfDict)
    {
        if ([self containsKey:key inObject:lfs]) {
            id value = lfDict[key];
            if (value != [NSNull null] && value != nil)
            {
                if (![value isKindOfClass:[NSDictionary class]] && ![value isKindOfClass:[NSArray class]]) {
                    value = [NSString stringWithFormat:@"%@",value];
                }
                [lfs setValue:value forKey:key];
            }
        }
    }
    
    [instance.lfsArray addObject:lfs];
}

+ (BOOL)containsKey:(NSString *)key inObject:(id)obj {
    BOOL retVal = 0;
    NSArray *allKeys = [LFS allPropertyNames];
    retVal = [allKeys containsObject:key];
    return retVal;
}

+ (void)clearAcronymInstance {
    
}

@end
