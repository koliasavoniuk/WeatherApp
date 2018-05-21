//
//  UICollectionView+Dequeue.swift
//  WeatherApp
//
//  Created by Mykola Savoniuk on 5/21/18.
//  Copyright © 2018 Mykola Savoniuk. All rights reserved.
//

import UIKit

extension UICollectionView {
    func dequeueReusableCell(withCellClass cellClass: AnyClass, for indexPath: IndexPath) -> UICollectionViewCell? {
        return self.dequeueReusableCell(withReuseIdentifier: toString(cellClass), for: indexPath)
    }
}
