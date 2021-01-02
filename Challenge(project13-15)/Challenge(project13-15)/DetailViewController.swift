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
    
    @IBOutlet var currencyLabel: UILabel!
    @IBOutlet var languagesLabel: UILabel!
    
    var selectedCountry: Country?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = selectedCountry?.name
        
        let html = """
        <html>
            <head>
                <meta name="viewport" content="width=device-width, initial-scale=1">
                <style> body, html {
                    height: 100%;
                  }
                  body {
                    background-image: url("\(selectedCountry!.flag)");
                    height: 100%;
                    background-position: center;
                    background-repeat: no-repeat;
                    background-size: cover;
                  }
                </style>
            </head>
            <body>
            </body>
        </html>
        """
        
        webView.loadHTMLString(html, baseURL: nil)
        
        nameTextField.text = selectedCountry?.name
        capitalTextField.text = selectedCountry?.capital
        subregionTextField.text = selectedCountry?.subregion
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let formattedPopulation = numberFormatter.string(from: NSNumber(value: selectedCountry!.population))
        populationTextField.text = formattedPopulation
        
        for currency in 0..<(selectedCountry?.currencies!.count)! {
            let coin = selectedCountry!.currencies![currency]
            if let cSymbol = coin.symbol, let cCode = coin.code, let cName = coin.name {
                currencyLabel.text! += "\(cSymbol) - \(cCode) (\(cName)). "
            }
        }
        
        for language in 0..<(selectedCountry?.languages.count)! {
            let idiom = selectedCountry!.languages[language]
            languagesLabel.text! += "\(idiom.name). "
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        webView.stopLoading()
    }
}
