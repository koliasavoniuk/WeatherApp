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

struct Weather: Decodable {
    let description: String
}

struct CurrentWeatherModel: Decodable {
    let name: String
    let main: Main
    let wind: Wind
    let description: [Weather]
    
    enum CodingKeys: String, CodingKey {
        case name
        case main
        case wind
        case description = "weather"
    }
}
