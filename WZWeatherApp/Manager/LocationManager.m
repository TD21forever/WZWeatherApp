//
//  LocationManager.m
//  WZWeatherApp
//
//  Created by T D on 2022/7/29.
//

#import "LocationManager.h"


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
        _locationManager.distanceFilter = 100;
    }
    return self;
}
- (void)setupCurLocation{
    [_locationManager requestAlwaysAuthorization];
    [_locationManager startUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{


    CLLocation * location = locations.lastObject;
    CLGeocoder *geoCoder = [[CLGeocoder alloc]init];
    [geoCoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
            NSString * cityName = @"";
            if(placemarks.count > 0){
                CLPlacemark* placeMark = placemarks[0];
                
                if(!placeMark.locality || placeMark.locality.length == 0){
                    return;
                }
                if([[placeMark.locality substringWithRange:NSMakeRange(placeMark.locality.length-1, 1)] isEqualToString:@"市"]){
                    cityName = [placeMark.locality substringToIndex:placeMark.locality.length - 1];
                } else {
                    cityName = placeMark.locality;
                }
            }
        [[NSNotificationCenter defaultCenter] postNotificationName:@"updateLocation" object:cityName];
    }];
    [_locationManager stopUpdatingLocation];
}

@end
