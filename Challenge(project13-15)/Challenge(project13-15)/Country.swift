//
//  Country.swift
//  Challenge(project13-15)
//
//  Created by Pedro Neto on 01/01/21.
//

import Foundation

struct Country: Codable {
    let name: String
    let capital: String
    let subregion: String
    let population: Int
    
    var currencies: [Currency]?
    var languages: [Language]
    let flag: String
    
}

struct Currency: Codable {
    let name: String?
    let code: String?
    let symbol: String?
}

struct Language: Codable {
    let name: String
}



