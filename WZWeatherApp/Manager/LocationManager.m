//
//  LocationManager.m
//  WZWeatherApp
//
//  Created by T D on 2022/7/29.
//

#import "LocationManager.h"
# import <CoreLocation/CoreLocation.h>

@interface LocationManager()<CLLocationManagerDelegate>


@property (nonatomic,strong) CLLocationManager* locationManager;

@end

@implementation LocationManager

+ (instancetype)shared {
    static id _shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shared = [[self alloc] init];
    });
    
    return _shared;
}

- (instancetype)init{
    if(self = [super init]){
        _locationManager = [[CLLocationManager alloc]init];
        _locationManager.delegate = self;
    }
    return self;
}
- (void)setupCurLocation{
    [_locationManager startUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    CLLocation * location = [locations lastObject];
    if (location.horizontalAccuracy > 0){
        _currentLocation = location;
        [_locationManager stopUpdatingHeading];
    }
}

- (CLLocation *)currentLocation{
    if(!_currentLocation){
        [self setupCurLocation];
    }
    return _currentLocation;
}

@end
