//
//  ViewController.swift
//  Challenge(project10-12)
//
//  Created by Pedro Neto on 21/12/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    
//    var tableViewController = TableViewController()
    
    var name: String?
    var photo: UIImage?
    var photosArray: Photo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(didChooseEdit))
        title = name ?? ""
        imageView.image = photo
    }
//
//    @objc func didChooseEdit() {
//
//        let ac = UIAlertController(title: "Rename Image", message: nil, preferredStyle: .alert)
//        ac.addTextField()
//        ac.addAction(UIAlertAction(title: "Ok", style: .default) { [weak self, weak ac] _ in
//            guard let newName = ac?.textFields?[0].text else { return }
//
////            let photo = Photo(name: newName, image: imageName)
//            self?.photosArray?.name = newName
//            self?.title = newName
//            self?.tableViewController.save()
//            self?.tableViewController.tableView.reloadData()
//
//        })
//        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
//        present(ac, animated: true)
//
//    }

}
