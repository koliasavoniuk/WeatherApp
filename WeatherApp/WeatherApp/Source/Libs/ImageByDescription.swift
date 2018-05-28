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
                image = UIImage(named: "medium_cloud")!

            default:
                print("Fail")
            }
        
        return image
    }
}
