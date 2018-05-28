//
//  CurrentForecastView.swift
//  WeatherApp
//
//  Created by Mykola Savoniuk on 5/14/18.
//  Copyright © 2018 Mykola Savoniuk. All rights reserved.
//

import UIKit

class CurrentForecastView: UIView, ImageByDescription {
    
     // MARK: - Outlets
    
    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var windspeedLabel: UILabel!
    @IBOutlet var pressureLabel: UILabel!
    @IBOutlet var humidityLabel: UILabel!
    @IBOutlet var weatherImage: UIImageView!
    @IBOutlet var weatherDescription: UILabel!
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Outlets
    
    func fill(with model: CurrentWeatherModel) {
        self.temperatureLabel.text = String(model.main.temperature)
        self.windspeedLabel.text = String(model.wind.speed)
        self.pressureLabel.text = String(model.main.pressure)
        self.humidityLabel.text = String(model.main.humidity)
        self.weatherImage.image = self.image(by: model.description.first)
        self.weatherDescription.text = String(describing: model.description.first?.description ?? "")
    }
}
