//
//  SharedLocation.swift
//  WeatherApp
//
//  Created by Mykola Savoniuk on 5/25/18.
//  Copyright © 2018 Mykola Savoniuk. All rights reserved.
//

import Foundation

class SharedLocation {
    static let sharedInstance = SharedLocation()
    
    var latitude = Double()
    var longitude = Double()
    
    private init() {}
}
