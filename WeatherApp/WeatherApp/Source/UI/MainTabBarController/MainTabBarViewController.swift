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

    }

    // MARK: - Private
    
    private func configureTabBar() {
        //let hourlyForecastVC = createNavController(viewController: HourlyForecastViewController(), with: <#T##UIImage#>)
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
