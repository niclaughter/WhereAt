//
//  PostListTableViewController.swift
//  WhereAt
//
//  Created by Nicholas Laughter on 6/30/16.
//  Copyright © 2016 Nicholas Laughter. All rights reserved.
//

import UIKit
import CloudKit

class PostListTableViewController: UITableViewController {
    
    private let postCellKey = "postCell"
    let cloudKitManager = CloudKitManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerNib(UINib(nibName: "PostTableViewCell", bundle: nil), forCellReuseIdentifier: postCellKey)
        tableView.contentInset = UIEdgeInsetsMake(20.0, 0.0, 0.0, 0.0)
    }
    
    func queryPosts() {
//        let query = CKQuery(recordType: "Post", predicate: NSPredicate(format: <#T##String#>, <#T##args: CVarArgType...##CVarArgType#>)
//        cloudKitManager.publicDatabase.performQuery(<#T##query: CKQuery##CKQuery#>, inZoneWithID: <#T##CKRecordZoneID?#>, completionHandler: <#T##([CKRecord]?, NSError?) -> Void#>)
    }
    
    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MockData.shared.mockLocations.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier(postCellKey) as? PostTableViewCell else { return UITableViewCell() }
        let location = MockData.shared.mockLocations[indexPath.row]
        cell.updateWithLocation(location)
        return cell
    }
    
    // MARK: - Navigation
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        presentViewController(PostDetailViewController(), animated: true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    }
}