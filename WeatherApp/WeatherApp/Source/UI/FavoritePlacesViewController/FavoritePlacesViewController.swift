//
//  FavoritePlacesViewController.swift
//  WeatherApp
//
//  Created by Mykola Savoniuk on 5/15/18.
//  Copyright © 2018 Mykola Savoniuk. All rights reserved.
//

import UIKit

fileprivate enum collectionViewSettings: Int {
    case spacing = 10
    case itemsCount = 2
}

class FavoritePlacesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    @IBOutlet var rootView: FavoritePlacesView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.configureView()
        self.configureCollectionView()
    }
    
    // MARK: - CollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionViewSettings.itemsCount.rawValue
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: FavoritePlacesCollectionViewCell? = cast(collectionView.dequeueReusableCell(withCellClass: FavoritePlacesCollectionViewCell.self, for: indexPath))
        
        return cell ?? UICollectionViewCell()
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.rootView.frame.size.width
        let itemsCount = collectionViewSettings.itemsCount.rawValue
        let spacing = collectionViewSettings.spacing.rawValue
        
        let itemSize = (Int(width) - (itemsCount + 1) * spacing) / itemsCount
        
        return CGSize(width: itemSize, height: itemSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(collectionViewSettings.spacing.rawValue)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(collectionViewSettings.spacing.rawValue)
    }
    
    // MARK: - Private
    
    private func configureView() {
        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = VCTitles.favorite.rawValue
    }
    
    private func configureCollectionView() {
        self.rootView.collectionView.register(cellClass: FavoritePlacesCollectionViewCell.self)
    }
}
