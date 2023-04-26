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
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    
    struct Question {
        var question: String = ""
    }
    
    var questions: [Question] = [
        Question(question: "What is 5 + 5"),
        Question(question: "What is 4 * 8"),
        Question(question: "What is 9 - 3")
    ]
    var numArray = [1, 2, 3]
    
    var currentQuestionIndex = 0
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayCurrentQuestion()
        titleLabel.text = "Multiple Choice Quiz! \nRemember to enter your answers with capital letters"
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
                self.myLabel2.text = ""
                self.textField.text = ""
                self.scoreLabel.text = "Your final score is \(self.score)/\(self.questions.count)"
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
                self.myLabel.text = "Quiz Completed!"
                self.myLabel2.text = ""
                self.textField.text = ""
                self.scoreLabel.text = "Your final score is \(self.score)/\(self.questions.count)!"
            }
        }
        alert.addAction(dismiss)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func submitButton(_ sender: UIButton) {
        var x = 0
        while x < questions.count {
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
            titleLabel.text = "\(score)/\(questions.count)"
            x += 1
        }
    }
}

