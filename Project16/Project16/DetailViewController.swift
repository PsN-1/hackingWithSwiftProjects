//
//  DetailViewController.swift
//  Project16
//
//  Created by Pedro Neto on 04/01/21.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    @IBOutlet var webView: WKWebView!
    
    var capital: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = capital
        
        var url = URL(string: "https://pt.wikipedia.org/wiki")!
        if let city = capital?.lowercased() {
            url = URL(string: "https://pt.wikipedia.org/wiki/\(city)")!
        }
        
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
}

