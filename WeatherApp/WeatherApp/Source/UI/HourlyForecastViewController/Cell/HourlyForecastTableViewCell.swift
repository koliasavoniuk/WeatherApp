//
//  HourlyForecastTableViewCell.swift
//  WeatherApp
//
//  Created by Mykola Savoniuk on 5/18/18.
//  Copyright © 2018 Mykola Savoniuk. All rights reserved.
//

import UIKit

final class HourlyForecastTableViewCell: UITableViewCell, ImageByDescription {
    
    // MARK: - Outlets
    
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var weekdayLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var weatherImage: UIImageView!
    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var windSpeedLabel: UILabel!
    @IBOutlet var pressureLabel: UILabel!
    @IBOutlet var humidityLabel: UILabel!
    
    // MARK: - Public
    
    // Formatter created once in controller,
    //because creating new DateFormatter for every cell is very expensive operation
    func fill(with model: HourlyForecastItem, formatter: DateFormatter) {
        self.temperatureLabel.text = String(model.main.temperature) + " °C"
        self.windSpeedLabel.text = String(model.wind.speed) + " M/S"
        self.pressureLabel.text = String(model.main.pressure) + " mm"
        self.humidityLabel.text = String(model.main.humidity) + " %"
        self.weatherImage.image = image(by: model.description.first)
        
        let date = Date(timeIntervalSince1970: TimeInterval(model.timestamp))
        self.processDate(date: date, formatter: formatter)
        
        self.backgroundColor = .clear
    }
    
    // MARK: - Private
    
    private func processDate(date: Date, formatter: DateFormatter) {
        let formatter = formatter
        formatter.dateFormat = "MMM dd/HH:mm"
        
        let splitDate = formatter.string(from: date).split(separator: "/")
        
        let weekDay = formatter.weekdaySymbols[Calendar.current.component(.weekday, from: date) - 1]
        
        self.weekdayLabel.text = weekDay
        self.dateLabel.text = String(splitDate[0])
        self.timeLabel.text = String(splitDate[1])

    }
}
