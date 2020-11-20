//
//  TableViewController.swift
//  Project4
//
//  Created by Pedro Neto on 20/11/20.
//

import UIKit

class TableViewController: UITableViewController {

    var websites = K.websites

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return websites.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Site", for: indexPath)
        cell.textLabel?.text = websites[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "Page") as? ViewController {
            vc.selectedSite = websites[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }

}
