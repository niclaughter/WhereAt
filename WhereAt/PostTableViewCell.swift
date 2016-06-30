//
//  PostTableViewCell.swift
//  WhereAt
//
//  Created by Nicholas Laughter on 6/30/16.
//  Copyright © 2016 Nicholas Laughter. All rights reserved.
//

import UIKit
import MapKit

class PostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func hitTest(point: CGPoint, withEvent event: UIEvent?) -> UIView? {
        return self
    }
    
    func updateWithLocation(location: CLLocation) {
        let coordinateRegionWithMeters = MKCoordinateRegionMakeWithDistance(location.coordinate, 50, 50)
        mapView.region = coordinateRegionWithMeters
        mapView.centerCoordinate = location.coordinate
    }
}