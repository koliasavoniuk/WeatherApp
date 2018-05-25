//
//  WeatherProvider.swift
//  WeatherApp
//
//  Created by Mykola Savoniuk on 5/24/18.
//  Copyright © 2018 Mykola Savoniuk. All rights reserved.
//

import Foundation

final class WeatherProvider<ModelType>: ObservableObject, AlamofireRequest
    where ModelType: Decodable
{
    var result: ModelType?
    let url: URL
    let parameters: [String: String]
    
    init(with url: URL, parameters: [String: String]) {
        self.url = url
        self.parameters = parameters
    }

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
