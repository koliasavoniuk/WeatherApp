//
//  MainTabBarViewController.swift
//  WeatherApp
//
//  Created by Mykola Savoniuk on 5/14/18.
//  Copyright © 2018 Mykola Savoniuk. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    // MARK: - ViewController lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.configureTabBar()
    }

    // MARK: - Private
    
    private func configureTabBar() {
        let hourlyIcon = UIImage(named: PictureName.hourly_icon.rawValue) ?? UIImage()
        let dailyIcon = UIImage(named: PictureName.daily_icon.rawValue) ?? UIImage()
        //let settingsIcon = UIImage(named: PictureName.settings_icon.rawValue) ?? UIImage()
        
        let hourlyForecastVC = createNavController(viewController: HourlyForecastViewController(), with: hourlyIcon)
        let dailyForecastVC = createNavController(viewController: DailyForecastViewController(), with: dailyIcon)
        
        viewControllers = [hourlyForecastVC, dailyForecastVC]
    }
}

extension UITabBarController {
    func createNavController(viewController: UIViewController, with image: UIImage) -> UINavigationController{
        let vc = viewController
        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem.image = image
        
        return navController
    }
}
