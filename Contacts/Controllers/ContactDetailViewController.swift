//
//  ContactDetailViewController.swift
//  Contacts
//
//  Created by Christopher Smith on 11/9/17.
//  Copyright © 2017 Christopher Smith. All rights reserved.
//

import UIKit

class ContactDetailViewController: UIViewController {
    
    var contact: Contact?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        
        guard let contact = contact else {
            print("Error: No Contact Available")
            return
        }
        
        self.title = contact.name
        
        self.nameLabel.text = contact.name
        self.ageLabel.text = "\(contact.age)"
        self.infoLabel.text = contact.about
    }
}

