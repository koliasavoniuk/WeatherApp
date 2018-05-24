//
//  HourlyForecastTableViewCell.swift
//  WeatherApp
//
//  Created by Mykola Savoniuk on 5/18/18.
//  Copyright © 2018 Mykola Savoniuk. All rights reserved.
//

import UIKit

class HourlyForecastTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var weekdayLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var weatherImage: UIImageView!
    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var windSpeedLabel: UILabel!
    @IBOutlet var pressureLabel: UILabel!
    @IBOutlet var humidityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: - Public
    
    func fill(with model: HourlyForecastItem) {
        self.temperatureLabel.text = String(model.main.temperature)
        self.windSpeedLabel.text = String(model.wind.speed)
        self.pressureLabel.text = String(model.main.pressure)
        self.humidityLabel.text = String(model.main.humidity)
    }
}
