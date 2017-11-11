//
//  ViewController.swift
//  Contacts
//
//  Created by Christopher Smith on 11/8/17.
//  Copyright © 2017 Christopher Smith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var contactForSegue: Contact?
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Contact.mockData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        let contact = Contact.mockData[indexPath.row]
        cell.textLabel?.text = contact.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let contact = Contact.mockData[indexPath.row]
        self.contactForSegue = contact
        
        self.performSegue(withIdentifier: "contactDetailSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let contact = self.contactForSegue else {
            print("Could not get contact.")
            return
        }
        
        if segue.identifier == "contactDetailSegue" {
            
            let controller = segue.destination as! ContactDetailViewController
            controller.contact = contact
        }
    }
}
