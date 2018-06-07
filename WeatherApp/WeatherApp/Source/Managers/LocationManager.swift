//
//  LocationManager.swift
//  WeatherApp
//
//  Created by Mykola Savoniuk on 5/25/18.
//  Copyright © 2018 Mykola Savoniuk. All rights reserved.
//

import Foundation
import CoreLocation

class LocationManager: ObservableObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    
    func execute() {
        self.locationManager.delegate = self
        
        let authStatus = CLLocationManager.authorizationStatus()
        if authStatus == .notDetermined {
            self.locationManager.requestWhenInUseAuthorization()
            
            return
        }
        
        if authStatus == .denied || authStatus == .restricted {
            self.state = .failLoading(error: "Denied access")
            
            return
        }
        
        self.locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        self.locationManager.startUpdatingLocation()
    }
    
    func cancel() {
        self.locationManager.stopUpdatingLocation()
    }
    
    // MARK: - <CLLocationManagerDelegate>
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        SharedLocation.sharedInstance.coordinates = locations.first?.coordinate ?? CLLocationCoordinate2D()
        
        self.state = .didLoad
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        self.state = .failLoading(error: "Cannot get location")
    }
}
