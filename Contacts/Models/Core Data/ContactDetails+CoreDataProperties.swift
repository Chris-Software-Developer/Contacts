//
//  ContactDetails+CoreDataProperties.swift
//  Contacts
//
//  Created by Christopher Smith on 11/11/17.
//  Copyright © 2017 Christopher Smith. All rights reserved.
//
//

import Foundation
import CoreData

extension ContactDetails {
    
    @NSManaged public var name: String?
    @NSManaged public var age: Int16
    @NSManaged public var about: String?

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ContactDetails> {
        return NSFetchRequest<ContactDetails>(entityName: "ContactDetails")
    }
}
