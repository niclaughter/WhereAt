//
//  MainToPostListUnwind.swift
//  WhereAt
//
//  Created by Nicholas Laughter on 6/29/16.
//  Copyright © 2016 Nicholas Laughter. All rights reserved.
//

import UIKit

class MainToPostListUnwind: UIStoryboardSegue {

    override func perform() {
        let destinationVCview = self.sourceViewController.view as UIView
        let sourceVCview = self.destinationViewController.view as UIView
        let screenWidth = UIScreen.mainScreen().bounds.size.width
        
        guard let window = UIApplication.sharedApplication().keyWindow else { return }
        window.insertSubview(sourceVCview, aboveSubview: destinationVCview)
        
        UIView.animateWithDuration(0.4, animations: { 
            sourceVCview.frame = CGRectOffset(sourceVCview.frame, screenWidth, 0.0)
            destinationVCview.frame = CGRectOffset(destinationVCview.frame, screenWidth, 0.0)
            }) { (_) in
                self.sourceViewController.dismissViewControllerAnimated(false, completion: nil)
        }
    }
}
