//
//  FriendTableViewCell.swift
//  WhereAt
//
//  Created by Nicholas Laughter on 7/1/16.
//  Copyright © 2016 Nicholas Laughter. All rights reserved.
//

import UIKit

class FriendTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    func updateWithFriend(friend: String) {
        nameLabel.text = friend
    }
}
