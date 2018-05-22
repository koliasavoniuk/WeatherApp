//
//  CoordsWeatherProvider.swift
//  WeatherApp
//
//  Created by Mykola Savoniuk on 5/22/18.
//  Copyright © 2018 Mykola Savoniuk. All rights reserved.
//

import Foundation
import Alamofire

final class CoordsWeatherProvider: ObservableObject, NetworkProvider {
    let url = URL(string: "https://api.openweathermap.org/data/2.5/weather") ?? URL(fileURLWithPath: "")
    
    let parameters = ["q": "Boston",
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
                
                let value = response.result
                print(value)
            }
    }
    
    
}
