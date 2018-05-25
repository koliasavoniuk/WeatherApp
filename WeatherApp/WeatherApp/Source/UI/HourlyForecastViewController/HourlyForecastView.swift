//
//  HourlyForecastView.swift
//  WeatherApp
//
//  Created by Mykola Savoniuk on 5/14/18.
//  Copyright © 2018 Mykola Savoniuk. All rights reserved.
//

import UIKit

class HourlyForecastView: UIView {
    
    // MARK: - Outlets
    @IBOutlet var tableView: UITableView!
    @IBOutlet var backgroundImageView: UIImageView!
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.prepareView()
    }

    // MARK: - Private
    
    private func prepareView() {
        self.backgroundImageView.image = UIImage(named: "cloudy_background")
        self.tableView.backgroundView = self.backgroundImageView
    }
}
