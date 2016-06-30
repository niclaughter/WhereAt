//
//  Extensions.swift
//  WhereAt
//
//  Created by Nicholas Laughter on 6/30/16.
//  Copyright © 2016 Nicholas Laughter. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func hideKeyboardWhenSwipeDown() {
        let swipe: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        swipe.direction = .Down
        view.addGestureRecognizer(swipe)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}