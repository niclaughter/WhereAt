//
//  MainMapViewController.swift
//  WhereAt
//
//  Created by Nicholas Laughter on 6/28/16.
//  Copyright © 2016 Nicholas Laughter. All rights reserved.
//

import UIKit
import MapKit

class MainMapViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    @IBOutlet var swipeLeft: UISwipeGestureRecognizer!
    @IBOutlet var swipeRight: UISwipeGestureRecognizer!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpMapView(mapView)
        swipeLeft.direction = .Left
        swipeRight.direction = .Right
    }
    
    @IBAction func swipeLeftSwiped(sender: UISwipeGestureRecognizer) {
        performSegueWithIdentifier("mainToPostListSegue", sender: self)
    }
    
    @IBAction func swipeRightSwiped(sender: UISwipeGestureRecognizer) {
        performSegueWithIdentifier("mainToFriendsSegue", sender: self)
    }
    
    func setUpMapView(mapView: MKMapView) {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 15
        locationManager.startUpdatingLocation()
        locationManager.requestWhenInUseAuthorization()
        
        guard let location = locationManager.location else { return }
        let coordinateRegionWithMeters = MKCoordinateRegionMakeWithDistance(location.coordinate, 25, 25)
        mapView.region = coordinateRegionWithMeters
        
        updateMap(mapView, location: location)
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let timestamp = location.timestamp
        let howRecent = timestamp.timeIntervalSinceNow
        if abs(howRecent) < 15.0 {
            updateMap(mapView, location: location)
        }
    }
    
    func updateMap(map: MKMapView, location: CLLocation) {
        map.centerCoordinate = location.coordinate
    }
}