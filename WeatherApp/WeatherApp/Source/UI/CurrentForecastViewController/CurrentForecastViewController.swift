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
    
    @IBOutlet var rootView: CurrentForecastView!
    private var weatherProvider: WeatherProvider<CurrentWeatherModel>?
    
    // MARK: - ViewController Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureView()
        self.startProvider()
    }
    
    // MARK: - Private
    
    private func configureView() {
        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = VCTitles.current.rawValue
    }
    
    private func startProvider() {
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather") ?? URL(fileURLWithPath: "")
        
        let parameters = [
            "q": "Kyiv",
            "units": "metric",
            "APPID" : "e6274a1ed80da6b1a0f04eaaaf73806c"
        ]
        
        self.weatherProvider = WeatherProvider(with: url, parameters: parameters)
        self.weatherProvider?.delegate = self
        self.weatherProvider?.execute()
    }
    
    // MARK: - Observable Object Delegate
    
    func modelWillLoad(observableObject: AnyObject) {
        print("ModelWillLoad")
    }
    
    func modelDidLoad(observableObject: AnyObject) {
        self.weatherProvider?.result.map {
            self.rootView.fill(with: $0)
        }
    }
    
    func modelNotLoaded(observableObject: AnyObject) {
        print("ModelNotLoaded")
    }
    
    func modelFailLoading(observableObject: AnyObject, error: String) {
        print("ModelFailLoading")
    }
}
