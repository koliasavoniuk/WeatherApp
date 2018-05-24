//
//  CurrentWeatherProvider.swift
//  WeatherApp
//
//  Created by Mykola Savoniuk on 5/22/18.
//  Copyright © 2018 Mykola Savoniuk. All rights reserved.
//

import Foundation

final class CurrentWeatherProvider<ModelType>: ObservableObject, NetworkProtocol, AlamofireRequest
    where ModelType: Decodable
{
    var result: ModelType?
    
    let url = URL(string: "https://api.openweathermap.org/data/2.5/weather") ?? URL(fileURLWithPath: "")
    
    let parameters = [
        "q": "Kyiv",
        "APPID" : "e6274a1ed80da6b1a0f04eaaaf73806c"
    ]
    
    func execute() {
        self.request(with: self.url, parameters: self.parameters) { result in
            switch result {
            case let .success(data):
                
                do {
                    let decoder = JSONDecoder()
                    let weatherData = try decoder.decode(ModelType.self, from: data)
                    
                    self.result = weatherData
                    self.state = .didLoad
                    
                } catch {
                    self.state = .failLoading(error: "Can't parse JSON")
                }
                
            case .failure(let error):
                self.state = .failLoading(error: String(describing: error))
            }
        }
      
    }
}
