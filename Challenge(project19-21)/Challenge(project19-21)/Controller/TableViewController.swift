//
//  ViewController.swift
//  Challenge(project19-21)
//
//  Created by Pedro Neto on 25/02/21.
//

import UIKit

class TableViewController: UITableViewController {
    
    var notes = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(createNote))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(deleteAllNotes))

        title = "Notes"
        
        loadNotes()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isToolbarHidden = true
    }
    
    @objc
    func deleteAllNotes() {
        let ac = UIAlertController(
            title: "Delete All Notes",
            message: "Are you sure? There's no turning back.",
            preferredStyle: .alert
        )
        ac.addAction(UIAlertAction(title: "Delete", style: .destructive) { _ in
            self.notes = []
            self.saveNotes()
            self.tableView.reloadData()
        })
        
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(ac, animated: true)
    }
    
    
    // MARK:- Create Note Methods
    
    @objc func createNote() {
        let ac = UIAlertController(title: "Create a new note", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        let submitAction = UIAlertAction(title: "OK", style: .default) { [weak self, weak ac] _ in
            guard let note = ac?.textFields?[0].text else { return }
            self?.submit(note)
        }
        
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        ac.addAction(submitAction)
        present(ac, animated: true)
    }
    
    func submit(_ answer: String) {
        notes.insert(answer, at: notes.count)
        tableView.reloadData()
        saveNotes()
        
        return
    }
    
    
    // MARK:- Save and load Methods
    
    func saveNotes() {
        let jsonEncoder = JSONEncoder()
        
        if let savedData = try? jsonEncoder.encode(notes) {
            let defaults = UserDefaults.standard
            defaults.set(savedData, forKey: "savedNotes")
        } else {
            print("Failed to save notes")
        }
    }
    
    func loadNotes() {
        let defaults = UserDefaults.standard
        
        if let savedNotes = defaults.object(forKey: "savedNotes") as? Data {
            let jsonDecoder = JSONDecoder()
            do {
                notes = try jsonDecoder.decode([String].self, from: savedNotes)
                tableView.reloadData()
            } catch {
                print("Failed to load notes")
            }
        }
    }
    
    
    // MARK:- TableView Methods
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath)
        
        cell.textLabel?.text = notes[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "DetailVC") as? DetailViewController {
            
            vc.noteName = notes[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

