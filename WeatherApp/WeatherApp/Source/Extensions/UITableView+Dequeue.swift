//
//  UITableView+Dequeue.swift
//  WeatherApp
//
//  Created by Mykola Savoniuk on 5/18/18.
//  Copyright © 2018 Mykola Savoniuk. All rights reserved.
//

import UIKit

extension UITableView {
    func dequeueReusableCell(withCellClass cellClass: AnyClass) -> UITableViewCell? {
        return self.dequeueReusableCell(withIdentifier: toString(cellClass))
    }
    
    func dequeueReusableCell(withCellClass cellClass: AnyClass, for indexPath: IndexPath) -> UITableViewCell {
        return self.dequeueReusableCell(withIdentifier: toString(cellClass), for: indexPath)
    }
}
