//
//  PostController.swift
//  WhereAt
//
//  Created by Nicholas Laughter on 7/6/16.
//  Copyright © 2016 Nicholas Laughter. All rights reserved.
//

import Foundation
import CoreLocation
import CloudKit

class PostController {
    
    static let shared = PostController()
    var posts = [Post]()
    
    func createPost(location: CLLocation, comment: String?) {
        let postRecord = CKRecord(recordType: "Post")
        postRecord["location"] = location
        if let comment = comment where comment.characters.count > 0 {
            postRecord["comment"] = comment
        }
        CloudKitManager.shared.saveRecord(postRecord, completion: nil)
    }
    
    func fetchPosts() {
        let date = NSDate(timeInterval: -60.0 * 120, sinceDate: NSDate())
        let predicate = NSPredicate(format: "creationDate > %@", date)
        let query = CKQuery(recordType: "Post", predicate: predicate)
        CloudKitManager.shared.publicDatabase.performQuery(query, inZoneWithID: nil) { results, error in
            if error != nil {
                print(error?.localizedDescription)
            }
            else {
                if let results = results {
                    for result in results {
//                        posts.append(Post(location: <#T##CLLocation#>, creator: <#T##CNContact#>, timestamp: <#T##NSDate#>)
                    }
                }
            }
        }
    }
}