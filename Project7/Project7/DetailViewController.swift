//
//  DetailViewController.swift
//  Project7
//
//  Created by Pedro Neto on 03/12/20.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    var webView: WKWebView!
    var detailItem: Petition?
    
    override func loadView() {
        webView = WKWebView()
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let detailItem = detailItem else { return }
        
        let html = """
        <html>
        <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style> body { font-size: 150% } </style>
        </head>
        <body>
        <div style="text-align: center;">
        \(detailItem.body)
        </div>
        </body>
        </html>
        """
        
        webView.loadHTMLString(html, baseURL: nil)
    }
    



}
