//
//  SharedLocation.swift
//  WeatherApp
//
//  Created by Mykola Savoniuk on 5/25/18.
//  Copyright © 2018 Mykola Savoniuk. All rights reserved.
//

import Foundation
import CoreLocation

class SharedLocation {
    static let sharedInstance = SharedLocation()
    var coordinates = CLLocationCoordinate2D()
    
    private init() {}
}
