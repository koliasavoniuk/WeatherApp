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
    private var currentWeatherProvider: CurrentWeatherProvider<CurrentWeatherModel>?
    
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
        self.currentWeatherProvider = CurrentWeatherProvider()
        self.currentWeatherProvider?.delegate = self
        self.currentWeatherProvider?.execute()
    }
    
    // MARK: - Observable Object Delegate
    
    func modelWillLoad(observableObject: AnyObject) {
        print("ModelWillLoad")
    }
    
    func modelDidLoad(observableObject: AnyObject) {
        self.currentWeatherProvider?.result.map {
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
