//
//  PostListTableViewController.swift
//  WhereAt
//
//  Created by Nicholas Laughter on 6/30/16.
//  Copyright © 2016 Nicholas Laughter. All rights reserved.
//

import UIKit

class PostListTableViewController: UITableViewController {
    
    private let postCellKey = "postCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerNib(UINib(nibName: "PostTableViewCell", bundle: nil), forCellReuseIdentifier: postCellKey)
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