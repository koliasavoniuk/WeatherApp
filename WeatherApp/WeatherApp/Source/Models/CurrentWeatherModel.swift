//
//  CurrentWeatherModel.swift
//  WeatherApp
//
//  Created by Mykola Savoniuk on 5/22/18.
//  Copyright © 2018 Mykola Savoniuk. All rights reserved.
//

import Foundation

struct Main: Decodable {
    let temperature: Double
    let pressure: Int
    let humidity: Int
    
    enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case pressure
        case humidity
    }
}

struct Wind: Decodable {
    let speed: Double
    let degree: Int

    enum CodingKeys: String, CodingKey {
        case speed
        case degree = "deg"
    }
}

struct CurrentWeatherModel: Decodable {
    let name: String
    let main: Main
    let wind: Wind
}
