//
//  ViewController.swift
//  AP Final App
//
//  Created by Nathan Kim on 4/6/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myLabel2: UILabel!
    
    @IBOutlet weak var textField: UITextField!
    
    var firstNumber = [2, 34, 4, 5]
    var secondNumber = [4, 8, 9, 7]
    var questions = [1, 2, 3, 4]
    override func viewDidLoad() {
        super.viewDidLoad()
        for x in questions {
            var sum = "\(firstNumber[x] + secondNumber[x])"
            var question = myLabel.text
            question = "\(firstNumber[x] + secondNumber[x])"
            var answer = textField.text
            
        }
    }
    
    func alertCorrect() {
        let alert = UIAlertController(title: title, message: "Correct!", preferredStyle: .alert)
        let dismiss = UIAlertAction(title: "Next Question", style: .default) { (action) in
            print("User tapped on dismiss")
            self.view.backgroundColor = UIColor.white
        }
        alert.addAction(dismiss)
        present(alert, animated: true, completion: nil)
    }
    func alertIncorrect() {
        let alert = UIAlertController(title: title, message: "Incorrect!", preferredStyle: .alert)
        let dismiss = UIAlertAction(title: "Next Question", style: .default) { (action) in
            print("User tapped on dismiss")
            self.view.backgroundColor = UIColor.white
        }
        alert.addAction(dismiss)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func submitButton(_ sender: UIButton) {
        
        for x in questions {
            if textField.text == "A" {
                textField.text = ""
                self.view.backgroundColor = UIColor.green
                alertCorrect()
            }
            else {
                textField.text = ""
                alertIncorrect()
            }
        }
    }
    
}

