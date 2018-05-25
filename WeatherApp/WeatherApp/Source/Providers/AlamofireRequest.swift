//
//  AlamofireRequest.swift
//  WeatherApp
//
//  Created by Mykola Savoniuk on 5/24/18.
//  Copyright © 2018 Mykola Savoniuk. All rights reserved.
//

import Foundation
import Alamofire

protocol AlamofireRequest {
    
    func request(with url: URL, parameters: [String: String], completion: @ escaping (Result<Data>) -> ())
    
}

extension Result {
    init(with object: Value?, error: Error?, ´default´: Error) {
        if let data = object {
            self = .success(data)
        } else if let error = error {
            self = .failure(error)
        } else {
            self = .failure(´default´)
        }
    }
}

enum AlamofireErrors: Error {
    case defaultError
}

extension AlamofireRequest {
    
    func request(with url: URL, parameters: [String: String], completion: @ escaping (Result<Data>) -> ()) {
        Alamofire
            .request(
                url,
                method: .get,
                parameters: parameters
            )
            .validate()
            .responseJSON { (response) -> Void in
                completion(
                    Result(
                        with: response.data,
                        error: response.error,
                        ´default´: AlamofireErrors.defaultError
                    )
                )
        }
    }
    
}
