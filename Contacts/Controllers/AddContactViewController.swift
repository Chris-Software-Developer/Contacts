//
//  AddContactViewController.swift
//  Contacts
//
//  Created by Christopher Smith on 11/10/17.
//  Copyright © 2017 Christopher Smith. All rights reserved.
//

import UIKit

class AddContactViewController: UIViewController {
    
    @IBOutlet weak var contactNameTextField: UITextField!
    @IBOutlet weak var contactAgeTextField: UITextField!
    @IBOutlet weak var contactAboutTextField: UITextField!
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        
        guard
            let name = self.contactNameTextField.text,
            let ageString = self.contactAgeTextField.text,
            let age = Int(ageString),
            let about = self.contactAboutTextField.text else {
                print("Missing user details.")
                return
        }
        
        let newContact = Contact(name: name, age: age, about: about)
        
        self.saveContact(contact: newContact)
    
        self.navigationController?.popViewController(animated: true)
    }
    
    private func saveContact(contact: Contact) {
        
        let contactDetails = ContactDetails(context: CoreData.context)
        
        contactDetails.name = contact.name
        contactDetails.age = Int16(contact.age)
        contactDetails.about = contact.about
        
        do {
            try CoreData.context.save()
        } catch let error {
            print("Error while saving new contact: \(error.localizedDescription)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Add Contact"
    }
}
