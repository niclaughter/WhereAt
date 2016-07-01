//
//  MockData.swift
//  WhereAt
//
//  Created by Nicholas Laughter on 6/30/16.
//  Copyright © 2016 Nicholas Laughter. All rights reserved.
//

import Foundation
import MapKit

class MockData {
    
    static let shared = MockData()
    
    let mockComments = [
        "Cool!",
        "On the way!",
        "Still there?Still there?Still there?Still there?Still there?Still there?Still there?Still there?Still there?Still there?Still there?Still there?Still there?Still there?Still there?Still there?Still there?Still there?",
    ]
    
    let mockLocations = [
        CLLocation(latitude: 40.281120, longitude: -111.685421),
        CLLocation(latitude: 40.761823, longitude: -111.890594),
        CLLocation(latitude: 40.766391, longitude: -111.891514),
        CLLocation(latitude: 40.286274, longitude: -111.687705),
    ]
    
    let mockFriends = [
        "Sean G.",
        "Ross M.",
        "Alan B",
        "Karl P.",
    ]
}