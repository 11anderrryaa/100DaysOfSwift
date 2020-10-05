//
//  ViewController.swift
//  Project 2
//
//  Created by Ryan Anderson on 9/25/20.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var buttone2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var scores = 0
    var correctAnswer = 0
    var numberOfGuesses = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        countries += ["estonia","france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us" ]
        
        button1.layer.borderWidth = 1
        buttone2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        buttone2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
    }

    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        buttone2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
         title = "Guess:\(countries[correctAnswer].uppercased()) Score:\(scores)"
    }
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            scores += 1
            numberOfGuesses += 1
            if numberOfGuesses == 11 {
                return
            }
        } else {
            title = "Wrong"
            scores -= 1
            numberOfGuesses += 1
        }
        
        if numberOfGuesses < 11 { let ac = UIAlertController(title: title, message: "Your score is \(scores) out of \(numberOfGuesses).", preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        
        present(ac, animated: true)
        } else {
            let ac = UIAlertController(title: title, message: "Your score is \(scores) out of \(numberOfGuesses).", preferredStyle: .alert)
            
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            
            present(ac, animated: true)
        }
    }
    
}

