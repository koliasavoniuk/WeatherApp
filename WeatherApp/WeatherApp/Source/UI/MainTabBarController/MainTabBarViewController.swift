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

        self.tabBar.tintColor = UIColor.black
        self.configureTabBar()
    }

    // MARK: - Private
    
    private func configureTabBar() {
        let hourlyIcon = UIImage(named: PictureName.hourly_icon.rawValue) ?? UIImage()
        let currentIcon = UIImage(named: PictureName.current_icon.rawValue) ?? UIImage()
        let mapIcon = UIImage(named: PictureName.map_icon.rawValue) ?? UIImage()
        
        let currentForecastVC = createNavController(viewController: CurrentForecastViewController(), with: currentIcon)
        let hourlyForecastVC = createNavController(viewController: HourlyForecastViewController(), with: hourlyIcon)
        let mapVC = createNavController(viewController: MapViewController(), with: mapIcon)
        
        viewControllers = [currentForecastVC, hourlyForecastVC, mapVC]
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
