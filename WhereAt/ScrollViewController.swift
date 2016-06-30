//
//  ScrollViewController.swift
//  WhereAt
//
//  Created by Nicholas Laughter on 6/30/16.
//  Copyright © 2016 Nicholas Laughter. All rights reserved.
//

import UIKit

class ScrollViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpScrollView(scrollView)
    }
    
    func setUpScrollView(scrollView: UIScrollView) {
        scrollView.contentOffset = CGPointMake(self.view.frame.size.width, 0)
        
        let friendListVC = FriendListViewController(nibName: "FriendListViewController", bundle: nil)
        
        self.addChildViewController(friendListVC)
        self.scrollView.addSubview(friendListVC.view)
        friendListVC.didMoveToParentViewController(self)
        
        let mapViewController = MapViewController(nibName: "MapViewController", bundle: nil)
        
        var frame2 = mapViewController.view.frame
        frame2.origin.x = self.view.frame.size.width
        mapViewController.view.frame = frame2
        
        self.addChildViewController(mapViewController)
        self.scrollView.addSubview(mapViewController.view)
        mapViewController.didMoveToParentViewController(self)
        
        let postListTableViewController = PostListTableViewController(nibName: "PostListTableViewController", bundle: nil)
        
        var frame3 = postListTableViewController.view.frame
        frame3.origin.x = self.view.frame.size.width * 2.0
        postListTableViewController.view.frame = frame3
        
        self.addChildViewController(postListTableViewController)
        self.scrollView.addSubview(postListTableViewController.view)
        postListTableViewController.didMoveToParentViewController(self)
        
        self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width * 3.0, self.view.frame.size.height)
    }
}
