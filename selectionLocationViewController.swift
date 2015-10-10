//
//  selectionLocationViewController.swift
//  ParkFind
//
//  Created by Eric Seo on 10/10/15.
//  Copyright © 2015 SeoEricc. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class selectLocationViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet var theMap: MKMapView!
    var locManager = CLLocationManager()
    var currentLocation: CLLocation!
    let regionRadius: CLLocationDistance = 1000
    
    override func viewDidLoad() {
    locManager.delegate = self
    locManager.desiredAccuracy = kCLLocationAccuracyBest
    locManager.requestWhenInUseAuthorization()
    locManager.startUpdatingLocation()
    }
    
    func centerMapOnLocation(location: CLLocation) {
    let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
    theMap.setRegion(coordinateRegion, animated: true)
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    locManager.stopUpdatingLocation()
    currentLocation = locManager.location
    centerMapOnLocation(currentLocation)
    }
    
}