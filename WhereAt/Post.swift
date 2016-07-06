//
//  Post.swift
//  WhereAt
//
//  Created by Nicholas Laughter on 7/5/16.
//  Copyright © 2016 Nicholas Laughter. All rights reserved.
//

import Foundation
import CoreLocation
import CloudKit
import Contacts

class Post {
    
    let location: CLLocation
    let creator: CNContact
    let timestamp: NSDate
    
    init(location: CLLocation, creator: CNContact, timestamp: NSDate) {
        self.location = location
        self.creator = creator
        self.timestamp = timestamp
    }
}