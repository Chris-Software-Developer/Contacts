//
//  ViewController.swift
//  Contacts
//
//  Created by Christopher Smith on 11/8/17.
//  Copyright © 2017 Christopher Smith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
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
}
