//
//  ViewController.swift
//  Project1
//
//  Created by Pedro Neto on 19/10/20.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [String]()
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Storm Viewer"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: (nil))
        
        DispatchQueue.global().async { [weak self] in
            self?.loadImages()

            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
//        performSelector(inBackground: #selector(loadImages), with: nil)
        

    }
    
    @objc func loadImages() {
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
        pictures = pictures.sorted()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = "Picture \(indexPath.row + 1) of \(pictures.count)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            let picture = pictures[indexPath.row]
            vc.selectedImage = picture
            count = 0
        
//            load count from default
            let defaults = UserDefaults.standard
            if let savedCount = defaults.object(forKey: picture) as? Data {
                let jsonDecoder = JSONDecoder()
                
                do {
                    count = try jsonDecoder.decode(Int.self, from: savedCount)
                } catch {
                    print("Failed to load data")
                }
            }
            
            save(picture)
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func save(_ picture: String) {
        count += 1
        let jsonEncoder = JSONEncoder()
        
        if let savedData = try? jsonEncoder.encode(count) {
            let defaults = UserDefaults.standard
            defaults.set(savedData, forKey: picture)
        } else {
            print("Failed to save data")
        }
        print("\(picture) was viewed \(count) times")
    }
    
}

