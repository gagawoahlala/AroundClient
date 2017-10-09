//
//  SCLocationManager.h
//  AroundClient
//
//  Created by Yikun Huang on 10/7/17.
//  Copyright © 2017 Yikun Huang. All rights reserved.
//


#import <Foundation/Foundation.h>
@class CLLocation;

extern NSString * const SCLocationUpdateNotification;

@interface SCLocationManager : NSObject

+ (instancetype)sharedManager;
- (void)getUserPermission;
+ (BOOL)isLocationServicesEnabled;
- (void)startLoadUserLocation;
- (void)stopLoadUserLocation;
- (CLLocation *)getUserCurrentLocation;

@end
