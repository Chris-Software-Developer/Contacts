//
//  ContactDetailViewController.swift
//  Contacts
//
//  Created by Christopher Smith on 11/9/17.
//  Copyright © 2017 Christopher Smith. All rights reserved.
//

import UIKit

class ContactDetailViewController: UIViewController {
    
    var person: Person?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        
        guard let person = person else {
            print("Error: No Person Available")
            return
        }
        
        self.title = person.name
        
        self.nameLabel.text = person.name
        self.ageLabel.text = "\(person.age)"
        self.infoLabel.text = person.about
    }
}

