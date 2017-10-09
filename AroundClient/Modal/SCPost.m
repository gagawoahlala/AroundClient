//
//  SCPost.m
//  AroundClient
//
//  Created by Yikun Huang on 9/20/17.
//  Copyright © 2017 Yikun Huang. All rights reserved.
//


#import "SCPost.h"
#import <MapKit/MapKit.h>

@implementation SCPost

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self != nil) {
        self.message = dictionary[@"message"];
        self.username = dictionary[@"username"];
    }
    return self;
}

@end

