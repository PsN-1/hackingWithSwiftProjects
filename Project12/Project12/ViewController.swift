//
//  ViewController.swift
//  Project12
//
//  Created by Pedro Neto on 20/12/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        
        defaults.set(25, forKey: "age")
        defaults.setValue(true, forKey: "UseFaceID")
        defaults.setValue(CGFloat.pi, forKey: "Pi")

        defaults.set("Pedro Neto", forKey: "Name")
        defaults.setValue(Date(), forKey: "LastRun")

        let array = ["Hello", "World"]
        defaults.setValue(array, forKey: "SavedArray")

        let dict = ["Name": "Pedro", "Country": "Brasil"]
        defaults.setValue(dict, forKey: "SavedDictionary")

        let savedInteger = defaults.integer(forKey: "Age")
        let savedBoolean = defaults.bool(forKey: "UseFaceID")

        let savedArray = defaults.object(forKey: "SavedArray") as? [String] ?? [String]()
        let SavedDictionary = defaults.object(forKey: "SavedDictionary") as? [String: String] ?? [String: String]()

    }

}
