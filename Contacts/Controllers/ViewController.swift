//
//  ViewController.swift
//  Contacts
//
//  Created by Christopher Smith on 11/8/17.
//  Copyright © 2017 Christopher Smith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var contactForSegue: Person?
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Person.mockData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        let person = Person.mockData[indexPath.row]
        cell.textLabel?.text = person.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let person = Person.mockData[indexPath.row]
        self.contactForSegue = person
        
        self.performSegue(withIdentifier: "contactDetailSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let contact = self.contactForSegue else {
            print("Could not get contact.")
            return
        }
        
        if segue.identifier == "contactDetailSegue" {
            
            let controller = segue.destination as! ContactDetailViewController
            controller.person = contact
        }
    }
}
