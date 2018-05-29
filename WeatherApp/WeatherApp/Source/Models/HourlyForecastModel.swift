//
//  HourlyForecastModel.swift
//  WeatherApp
//
//  Created by Mykola Savoniuk on 5/23/18.
//  Copyright © 2018 Mykola Savoniuk. All rights reserved.
//

import Foundation

struct HourlyForecastModel: Decodable {
    let cod: String
    let list: [HourlyForecastItem]
}

struct HourlyForecastItem: Decodable {
    let main: MainHourlyForecast
    let wind: HourlyForecastWind
    let description: [Description]
    let timestamp: Double
    
    enum CodingKeys: String, CodingKey {
        case main
        case wind
        case description = "weather"
        case timestamp = "dt"
    }
}

struct HourlyForecastWind: Decodable {
    let speed: Double
    let degree: Double
    
    enum CodingKeys: String, CodingKey {
        case speed
        case degree = "deg"
    }
}

struct MainHourlyForecast: Decodable {
    let temperature: Double
    let pressure: Double
    let humidity: Double
    
    enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case pressure
        case humidity
    }
}
