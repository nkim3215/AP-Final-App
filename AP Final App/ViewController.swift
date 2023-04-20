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
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    struct Question {
        var question: String = ""
    }
    
    var questions: [Question] = [
        Question(question: "What is 5 + 5"),
        Question(question: "What is 4 * 8"),
        Question(question: "What is 9 - 3")
    ]
    
    var currentQuestionIndex = 0
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Multiple Choice Quiz!"
        displayCurrentQuestion()
    }
    
    func displayCurrentQuestion() {
        let currentQuestion = questions[currentQuestionIndex]
        myLabel.text = currentQuestion.question
        
        switch currentQuestionIndex {
        case 0:
            myLabel2.text = "A) 5 \nB) 10 \nC) 30 \nD) 4000"
        case 1:
            myLabel2.text = "A) 32 \nB) 2 \nC) 24 \nD) 100"
        case 2:
            myLabel2.text = "A) 13 \nB) 21 \nC) 6 \nD) 10"
        default:
            break
        }
    }
    
    func alertCorrect() {
        let alert = UIAlertController(title: "Correct!", message: nil, preferredStyle: .alert)
        let dismiss = UIAlertAction(title: "Next Question", style: .default) { (action) in
            print("User tapped on dismiss")
            self.view.backgroundColor = UIColor.white
            self.currentQuestionIndex += 1
            if self.currentQuestionIndex < self.questions.count {
                self.displayCurrentQuestion()
            } else {
                self.myLabel.text = "Quiz completed"
                self.myLabel2.text = nil
                self.scoreLabel.text = "Your final score is \(self.score)/3"
            }
        }
        alert.addAction(dismiss)
        present(alert, animated: true, completion: nil)
    }
    
    func alertIncorrect() {
        let alert = UIAlertController(title: "Incorrect!", message: nil, preferredStyle: .alert)
        let dismiss = UIAlertAction(title: "Next Question", style: .default) { (action) in
            print("User tapped on dismiss")
            self.view.backgroundColor = .white
            self.currentQuestionIndex += 1
            if self.currentQuestionIndex < self.questions.count {
                self.displayCurrentQuestion()
            } else {
                self.myLabel.text = "Quiz completed"
                self.myLabel2.text = nil
                self.textField.text = ""
                self.scoreLabel.text = "Your final score is \(self.score)/3"
            }
        }
        alert.addAction(dismiss)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func submitButton(_ sender: UIButton) {
        for x in questions {
//            let currentQuestion = questions[currentQuestionIndex]
            let answer = currentQuestionIndex == 0 ? "B" : currentQuestionIndex == 1 ? "A" : "C"
            if textField.text == answer {
                textField.text = ""
                view.backgroundColor = .green
                alertCorrect()
                score += 1
            }
            else {
                alertIncorrect()
                
                textField.text = ""
            }
        }
        
        for x in questions {
            
        }
    }
}

//    func Question1() {
//        myLabel.text = "What is 5 + 5"
//        myLabel2.text = "A) 5 \nB) 10 \nC) 30 \nD) Blueberry"
//    }
//    func Question2() {
//        myLabel.text = "What is 4 * 8"
//        myLabel2.text = "A) 32 \nB) 2 \nC) 24 \nD) 100"
//    }
//    func Question3() {
//        myLabel.text = "What is 9 - 3"
//        myLabel2.text = "A) 13 \nB) 21 \nC) 7 \nD) 10"
//    }
//
//    @IBAction func submitButton(_ sender: UIButton) {
//
//        for x in questions {
//            if textField.text == "A" {
//                textField.text = ""
//                self.view.backgroundColor = UIColor.green
//                alertCorrect()
//            }
//            else {
//                textField.text = ""
//                alertIncorrect()
//            }
//        }
//    }
//
//}

