//
//  CommonConstants.swift
//  WeatherApp
//
//  Created by Mykola Savoniuk on 5/14/18.
//  Copyright © 2018 Mykola Savoniuk. All rights reserved.
//

import Foundation

// MARK: - Pictures

enum PictureName: String {
    case hourly_icon
    case daily_icon
    case settings_icon
    case current_icon
    case favorite_icon
    case map_icon
}

// MARK: - ViewController Titles

enum VCTitles: String {
    case current = "Current"
    case daily = "Daily"
    case hourly = "Hourly"
    case map = "Map"
}

// MARK: - Different Strings

enum Strings: String {
    case chosen_location = "Chosen location"
    case cannot_parse_json = "Cannot parse JSON"
    case current_location = "Current location"
}
