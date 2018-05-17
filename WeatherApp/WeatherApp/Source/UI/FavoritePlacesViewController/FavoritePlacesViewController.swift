//
//  FavoritePlacesViewController.swift
//  WeatherApp
//
//  Created by Mykola Savoniuk on 5/15/18.
//  Copyright © 2018 Mykola Savoniuk. All rights reserved.
//

import UIKit

class FavoritePlacesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Favorite"
    }
}
