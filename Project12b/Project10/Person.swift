//
//  Person.swift
//  Project10
//
//  Created by Pedro Neto on 16/12/20.
//

import UIKit

class Person: NSObject, Codable {
    var name: String
    var image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}
