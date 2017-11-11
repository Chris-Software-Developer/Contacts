//
//  Person.swift
//  Contacts
//
//  Created by Christopher Smith on 11/8/17.
//  Copyright © 2017 Christopher Smith. All rights reserved.
//

class Contact {
    
    var name: String
    var age: Int
    var about: String
    
    static var mockData = [Contact.init(name: "David Seitz Jr", age: 28, about: "iOS Developer in San Francisco"),
                           Contact.init(name: "Chris Smith", age: 27, about: "iOS Developer in Las Vegas"),
                           Contact.init(name: "Tracer", age: 25, about: "Speedy shooter"),
                           Contact.init(name: "Widowmaker", age: 30, about: "Sharp shooter"),
                           Contact.init(name: "Donald Trump", age: 0, about: "No really, he was never born. Puppets aren't born."),
                           Contact.init(name: "Joshua Seitz", age: 19, about: "Helped with the SF move"),
                           Contact.init(name: "Pikachu", age: 20, about: "The other fictional mouse character"),
                           Contact.init(name: "Jessica", age: 30, about: "Works the front desk at David's apartment")]
    
    init(name: String, age: Int, about: String) {
        self.name = name
        self.age = age
        self.about = about
    }
}
