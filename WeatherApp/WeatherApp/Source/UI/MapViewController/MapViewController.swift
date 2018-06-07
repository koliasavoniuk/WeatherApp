//
//  MapViewController.swift
//  WeatherApp
//
//  Created by Mykola Savoniuk on 5/29/18.
//  Copyright © 2018 Mykola Savoniuk. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet var rootView: MapView!
    
    // MARK: - ViewController Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureView()
        self.addStartPin()
    }

    // MARK: - Action

    @IBAction func onAddPin(_ sender: UILongPressGestureRecognizer) {
        let location = sender.location(in: self.rootView.mapView)
        let locationCoord = self.rootView.mapView.convert(location, toCoordinateFrom: self.rootView.mapView)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = locationCoord
        annotation.title = Strings.chosen_location.rawValue
        
        SharedLocation.sharedInstance.coordinates = locationCoord
        
        self.rootView.mapView.removeAnnotations(self.rootView.mapView.annotations)
        self.rootView.mapView.addAnnotation(annotation)
    }
    
    // MARK: - Private
    
    private func addStartPin() {
        let annotation = MKPointAnnotation()
        annotation.coordinate = SharedLocation.sharedInstance.coordinates
        annotation.title = Strings.current_location.rawValue
        self.rootView.mapView.centerCoordinate = SharedLocation.sharedInstance.coordinates
        
        self.rootView.mapView.addAnnotation(annotation)
    }
    
    private func configureView() {
        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationItem.title = VCTitles.map.rawValue
    }
}
