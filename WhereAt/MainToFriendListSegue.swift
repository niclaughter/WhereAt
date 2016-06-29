//
//  MainToFriendListSegue.swift
//  WhereAt
//
//  Created by Nicholas Laughter on 6/29/16.
//  Copyright © 2016 Nicholas Laughter. All rights reserved.
//

import UIKit

class MainToFriendListSegue: UIStoryboardSegue {

    override func perform() {
        guard let window = UIApplication.sharedApplication().keyWindow else { return }
        let sourceVCView = self.sourceViewController.view as UIView
        let destinationVCView = self.destinationViewController.view as UIView
        
        let screenWidth = UIScreen.mainScreen().bounds.size.width
        let screenHeight = UIScreen.mainScreen().bounds.size.height
        
        destinationVCView.frame = CGRectMake(0.0, screenHeight, screenWidth, screenHeight)
        
        window.insertSubview(destinationVCView, aboveSubview: sourceVCView)
        
        UIView.animateWithDuration(0.4, animations: {
            sourceVCView.frame = CGRectOffset(sourceVCView.frame, screenWidth, 0.0)
            destinationVCView.frame = CGRectOffset(destinationVCView.frame, screenWidth, 0.0)
        }) { (_) in
            guard let destinationViewController = self.destinationViewController as? FriendListViewController else { return }
            self.sourceViewController.presentViewController(destinationViewController, animated: false, completion: nil)
        }
    }
}
