//
//  DetailViewController.swift
//  Challenge(project13-15)
//
//  Created by Pedro Neto on 01/01/21.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    
    @IBOutlet var webView: WKWebView!
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var capitalTextField: UITextField!
    @IBOutlet var subregionTextField: UITextField!
    @IBOutlet var populationTextField: UITextField!
    @IBOutlet var currenciesTextField: UITextField!
    @IBOutlet var langaguesTextField: UITextField!
    
    var selectedCountry: Country?
    var cells = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(selectedCountry!)
        title = selectedCountry?.name
        
        let fileURL:URL = URL(string: selectedCountry!.flag)!
        let req = URLRequest(url: fileURL)
        webView.load(req)
        print(selectedCountry!)
        
        nameTextField.text = selectedCountry?.name
        capitalTextField.text = selectedCountry?.capital
        subregionTextField.text = selectedCountry?.subregion
        populationTextField.text = String(selectedCountry!.population)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        webView.stopLoading()
    }
}
