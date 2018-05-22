//
//  CurrentForecastViewController.swift
//  WeatherApp
//
//  Created by Mykola Savoniuk on 5/14/18.
//  Copyright © 2018 Mykola Savoniuk. All rights reserved.
//

import UIKit

class CurrentForecastViewController: UIViewController, ObservableObjectDelegate {

    // MARK: - Properties
    
    private var coordsWeatherProvider: CoordsWeatherProvider?
    
    // MARK: - ViewController Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureView()
        
        var coordsWeatherProvider = self.coordsWeatherProvider
        coordsWeatherProvider = CoordsWeatherProvider()
        coordsWeatherProvider?.delegate = self
        coordsWeatherProvider?.execute()
    }
    
    // MARK: - Private
    
    private func configureView() {
        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = VCTitles.current.rawValue
    }
    
    // MARK: - Observable Object Delegate
    
    func modelWillLoad(observableObject: AnyObject) {
        print("ModelWillLoad")
    }
    
    func modelDidLoad(observableObject: AnyObject) {
        print("ModelDidLoad")
    }
    
    func modelNotLoaded(observableObject: AnyObject) {
        print("ModelNotLoaded")
    }
    
    func modelFailLoading(observableObject: AnyObject, error: String) {
        print("ModelFailLoading")
    }
}
