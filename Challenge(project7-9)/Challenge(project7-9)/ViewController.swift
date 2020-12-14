//
//  ViewController.swift
//  Challenge(project7-9)
//
//  Created by Pedro Neto on 14/12/20.
//



import UIKit

class ViewController: UIViewController {
    
    var allWords = [String]()
    var randomWord = ""
    var usedLetters = [String]()
    var score = 0
    var chances = 7
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(restartGame))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(getAnswer))
        
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
        
        //        randomWord = allWords.randomElement()!
        randomWord = "Rhythm"
        usedLetters.removeAll()
        title = ""
        score = 0
        chances = 7
        
        for _ in randomWord {
            title! += "_ "
        }
    }
    
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
        title = ""
        
        if randomWord.contains(answer) {
            usedLetters.insert(answer, at: 0)
            score += 1
        } else {
            chances -= 1
        }
        
        if chances > 0 {
            for letter in randomWord {
                let strLetter = String(letter)
                if usedLetters.contains(strLetter) {
                    title! += strLetter + " "
                } else {
                    title! += "_ "
                }
            }
            
        } else {
            endGame(title: "Game Over!", message: "Sorry you guessed wrong too many times")
        }
        if score == randomWord.count - 1 {
            endGame(title: "Gratz", message: "You saved the poor man")
            
        }
    }
    
    func endGame(title: String, message: String) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Play Again!", style: .default, handler: nil))
        present(ac, animated: true)
        
        restartGame()
        
    }
    
}

/* MARK: - To do
 Ideas Todo
 
 find images to represent each error
 add a label for the word
 add a keyboard in the screen with disabling letters as touched
 
 */
