//
//  Photo.swift
//  Challenge(project10-12)
//
//  Created by Pedro Neto on 21/12/20.
//

import UIKit

class Photo: NSObject, Codable {
    var name: String
    var image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}
