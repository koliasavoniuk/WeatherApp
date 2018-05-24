//
//  HourlyForecastViewController.swift
//  WeatherApp
//
//  Created by Mykola Savoniuk on 5/14/18.
//  Copyright © 2018 Mykola Savoniuk. All rights reserved.
//

import UIKit

class HourlyForecastViewController: UIViewController, ObservableObjectDelegate, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Properties
    
    @IBOutlet var rootView: HourlyForecastView!
    private var hourlyForecastProvider: HourlyForecastProvider<HourlyForecastModel>?
    
    // MARK: - ViewController Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.configureView()
        self.configureTableVC()
        self.startProvider()
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.hourlyForecastProvider?.result?.list.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:HourlyForecastTableViewCell? = cast(tableView.dequeueReusableCell(withCellClass: HourlyForecastTableViewCell.self, for: indexPath))
        
        self.hourlyForecastProvider?.result.map {
            cell?.fill(with: $0.list[indexPath.row])
        }
        
        return cell ?? UITableViewCell()
    }
    
    // MARK: - Private
    
    private func configureView() {
        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = VCTitles.hourly.rawValue
    }
    
    private func startProvider() {
        self.hourlyForecastProvider = HourlyForecastProvider()
        self.hourlyForecastProvider?.delegate = self
        self.hourlyForecastProvider?.execute()
    }
    
    private func configureTableVC() {
        self.rootView.tableView.register(cells: HourlyForecastTableViewCell.self)
    }
    
    // MARK: - Observable Object Delegate
    
    func modelWillLoad(observableObject: AnyObject) {
        print("ModelWillLoad")
    }
    
    func modelDidLoad(observableObject: AnyObject) {
        self.rootView.tableView.reloadData()
    }
    
    func modelNotLoaded(observableObject: AnyObject) {
        print("ModelNotLoaded")
    }
    
    func modelFailLoading(observableObject: AnyObject, error: String) {
        print("ModelFailLoading")
    }
}
