//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    var questionNumber : Int = 0
    var questions = QuestionBank()
    var pickedAnswer : Bool = true
    var score = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextQuestion()
    }

    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 { //true
            pickedAnswer = true
        }
        else { //false
            pickedAnswer = false
        }
        
        checkAnswer()
        nextQuestion()
    }
    
    func updateUI() {
        scoreLabel.text = "Score: \(score)"
        progressBar.frame.size.width = (view.frame.size.width / CGFloat(questions.list.count)) * CGFloat(questionNumber)
    }

    func nextQuestion() {
        updateUI()
        questionNumber += 1
        if questionNumber <= questions.list.count {
            questionLabel.text = questions.list[questionNumber-1].questionText
            progressLabel.text = "\(questionNumber) / \(questions.list.count)"
        }
        else { //restart
            let percentCorrect : Float = (Float(score) / Float(questions.list.count)) * Float(10000)
            let alert = UIAlertController(title: "You've finished!", message: "You answered \(percentCorrect.rounded()/100)% correct. Do you want to try again?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: {(UIAlert) in self.startOver()})
            
            alert.addAction(restartAction)
            
            present(alert, animated: true, completion: nil)
        }
    }
    
    func checkAnswer() {
        let correctAnswer = questions.list[questionNumber-1].correctAnswer
        
        if correctAnswer == pickedAnswer {
            ProgressHUD.showSuccess("Right!")
            score += 1
        }
        else {
            ProgressHUD.showError("Wrong!")
        }
    }
    
    func startOver() {
        questionNumber = 0
        score = 0
        nextQuestion()
    }
}
