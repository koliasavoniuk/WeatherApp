//
//  FavoritePlacesCollectionViewCell.swift
//  WeatherApp
//
//  Created by Mykola Savoniuk on 5/18/18.
//  Copyright © 2018 Mykola Savoniuk. All rights reserved.
//

import UIKit

class FavoritePlacesCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var temperatureLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
