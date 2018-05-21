//
//  DailyForecastViewController.swift
//  WeatherApp
//
//  Created by Mykola Savoniuk on 5/14/18.
//  Copyright © 2018 Mykola Savoniuk. All rights reserved.
//

import UIKit

class DailyForecastViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var rootView: DailyForecastView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.configureView()
        self.configureTableVC()
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: DailyForecastTableViewCell?
        cell = cast(tableView.dequeueReusableCell(withCellClass: DailyForecastTableViewCell.self, for: indexPath))
        
        cell?.dateLabel.text = "dateLabel"
        
        return cell ?? UITableViewCell()
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    // MARK: - Private
    
    private func configureView() {
        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = VCTitles.daily.rawValue
    }
    
    private func configureTableVC() {
        self.rootView.tableView.register(cells: DailyForecastTableViewCell.self)
    }
}
