//
//  MapViewController.swift
//  WhereAt
//
//  Created by Nicholas Laughter on 6/30/16.
//  Copyright © 2016 Nicholas Laughter. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, CLLocationManagerDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpMapView(mapView)
        hideKeyboardWhenSwipeDown()
        textField.delegate = self
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIKeyboardWillShowNotification, object: self.view.window)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIKeyboardWillHideNotification, object: self.view.window)
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
    
    // MARK: - Keyboard translation & scroll
    
    //    func scrollToBottom() {
    //        if messages.count > 0 {
    //            let indexPath = NSIndexPath(forRow: (messages.count - 1), inSection: 0)
    //            messageTableView.scrollToRowAtIndexPath(indexPath, atScrollPosition: .Bottom, animated: false)
    //        }
    //    }
    
    func keyboardWillShow(sender: NSNotification) {
        guard let userInfo: [NSObject: AnyObject] = sender.userInfo,
            keyboardSize: CGSize = userInfo[UIKeyboardFrameBeginUserInfoKey]?.CGRectValue.size,
            offset: CGSize = userInfo[UIKeyboardFrameEndUserInfoKey]?.CGRectValue.size else { return }
        if keyboardSize.height == offset.height && self.view.frame.origin.y == 0 {
            UIView.animateWithDuration(0.1, animations: {
                self.view.frame.origin.y -= keyboardSize.height
            })
        } else {
            UIView.animateWithDuration(0.1, animations: {
                self.view.frame.origin.y += (keyboardSize.height - offset.height)
            })
        }
        //        scrollToBottom()
    }
    
    func keyboardWillHide(sender: NSNotification) {
        guard let userInfo: [NSObject: AnyObject] = sender.userInfo,
            keyboardSize: CGSize = userInfo[UIKeyboardFrameBeginUserInfoKey]?.CGRectValue.size else { return }
        self.view.frame.origin.y  += keyboardSize.height
        //        scrollToBottom()
    }
}