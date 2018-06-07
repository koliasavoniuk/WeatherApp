//
//  ImageByDescription.swift
//  WeatherApp
//
//  Created by Mykola Savoniuk on 5/28/18.
//  Copyright © 2018 Mykola Savoniuk. All rights reserved.
//

import UIKit

protocol ImageByDescription {
    func image(by description: Description?) -> UIImage
}

extension ImageByDescription {
    func image(by description: Description?) -> UIImage {
        var image = UIImage()
        
        let stringDescription = description?.description ?? ""
        
        switch stringDescription {
        case "broken clouds":
            image = UIImage(named: "overcast clouds") ?? UIImage()
        case "haze" :
            image = UIImage(named: "haze") ?? UIImage()
        case "mist" :
            image = UIImage(named: "haze") ?? UIImage()
        case "clear sky" :
                image = UIImage(named: "sunny") ?? UIImage()
        case "few clouds" :
            image = UIImage(named: "overcast clouds") ?? UIImage()
        case "scattered clouds" :
            image = UIImage(named: "scattered clouds") ?? UIImage()
        case "overcast clouds" :
            image = UIImage(named: "overcast clouds") ?? UIImage()
        case "light rain" :
            image = UIImage(named: "light rain") ?? UIImage()
        case "moderate rain" :
            image = UIImage(named: "light rain") ?? UIImage()
            default:
                print(stringDescription)
            }
        
        return image
    }
}
