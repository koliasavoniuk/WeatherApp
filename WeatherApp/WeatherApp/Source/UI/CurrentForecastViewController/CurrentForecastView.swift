//
//  CurrentForecastView.swift
//  WeatherApp
//
//  Created by Mykola Savoniuk on 5/14/18.
//  Copyright © 2018 Mykola Savoniuk. All rights reserved.
//

import UIKit

class CurrentForecastView: UIView {
    
     // MARK: - Outlets
    
    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var windspeedLabel: UILabel!
    @IBOutlet var pressureLabel: UILabel!
    @IBOutlet var humidityLabel: UILabel!
    @IBOutlet var weatherImage: UIImageView!
    @IBOutlet var weatherDescription: UILabel!
    @IBOutlet var backgroundImageView: UIImageView!
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.prepareView()
    }
    
    // MARK: - Outlets
    
    func fill(with model: CurrentWeatherModel) {
        self.temperatureLabel.text = String(model.main.temperature)
        self.windspeedLabel.text = String(model.wind.speed)
        self.pressureLabel.text = String(model.main.pressure)
        self.humidityLabel.text = String(model.main.humidity)
        self.weatherDescription.text = String(describing: model.description.first?.description ?? "")
    }
    
    // MARK: - Private
    
    private func prepareView() {
        self.backgroundImageView.image = UIImage(named: "cloudy_background")
    }
}
