//
//  ViewController.swift
//  Challenge(project7-9)
//
//  Created by Pedro Neto on 14/12/20.
//



import UIKit

class ViewController: UIViewController {
    
    var scoreLabel: UILabel!
    var wordLabel: UILabel!
    
    var allWords = [String]()
    var randomWord = ""
    var usedLetters = [String]()
    var chances = 7
    var score = 0 {
        didSet {
            scoreLabel.text = "Score: \(score)"
        }
    }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        
        scoreLabel = UILabel()
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.textAlignment = .right
        scoreLabel.text = "Score: 0"
        view.addSubview(scoreLabel)
        
        wordLabel = UILabel()
        wordLabel.translatesAutoresizingMaskIntoConstraints = false
        wordLabel.textAlignment = .center
        wordLabel.font = UIFont.systemFont(ofSize: 42)
        wordLabel.text = "Hang Man"
        view.addSubview(wordLabel)

    
        NSLayoutConstraint.activate([
            scoreLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            scoreLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            wordLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            wordLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(restartGame))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(getAnswer))
        
        title = "The Hangman Game"
        loadWords()
        restartGame()
        
    }
    //MARK: - End of viewDidLoad
    func loadWords() {
        if let startWordsUrl = Bundle.main.url(forResource: "handManWords", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsUrl) {
                allWords = startWords.components(separatedBy: "\n")
            }
        }
    }
    //MARK: - BarButtonItens
    @objc func restartGame() {
        
        randomWord = allWords.randomElement()!
        //        randomWord = "Sleepy"
        usedLetters.removeAll()
        wordLabel.text = ""
        score = 0
        chances = 7
        
        for _ in randomWord {
            wordLabel.text! += "_ "
        }
    }
    //MARK: - Prompt answer alert
    @objc func getAnswer() {
        
        let ac = UIAlertController(title: "The Hangman Game!", message: "Type 1 letter" , preferredStyle: .alert)
        ac.addTextField()
        
        let submitAction = UIAlertAction(title: "Submit", style: .default) { [weak self, weak ac] _ in
            guard let answer = ac?.textFields?[0].text else { return }
            if answer.count == 1 {
                self?.submit(answer)
            } else {
                self!.getAnswer()
            }
        }
        
        ac.addAction(submitAction)
        present(ac, animated: true)
        
    }
    
    func submit(_ answer: String) {
        wordLabel.text = ""
        
        let lowerAnswer = answer.lowercased()
        let lowerWord = randomWord.lowercased()
        
        if lowerWord.contains(lowerAnswer) && !usedLetters.contains(lowerAnswer) {
            print(!usedLetters.contains(lowerAnswer))
            usedLetters.insert(lowerAnswer, at: 0)
            score += 1
        } else if usedLetters.contains(lowerAnswer) {
            presentAlert(title: "Already Typed", message: "You've already tried this letter", answer: "Try another")
            
        } else {
            chances -= 1
        }
        
        if chances > 0 {
            for letter in lowerWord {
                let strLetter = String(letter)
                if usedLetters.contains(strLetter) {
                    wordLabel.text! += strLetter + " "
                } else {
                    wordLabel.text! += "_ "
                }
            }
            
        } else {
            presentAlert(title: "Game Over!", message: "The word were: \(randomWord)", answer: "Play Again!")
            restartGame()
        }
        if score == randomWord.count - 1 {
            presentAlert(title: "Gratz!", message: "You saved the poor man", answer: "Try Again!")
            restartGame()
            
        }
    }
    
    func presentAlert(title: String, message: String, answer: String) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: answer, style: .default, handler: nil))
        present(ac, animated: true)
        
    }
    
}

/* MARK: - To do
 Ideas Todo
 
 find images to represent each error
 add a keyboard in the screen with disabling letters as touched
 */
