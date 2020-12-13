//
//  ViewController.swift
//  Project7
//
//  Created by Pedro Neto on 02/12/20.
//

import UIKit

class ViewController: UITableViewController {
    
    var petitions = [Petition]()
    var nonFilterArray = [Petition]()
    var filterArray = [Petition]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "exclamationmark.icloud"), style: .plain, target: self, action: #selector(showAlert))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(inputFilter))
        
        performSelector(inBackground: #selector(fetchJSON), with: nil)

    }
    
    @objc func fetchJSON() {
        //        let urlString = "https://api.whitehouse.gov/v1/petitions.json?limit=100"
        let urlString: String
        
        if navigationController?.tabBarItem.tag == 0 {
            urlString =
                "https://api.whitehouse.gov/v1/petitions.json?signatureCountFloor=1000&limit=100"
            
        } else {
            urlString =
                "https://api.whitehouse.gov/v1/petitions.json?signatureCountFloor=1000&limit=100"
        }
        

            if let url = URL(string: urlString) {
                if let data = try? Data(contentsOf: url) {
                    parse(json: data)
                    return
                }
            }
        performSelector(onMainThread: #selector(showError), with: nil, waitUntilDone: false)
    }
    //MARK: - Alerts functions
    @objc func showAlert() {
        let ac = UIAlertController(title: "Data Origin", message: "The data comes from the We The People API of the Whitehouse", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    
    @objc func showError() {
            let ac = UIAlertController(title: "Loading error", message: "There was a problem loading the feed; please check your connection and try agian.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
    }
    
    @objc func inputFilter() {
        let ac = UIAlertController(title: "Filter", message: "", preferredStyle: .alert)
        ac.addTextField { (textField) in
            textField.placeholder = "Enter the filter"
        }
        
        let submitAction = UIAlertAction(title: "Filter", style: .default) {
            [weak self, weak ac] _ in
            guard let answer = ac?.textFields?[0].text else { return }
            self?.filterPetitions(answer)
        }
        
        ac.addAction(submitAction)
        present(ac, animated: true)
    }
    
    func filterPetitions(_ answer: String) {
        for petition in petitions {
            if petition.title.contains(answer) || petition.body.contains(answer){
                filterArray.insert(petition, at: 0)
                
            }
        }
        petitions = filterArray
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(unFilter))
        tableView.reloadData()
        
    }
    
    @objc func unFilter() {
        petitions = nonFilterArray
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(inputFilter))
        tableView.reloadData()
        
    }
    
    func parse(json: Data) {
        let decoder = JSONDecoder()
        
        if let jsonPetitions = try? decoder.decode(Petitions.self, from: json) {
            nonFilterArray = jsonPetitions.results
            petitions = nonFilterArray
            tableView.performSelector(onMainThread: #selector(UITableView.reloadData), with: nil, waitUntilDone: false)
            
        } else {
            performSelector(onMainThread: #selector(showError), with: nil, waitUntilDone: false)
        }
    }
    
    //MARK: - tableView functions
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petitions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let petition = petitions[indexPath.row]
        cell.textLabel?.text = petition.title
        cell.detailTextLabel?.text = petition.body
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.detailItem = petitions[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

