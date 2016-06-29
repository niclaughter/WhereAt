//
//  FriendListViewController.swift
//  WhereAt
//
//  Created by Nicholas Laughter on 6/29/16.
//  Copyright © 2016 Nicholas Laughter. All rights reserved.
//

import UIKit

class FriendListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var swipeLeft: UISwipeGestureRecognizer!

    override func viewDidLoad() {
        super.viewDidLoad()

        swipeLeft.direction = .Left
        tableView.addGestureRecognizer(swipeLeft)
    }

    @IBAction func swipeLeftSwiped(sender: UISwipeGestureRecognizer) {
        performSegueWithIdentifier("friendsToMainSegue", sender: self)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
