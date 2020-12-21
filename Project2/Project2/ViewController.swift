//
//  ViewController.swift
//  Project2
//
//  Created by Pedro Neto on 19/10/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var questionsAsked = 0
    var correctAnswer = 0
    var highestScore = 0
    var score = 0 {
        didSet {
            navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Score \(score)", style: .done, target: self, action: #selector(showCurrentRecord))
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: nil)
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Score: 0", style: .done, target: self, action: #selector(showCurrentRecord))
        
        loadHighestScore()
        askQuestion()
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = "\(countries[correctAnswer].uppercased())"
        
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        questionsAsked += 1
        
        if questionsAsked == 10 {
            if score > highestScore {
                highestScore = score
                save()
                presentAlert(title: "New Record!!", message: "Congratulation, you achieved a higher score")
                score = 0
            } else {
                presentAlert(title: "Finished!", message: "You final score is: \(score)")
                score = 0
            }
            
        } else if sender.tag == correctAnswer {
            presentAlert(title: "Correct!", message: "")
            score += 1
            
        } else {
            presentAlert(title: "Wrong!", message: "That's the flag of \(countries[sender.tag].uppercased())")
            score -= 1
        }
    }
    
    func presentAlert(title: String, message: String) {
        
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        
        present(ac, animated: true)
    }
    
    func save() {
//        highestScore = 0 // Reset db
        let jsonEncoder = JSONEncoder()
        
        if let savedData = try? jsonEncoder.encode(highestScore) {
            let defaults = UserDefaults.standard
            defaults.set(savedData, forKey: "highestScore")
        } else {
            print("Failed to save data")
        }
    }
    
    @objc func showCurrentRecord() {
        let ac = UIAlertController(title: "Highest Score", message: "The current highest score is \(highestScore)", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "ok", style: .default))
        present(ac, animated: true)
    }
    
    func loadHighestScore() {
        let defaults = UserDefaults.standard
        if let savedScore = defaults.object(forKey: "highestScore") as? Data {
            let jsonDecoder = JSONDecoder()
            do {
                highestScore = try jsonDecoder.decode(Int.self, from: savedScore)
            } catch {
                print("Failed to load data")
            }
        }
    }
}

