//
//  FriendListViewController.swift
//  WhereAt
//
//  Created by Nicholas Laughter on 6/30/16.
//  Copyright © 2016 Nicholas Laughter. All rights reserved.
//

import UIKit
import Contacts

class FriendListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var friends = [CNContact]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    @IBOutlet private weak var tableView: UITableView!
    private let friendCellKey = "friendCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerNib(UINib(nibName: "FriendTableViewCell", bundle: nil), forCellReuseIdentifier: friendCellKey)
        tableView.contentInset = UIEdgeInsetsMake(20.0, 0.0, 0.0, 0.0)
        
        getContacts()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier(friendCellKey) as? FriendTableViewCell else { return UITableViewCell() }
        let friend = friends[indexPath.row]
        cell.updateWithFriend(friend)
        return cell
    }
    
    func getContacts() {
        
        CloudKitManager.shared.fetchAllDiscoverableUsers { userInfoRecords in
            
            if let userInfoRecords = userInfoRecords {
                self.friends = userInfoRecords.flatMap { $0.displayContact }
            }
            
        }
        /*
        // make sure user hadn't previously denied access
        let status = CNContactStore.authorizationStatusForEntityType(.Contacts)
        if status == .Denied || status == .Restricted {
            // user previously denied, so tell them to fix that in settings
            return
        }
        
        // open it
        let store = CNContactStore()
        store.requestAccessForEntityType(.Contacts) { granted, error in
            guard granted else {
                dispatch_async(dispatch_get_main_queue()) {
                    // user didn't grant authorization, so tell them to fix that in settings
                    print(error)
                }
                return
            }
            
            // get the contacts
            let request = CNContactFetchRequest(keysToFetch: [CNContactIdentifierKey, CNContactFormatter.descriptorForRequiredKeysForStyle(.FullName)])
            do {
                try store.enumerateContactsWithFetchRequest(request) { contact, stop in
                    if contact.givenName.characters.count > 0 {
                        self.friends.append(contact)
                    }
                }
                self.friends.sortInPlace { $0.givenName < $1.givenName }
                self.tableView.reloadData()
            } catch {
                print(error)
            }
        }*/
    }
}