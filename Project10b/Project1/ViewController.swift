//
//  ViewController.swift
//  Project1
//
//  Created by Pedro Neto on 19/10/20.
//

import UIKit

class ViewController: UICollectionViewController {
    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Storm Viewer"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: (nil))
        
        DispatchQueue.global().async { [weak self] in
            self?.loadImages()

            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
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
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Picture", for: indexPath) as? PictureCell else {
            fatalError("")
        }
        
        let picture = pictures[indexPath.row]
        cell.imageView.image = UIImage(named: picture)
        cell.name.text = picture

        cell.imageView.layer.borderColor = UIColor(white: 0, alpha: 0.3).cgColor
        cell.imageView.layer.borderWidth = 2
        cell.imageView.layer.cornerRadius = 3
        cell.layer.cornerRadius = 7
    
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = pictures[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}

