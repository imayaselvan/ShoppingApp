//
//  NearbyViewController.m
//  eComm
//
//  Created by Imayaselvan on 24/06/15.
//  Copyright (c) 2015 Imayaselvan. All rights reserved.
//

#import "NearbyViewController.h"
#import <GoogleMaps/GoogleMaps.h>

#define METERS_PER_MILE 1609.344
#define ZOOM_LEVEL      16

@interface NearbyViewController ()<CLLocationManagerDelegate>
{
    GMSMapView *shopMap;
    GMSPlacePicker *_placePicker;

}
@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) CLLocation* currentLocation;

@end

@implementation NearbyViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Create a GMSCameraPosition that tells the map to display the
    // coordinate -33.86,151.20 at zoom level 6.
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.distanceFilter = kCLDistanceFilterNone; // whenever we move
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;

    
    
    
    // Creates a marker in the center of the map.

    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    
    [self getMycurrentLocation];

    
}
-(void)getMycurrentLocation{

    if (![self isAuthorized]) {
        [self requestWhenInUseAuthorization];
    }
    
    [self.locationManager startUpdatingLocation];
    
    
}
- (BOOL)isAuthorized{
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    if(status == kCLAuthorizationStatusNotDetermined || status == kCLAuthorizationStatusDenied){
        return NO;
    }
    return YES;
}
- (void)requestWhenInUseAuthorization
{
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    
    if (status == kCLAuthorizationStatusDenied) {
        NSString *title;
        title = (status == kCLAuthorizationStatusDenied) ? @"Location services are off" : @"Background location is not enabled";
        NSString *message = @"The  App would like to use your current location.";
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                            message:message
                                                           delegate:self
                                                  cancelButtonTitle:@"Cancel"
                                                  otherButtonTitles:@"Settings", nil];
        [alertView show];
    }
    else if (status == kCLAuthorizationStatusNotDetermined) {
        [self.locationManager requestWhenInUseAuthorization];
    }
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{

    [self showMapWithLocation:newLocation];
    // Stop Location Manager
    [self.locationManager stopUpdatingLocation];
    
}
-(void)showMapWithLocation :(CLLocation *)location{
   
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:location.coordinate.latitude
                                                            longitude:location.coordinate.longitude
                                                                 zoom:ZOOM_LEVEL];
    shopMap = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    GMSMarker *marker = [GMSMarker markerWithPosition:location.coordinate];
    marker.draggable =YES;
    marker.map = shopMap;
  /*
    [[GMSGeocoder geocoder] reverseGeocodeCoordinate:location.coordinate completionHandler:^(GMSReverseGeocodeResponse* response, NSError* error) {
        NSLog(@"reverse geocoding results:");
        for(GMSAddress* addressObj in [response results])
        {
            marker.title =addressObj.locality;
            marker.snippet =addressObj.subLocality;
        }
    }];
    */
    


 //   [shopMap animateToLocation:location.coordinate];

    self.view = shopMap;
    

}


- (IBAction)pickPlace:(UIBarButtonItem *)sender {
    /*
    CLLocationCoordinate2D center = CLLocationCoordinate2DMake(37.788204, -122.411937);
    CLLocationCoordinate2D northEast = CLLocationCoordinate2DMake(center.latitude + 0.001,
                                                                  center.longitude + 0.001);
    CLLocationCoordinate2D southWest = CLLocationCoordinate2DMake(center.latitude - 0.001,
                                                                  center.longitude - 0.001);
    GMSCoordinateBounds *viewport = [[GMSCoordinateBounds alloc] initWithCoordinate:northEast
                                                                         coordinate:southWest];
    GMSPlacePickerConfig *config = [[GMSPlacePickerConfig alloc] initWithViewport:viewport];
    _placePicker = [[GMSPlacePicker alloc] initWithConfig:config];
    
    [_placePicker pickPlaceWithCallback:^(GMSPlace *place, NSError *error) {
        if (error != nil) {
            NSLog(@"Pick Place error %@", [error localizedDescription]);
            return;
        }
        
        if (place != nil) {
        } else {
        }
    }];*/
    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)dealloc
{
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
