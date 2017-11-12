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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Add Contact"
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        
        guard
            let name = self.contactNameTextField.text,
            let ageString = self.contactAgeTextField.text,
            let age = Int(ageString),
            let about = self.contactAboutTextField.text else {
                print("Missing user details.")
                return
        }
        
        let newContact = Contact(context: CoreData.context)
        
        newContact.name = name
        newContact.age = Int16(age)
        newContact.about = about
        
        self.saveContext()
        
        self.navigationController?.popViewController(animated: true)
    }
    
    private func saveContext() {
        
        do {
            try CoreData.context.save()
        } catch let error {
            print("Error while saving new contact: \(error.localizedDescription)")
        }
    }
}
