//
//  DetailViewController.swift
//  Challenge(project19-21)
//
//  Created by Pedro Neto on 25/02/21.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    
    var noteName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK:- Navigation Bar Configurations
        
        title = noteName
        
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let compose = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(composeTapped))
        let delete = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(deleteTapped))
        
        toolbarItems = [delete, spacer, compose]
        navigationController?.isToolbarHidden = false
        
        
        // MARK:- Notification Center, keyboard alert
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        
        
        loadNotes()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if self.isMovingFromParent {
            saveNotes()
        }
    }
    
    
    // MARK:- Selector methods
    
    @objc func shareTapped() {
        let vc = UIActivityViewController(activityItems: [noteName, textView.text ?? ""], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
    
    @objc func deleteTapped() {
        let ac = UIAlertController(title: "Delete all text", message: "Are you sure?", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Delete", style: .destructive) { _ in
            self.textView.text = ""
        })
        
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(ac, animated: true)
    }
    
    @objc func composeTapped() {
        textView.becomeFirstResponder()
    }
    
    @objc func adjustForKeyboard(notification: Notification) {
        guard let keyboardValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        
        let keyboardScreenEndFrame = keyboardValue.cgRectValue
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)
        
        if notification.name == UIResponder.keyboardWillHideNotification {
            textView.contentInset = .zero
        } else {
            textView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardViewEndFrame.height - view.safeAreaInsets.bottom, right: 0)
        }
        
        textView.scrollIndicatorInsets = textView.contentInset
        let selectedRange = textView.selectedRange
        textView.scrollRangeToVisible(selectedRange)
    }
    
    
    // MARK:- Save and Load Methods
    
    func saveNotes() {
        let jsonEncoder = JSONEncoder()
        
        if let savedData = try? jsonEncoder.encode(textView.text) {
            let defaults = UserDefaults.standard
            defaults.set(savedData, forKey: noteName)
        } else {
            print("Failed to save notes")
        }
    }
    
    func loadNotes() {
        let defaults = UserDefaults.standard
        
        if let savedNotes = defaults.object(forKey: noteName) as? Data {
            let jsonDecoder = JSONDecoder()
            do {
                textView.text = try jsonDecoder.decode(String.self, from: savedNotes)
            } catch {
                print("Failed to load notes")
            }
        }
    }
}
