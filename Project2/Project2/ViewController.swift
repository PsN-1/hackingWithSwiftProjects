//
//  ViewController.swift
//  Project2
//
//  Created by Pedro Neto on 19/10/20.
//

import UIKit

class ViewController: UIViewController, UNUserNotificationCenterDelegate {
    
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
        
        // Notifications
        registerLocal()
        scheduleLocal()
        
        // Load high record
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
        UIView.animate(withDuration: 0.2, delay: 0, animations: {
            sender.imageView?.transform = CGAffineTransform(scaleX: 1.2, y: 1.2);
        }) { finished in
            sender.imageView?.transform = .identity
            self.checkAnswer(sender)
        }
    }
    
    func checkAnswer(_ sender: UIButton){
        questionsAsked += 1
        
        if questionsAsked == 10 {
            sender.tag == correctAnswer ? (score += 1) : (score -= 1)
            
            if score > highestScore {
                highestScore = score
                save()
                presentAlert(title: "New Record!!", message: "Congratulation, you achieved a higher score")
            } else {
                presentAlert(title: "Finished!", message: "You final score is: \(score)")
            }
            score = 0
            questionsAsked = 0
            
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
    
    // MARK:- Save and load Records Methods
    func save() {
        //                highestScore = 0 // Reset db
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


    // MARK:- Local Notification Methods
    
    func registerLocal() {
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        
        center.requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if granted {
                print("Permission Granted")
            } else {
                print("Permission Not Granted")
            }
        }
    }

    func scheduleLocal() {
        let center = UNUserNotificationCenter.current()
        center.removeAllPendingNotificationRequests()
        
        let content = UNMutableNotificationContent()
        content.title = "Guess the Flag"
        content.body = "This is your daily reminder to play our awesome game!"
        content.categoryIdentifier = "alarm"
        content.sound = .default
        
        var dateComponents = DateComponents()
        dateComponents.hour = 9
        dateComponents.minute = 30
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        center.add(request)
    }
}
