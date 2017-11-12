//
//  ViewController.swift
//  Contacts
//
//  Created by Christopher Smith on 11/8/17.
//  Copyright © 2017 Christopher Smith. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    // MARK: Properties
    
    var contactForSegue: ContactDetails?
    
    var contacts = [ContactDetails]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    // MARK: IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchContacts()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.fetchContacts()
    }
    
    // MARK: - IBActions
    
    @IBAction func addContactButtonPushed(_ sender: Any) {
        self.performSegue(withIdentifier: "addContactSegueID", sender: nil)
    }
    
    // MARK: - Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "contactDetailSegueID" {
            
            guard let contact = self.contactForSegue else {
                print("Could not get contact.")
                return
            }
            
            let controller = segue.destination as! ContactDetailViewController
            controller.contact = contact
        }
    }
    
    // MARK: - Convenience Methods
    
    private func fetchContacts() {
        
        let fetchRequest: NSFetchRequest<ContactDetails> = ContactDetails.fetchRequest()
        
        do {
            let contacts = try CoreData.context.fetch(fetchRequest)
            self.contacts = contacts
            
        } catch let error {
            print("There was an error: \(error.localizedDescription)")
        }
    }
}

// MARK: - UITableView

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        let contact = self.contacts[indexPath.row]
        
        cell.textLabel?.text = contact.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let contact = self.contacts[indexPath.row]
        self.contactForSegue = contact
        
        self.performSegue(withIdentifier: "contactDetailSegueID", sender: nil)
    }
}
