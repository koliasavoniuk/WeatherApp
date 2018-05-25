//
//  FavoritePlacesView.swift
//  WeatherApp
//
//  Created by Mykola Savoniuk on 5/15/18.
//  Copyright © 2018 Mykola Savoniuk. All rights reserved.
//

import UIKit

class FavoritePlacesView: UIView {

    // MARK: - Outlets
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var backgroundImageView: UIImageView!
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.prepareView()
    }
    
    // MARK: - Private
    
    private func prepareView() {
        self.backgroundImageView.image = UIImage(named: "cloudy_background")
        self.collectionView.backgroundView = self.backgroundImageView
    }
}
