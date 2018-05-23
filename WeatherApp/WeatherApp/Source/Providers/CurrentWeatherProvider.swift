//
//  CurrentWeatherProvider.swift
//  WeatherApp
//
//  Created by Mykola Savoniuk on 5/22/18.
//  Copyright © 2018 Mykola Savoniuk. All rights reserved.
//

import Foundation
import Alamofire

final class CurrentWeatherProvider: ObservableObject, NetworkProvider {
    var result: CurrentWeatherModel?
    
    let url = URL(string: "https://api.openweathermap.org/data/2.5/weather") ?? URL(fileURLWithPath: "")
    
    let parameters = ["q": "Kyiv",
                      "APPID" : "e6274a1ed80da6b1a0f04eaaaf73806c"]
    
    func execute() {
        Alamofire
            .request(
                self.url,
                method: .get,
                parameters: self.parameters
            )
            .validate()
            .responseJSON{ (response) -> Void in
                
                switch response.result {
                case .success( _):
                    
                    do {
                        let decoder = JSONDecoder()
                        let weatherData = try decoder.decode(CurrentWeatherModel.self, from: response.data!)
                        
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
