//
//  FriendTableViewCell.swift
//  WhereAt
//
//  Created by Nicholas Laughter on 7/1/16.
//  Copyright © 2016 Nicholas Laughter. All rights reserved.
//

import UIKit
import Contacts

class FriendTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    func updateWithFriend(friend: CNContact) {
        var returnedName = "\(friend.givenName)"
        if let lastInitial = friend.familyName.characters.first {
            returnedName += " \(lastInitial)."
        }
        nameLabel.text = returnedName
    }
}
