//
//  SCPost.h
//  AroundClient
//
//  Created by Yikun Huang on 9/20/17.
//  Copyright © 2017 Yikun Huang. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CLLocation;

@interface SCPost : NSObject

@property(nonatomic,copy) NSString *message;
@property(nonatomic) NSString *username;
@property (nonatomic)  CLLocation *location;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

