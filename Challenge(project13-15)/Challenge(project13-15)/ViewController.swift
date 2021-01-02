//
//  ViewController.swift
//  Challenge(project13-15)
//
//  Created by Pedro Neto on 01/01/21.
//

import UIKit

class ViewController: UITableViewController {

    var contries = [Country]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: nil)
        
        loadJsonFromWeb()

    }
    
    //MARK: - load and decode data from web
    func loadJsonFromWeb() {
        let urlString = "https://restcountries.eu/rest/v2/all?fields=name;capital;currencies;subregion;population;languages;flag"
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                parse(json: data)
                return
            }
        }
        print("Error loading URL")
    }
    
    func parse(json: Data) {
        let decoder = JSONDecoder()
        
        if let jsonContries: [Country] = try? decoder.decode([Country].self, from: json) {
            contries.append(contentsOf: jsonContries)
            tableView.reloadData()
        }
    }
    
//    MARK: - tableView Functions
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "DetailViewController") as? DetailViewController {
            vc.selectedCountry = contries[indexPath.row]
            print(contries[indexPath.row].flag)
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountriesList", for: indexPath)
        let country = contries[indexPath.row]
        cell.textLabel?.text = country.name
//        cell.detailTextLabel?.text = country.capital
        
        return cell
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contries.count
    }
}

