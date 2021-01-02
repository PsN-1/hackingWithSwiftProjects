//
//  ViewController.swift
//  Challenge(project13-15)
//
//  Created by Pedro Neto on 01/01/21.
//

import UIKit

class ViewController: UITableViewController {
    
    var contries = [Country]()
    var nonFilterArray = [Country]()
    var filterArray = [Country]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(inputFilter))
        title = "REST Countries API"
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
            nonFilterArray.append(contentsOf: jsonContries)
            contries = nonFilterArray
            tableView.reloadData()
        }
    }
    
    //MARK: - Filter functions
    
    @objc func inputFilter() {
        let ac = UIAlertController(title: "Filter", message: nil, preferredStyle: .alert)
        ac.addTextField { (textField) in
            textField.placeholder = "Type the country name"
        }
        
        let submitAction = UIAlertAction(title: "Filter", style: .default) { [weak self, weak ac] _ in
            guard let answer = ac?.textFields?[0].text else { return }
            self?.filterCountries(answer)
        }
        
        ac.addAction(submitAction)
        present(ac, animated: true)
    }
    
    func filterCountries(_ answer: String) {
        filterArray.removeAll()
        
        for country in contries {
            if country.name.lowercased().contains(answer.lowercased()) {
                filterArray.insert(country, at: 0)
            }
        }
        contries = filterArray
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(unFilter))
        tableView.reloadData()
    }
    
    @objc func unFilter() {
        contries = nonFilterArray
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(inputFilter))
        tableView.reloadData()
    }
    
    //    MARK: - tableView Functions
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "DetailViewController") as? DetailViewController {
            vc.selectedCountry = contries[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountriesList", for: indexPath)
        let country = contries[indexPath.row]
        cell.textLabel?.text = country.name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contries.count
    }
}

